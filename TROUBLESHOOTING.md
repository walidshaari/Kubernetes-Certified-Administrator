# Troubleshooting for the CKA

Troubleshooting is **30% of the CKA**, the largest single domain. Most courses and labs teach you to *build* things that work. The exam mostly hands you things that *don't*.

Building and diagnosing are different skills. Someone who can write a correct Deployment from memory can still stall on a Deployment that won't roll out. The way to close that gap is to break things on purpose and fix them under time pressure.

> What you are training is **not a list of causes**. It is a **decision tree**: for any broken thing, what do I look at first, what does each result rule out, and what do I look at next?

---

## Contents

- [1. The first-moves reflex](#1-the-first-moves-reflex)
- [2. When kubectl can't help: the node layer](#2-when-kubectl-cant-help-the-node-layer)
- [3. The wrong-context trap](#3-the-wrong-context-trap)
- [4. The break-and-fix method](#4-the-break-and-fix-method)
- [5. Scenario bank](#5-scenario-bank)
- [6. Reading common symptoms](#6-reading-common-symptoms)
- [7. Timed diagnosis](#7-timed-diagnosis)
- [8. Practice questions](#8-practice-questions)

---

## 1. The first-moves reflex

Whatever is broken, the opening sequence is short and almost always the same. Drill it until you don't have to think about it.

```bash
kubectl get <resource> -n <ns> -o wide                         # state, restart counts, which node
kubectl describe <resource> <name> -n <ns>                     # read the Events block at the bottom
kubectl logs <pod> -n <ns>                                     # what the application said
kubectl logs <pod> -n <ns> --previous                          # what it said before it crashed and restarted
kubectl get events -n <ns> --sort-by=.metadata.creationTimestamp
```

For a Pod with several containers, add `-c <container>` to `logs`.

**The Events section of `kubectl describe` answers most exam troubleshooting tasks.** It is the first place to look, and the last place many people look.

What each step rules in or out:

| Command | If it shows... | Then... |
|---|---|---|
| `get` | `Pending` | The Pod was never started. Look at scheduling (Events), not at logs. There are no logs yet. |
| `get` | `ImagePullBackOff` / `ErrImagePull` | Image name, tag, or registry credentials. Events give the exact pull error. |
| `get` | `CrashLoopBackOff`, rising restarts | The container starts and dies. Go to `logs --previous`. |
| `get` | `Running` but not `READY` | Readiness probe is failing. The Pod is excluded from its Service. Check `describe`. |
| `get` | `Running` and `READY`, but traffic fails | Probably not the Pod. Move to the Service, its endpoints, and NetworkPolicy. |
| `describe` | `OOMKilled` in Last State | Memory limit is too low for the workload. |
| `logs` | Nothing useful | The failure happened before the app logged anything. Back to `describe` and Events. |

---

## 2. When kubectl can't help: the node layer

`kubectl` talks to the API server. When the API server itself, the kubelet, or etcd is broken, `kubectl` can't tell you why, because the broken thing is what serves `kubectl`. Go to the node:

```bash
ssh <node>
sudo systemctl status kubelet                      # is the kubelet running at all?
sudo journalctl -u kubelet --no-pager | tail -50   # why the kubelet is unhappy
sudo crictl ps -a                                  # containers the kubelet started, including exited ones
sudo crictl logs <container-id>                    # logs of a control plane container
ls /etc/kubernetes/manifests/                      # static Pod manifests (kubeadm default location)
sudo grep staticPodPath /var/lib/kubelet/config.yaml   # confirm the manifest directory
sudo kubeadm certs check-expiration                # expired certificates
```

A **static Pod** is a Pod the kubelet runs directly from a file on the node, without going through the API server. On kubeadm clusters, the API server, scheduler, controller manager and etcd all run this way. A typo in one of those manifests takes that component down, and the kubelet keeps retrying quietly.

On clusters where `kubectl` still works, `kubectl debug node/<node> -it --image=busybox` gives you a shell on the node without SSH.

---

## 3. The wrong-context trap

The exam uses several clusters. Each task tells you which context to use.

**If you solve a task on the wrong cluster, you get no error message and zero points.**

Make this the first command of every task, even when you think you're already there:

```bash
kubectl config use-context <context-from-the-task>
kubectl config current-context
```

---

## 4. The break-and-fix method

After you have built something correctly, don't move on. Break it.

1. **Build it so it works.** Confirm it works.
2. **Break it.** Pick one fault from the [scenario bank](#5-scenario-bank). If you study with someone else, let them pick without telling you, and give you only the symptom.
3. **Diagnose out loud, one command at a time.** Before running each command, say what you expect it to show. This is the part that builds the decision tree.
4. **Fix it.**
5. **Log it** in your [`failures.md`](templates/failures.md): symptom first, then cause, then the command that revealed it. You will meet it again as a symptom, so file it that way.

**If you jump straight to a guess and it happens to be right, count it as a miss.** On exam day the guess won't land, and you'll have no path to fall back on.

---

## 5. Scenario bank

Introduce **one fault at a time**.

### Workload layer
- Image name misspelled, or a tag that doesn't exist
- Private registry with no `imagePullSecret`
- Resource requests larger than any node can satisfy
- Container `command` or `args` that exit immediately
- Liveness probe pointing at the wrong port or path
- Readiness probe that never passes, so the Pod never joins its Service
- ConfigMap or Secret referenced but never created
- Key name mismatch between a Secret and the Pod spec that reads it
- Wrong `restartPolicy` on a Job
- Deployment stuck mid-rollout behind a failing readiness probe
- Memory limit too low, so the container is `OOMKilled`

### Scheduling layer
- Node cordoned and forgotten
- Taint with no matching toleration
- `nodeSelector` referencing a label no node has
- Node affinity rule no node satisfies
- Not enough CPU or memory anywhere in the cluster
- A bare Pod (no Deployment) on a deleted node: nothing recreates it, because nothing owns it
- ResourceQuota in the namespace blocks new Pods

### Networking layer
- **Service selector doesn't match the Pod labels** (the most common one, practise it on its own)
- Service `targetPort` doesn't match the container port
- Wrong Service type for what the task asks
- DNS failing because CoreDNS isn't healthy
- NetworkPolicy that blocks the traffic you're testing
- Ingress with no matching host or path rule, or no Ingress controller installed
- Gateway API `HTTPRoute` whose `parentRefs` point at the wrong Gateway

### Storage layer
- PVC requesting a StorageClass that doesn't exist
- No default StorageClass, and the PVC doesn't name one
- Access mode the backing storage can't provide
- PVC and PV size, access mode, or StorageClass mismatch
- Pod scheduled to a node that can't reach the volume (local volumes)

### Cluster layer
- Static Pod manifest edited into an invalid state
- Kubelet stopped, or its configuration broken
- Certificate expired
- etcd unreachable, or etcd static Pod pointing at the wrong data directory
- Upgrade started and left half-finished (version skew between nodes)
- **Wrong kubeconfig context**: correct fix, wrong cluster. See [section 3](#3-the-wrong-context-trap).

---

## 6. Reading common symptoms

| Symptom | First command | Usual causes |
|---|---|---|
| Pod `Pending` | `kubectl describe pod` | Insufficient resources, taints, nodeSelector/affinity, unbound PVC, quota |
| `ImagePullBackOff` | `kubectl describe pod` | Wrong image or tag, missing pull secret, registry unreachable |
| `CrashLoopBackOff` | `kubectl logs --previous` | App error, bad command/args, missing config, failing liveness probe |
| `CreateContainerConfigError` | `kubectl describe pod` | Missing ConfigMap/Secret or missing key |
| Running but not Ready | `kubectl describe pod` | Readiness probe failing |
| Service not reachable | `kubectl get endpointslices -l kubernetes.io/service-name=<svc>` | Selector mismatch, wrong targetPort, no Ready Pods, NetworkPolicy |
| DNS lookup fails | `kubectl get pods -n kube-system -l k8s-app=kube-dns` | CoreDNS down, NetworkPolicy blocking port 53 |
| PVC `Pending` | `kubectl describe pvc` | Missing StorageClass, no default, no matching PV, `WaitForFirstConsumer` with no Pod yet |
| Node `NotReady` | `journalctl -u kubelet` on the node | Kubelet stopped, CNI not installed, container runtime down, certificates |
| `kubectl` hangs or refuses | `crictl ps -a` on the control plane | API server static Pod broken, etcd down, certificates expired |

Note: a PVC waiting on `WaitForFirstConsumer` is `Pending` **by design** until a Pod uses it. That is not a fault.

---

## 7. Timed diagnosis

Once your diagnostic path is solid, add a clock: **three minutes per scenario, from symptom to root cause.**

Speed here doesn't come from typing faster. It comes from not wasting moves: going to `describe` instead of re-reading the manifest, and reading Events instead of guessing at the spec.

---

## 8. Practice questions

Practise with scenarios, not definitions.

- **Weak:** "What does a readiness probe do?"
- **Exam-like:** "The Deployment in namespace `web` shows 3/3 Pods Running, but requests to its Service time out. Nothing is in CrashLoopBackOff. What is your first command, and what will it tell you?"

After each attempt, ask yourself:

- Was the diagnosis correct?
- Was the **path** correct, or did I guess and get lucky?
- Was it fast enough for a two-hour exam?
- Which moves could I have skipped?

A few to start with:

1. A new Pod in namespace `batch` has been `Pending` for five minutes. `kubectl describe` shows `0/3 nodes are available: 3 node(s) had untolerated taint`. What do you check next, and what are your two ways to fix it?
2. `kubectl get nodes` hangs on the control plane node. What do you run next, and where?
3. A PVC in namespace `data` is `Pending`, and there are no events on it. What is the first thing you check?
4. A Pod shows `Running` and `1/1`, but another Pod in the same namespace can't reach it by Service name. Walk the path from DNS to the endpoints.

Official references: [Troubleshooting applications](https://kubernetes.io/docs/tasks/debug/debug-application/), [Troubleshooting clusters](https://kubernetes.io/docs/tasks/debug/debug-cluster/), [Debug Services](https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/), [DNS debugging](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/).
