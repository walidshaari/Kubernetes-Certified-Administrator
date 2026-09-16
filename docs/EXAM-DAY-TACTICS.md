# Exam-day tactics

These are **habits**. They need repetition in the weeks before the exam, not a read-through the night before.

> Exam rules change. Before relying on anything here, check the current [CKA/CKAD/CKS FAQ](https://docs.linuxfoundation.org/tc-docs/certification/faq-cka-ckad-cks) and the Candidate Handbook.

## The exam in brief

- Performance-based: a real terminal against real clusters, no multiple choice.
- About two hours.
- Open book against the official Kubernetes documentation (kubernetes.io and its subdomains, the Kubernetes GitHub repo and blog). Not general web search, not your own notes.
- Several clusters. Each task tells you which context to use.
- Tasks are weighted independently and can be done in any order.

## 1. Switch context before every task

Run the context command from the task before you touch anything, every time. A correct answer on the wrong cluster scores zero, and nothing warns you.

```bash
kubectl config use-context <context-from-the-task>
```

## 2. Skip and come back

Tasks are weighted independently. A task that isn't moving after a few minutes is worth less than two easy ones. Flag it, move on, come back at the end.

## 3. Generate YAML instead of writing it

```bash
export do="--dry-run=client -o yaml"
kubectl create deployment web --image=nginx --replicas=3 $do > web.yaml
# edit only the fields the task asks for, then:
kubectl apply -f web.yaml
```

This is the highest-leverage habit on the exam: faster and less error-prone than writing a manifest from scratch. For objects that have no imperative generator (PV, PVC, NetworkPolicy, StorageClass), copy the example from kubernetes.io.

## 4. Use `kubectl explain` for field names

```bash
kubectl explain pod.spec.containers --recursive | less
kubectl explain pvc.spec
```

Usually faster than searching the docs for where a field nests.

## 5. Set up your shell the same way you practise

The exam terminal may already provide the `k` alias and completion. Check at the start, and add what's missing:

```bash
alias k=kubectl
source <(kubectl completion bash)
complete -o default -F __start_kubectl k
export do="--dry-run=client -o yaml"
```

Practise with exactly this setup, so it's automatic on the day.

## 6. Verify, then move on

After each task, run one command that confirms the object is in the state the task asked for. Don't re-read the task; check the cluster.

```bash
k get deploy web -n <ns>
k get pvc -n <ns>
k auth can-i list pods --as=system:serviceaccount:<ns>:<sa> -n <ns>
```

## 7. Use the simulator sessions as dress rehearsals

Exam registration includes **two killer.sh simulator sessions**. Each session gives you a time-limited access window (36 hours at the time of writing) once you activate it.

- **Don't use one early "to see where you stand."** The simulator is deliberately harder than the real exam, and the questions don't change between sessions, so a session used before you're ready is mostly wasted.
- Take them **close to the exam date**, as full timed runs under exam conditions.
- For practice before then, use the free [Killercoda CKA scenarios](https://killercoda.com/killer-shell-cka) or other practice material.

## 8. Know your docs routes

Navigating kubernetes.io quickly is a graded skill in itself. Keep a list of the pages you actually use and the search terms that get you there. See [`templates/docs-breadcrumbs.md`](../templates/docs-breadcrumbs.md).
