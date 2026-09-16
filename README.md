[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-sa/4.0/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# Kubernetes Certified Administration

Online resources that will help you prepare for taking the Kubernetes Certified Administrator Certification exam.

## Study guides in this repo

Beyond the curriculum links, these cover method: how to diagnose problems and how to study.

- [TROUBLESHOOTING.md](TROUBLESHOOTING.md) - the first-moves reflex, a break-and-fix scenario bank, symptom table and practice questions for the 30% Troubleshooting domain
- [Common misconceptions](docs/MISCONCEPTIONS.md) - things study material often gets wrong
- [Exam-day tactics](docs/EXAM-DAY-TACTICS.md) - context switching, generating YAML, verifying, and using the simulator sessions well
- [Study method](docs/STUDY-METHOD.md) - a learn, break, fix, log loop, with [note templates](templates/)
- [Linux Foundation LF ACE path](docs/LF-ACE-PATH.md) - how LFS158, LFS253 and LFS258 map to the CKA domains

**Disclaimer**: This is not likely a comprehensive list as the exam will be a moving target with the fast pace of k8s development - please make a pull request if there something wrong, should be added, or updated.

I tried to restrict the cross references of resources to [kubernetes.io](https://kubernetes.io/docs/). Youtube videos and other blog resources are optional; however, I still found them useful in my k8s learning journey.

Ensure you have the right version of Kubernetes documentation selected (v1.35 as of the September 2026 exam environment) especially for API objects and annotations.

TL;DR:  **practice**       **practice**      **practice**

## Other CK exams:
- [Certified Kubernetes Security Specialist CKS](https://github.com/walidshaari/Certified-Kubernetes-Secuirty-Specialist)
- [Certified Kubernetes Application Developer CKAD](https://github.com/dgkanatsios/CKAD-exercises)

## CKA Exam Objectives

These are the exam objectives you review and understand in order to pass the test.

* [CNCF Exam Curriculum repository](https://github.com/cncf/curriculum) - the authoritative source. The current file is [CKA_Curriculum_v1.35.pdf](https://github.com/cncf/curriculum/blob/master/CKA_Curriculum_v1.35.pdf).

| | |
|---|---|
| Exam environment | Kubernetes v1.35 |
| Duration | 2 hours |
| Passing score | 66% |
| Included | 2 exam attempts, 2 Killer.sh simulator sessions |
| Validity | 2 years |

The exam environment is aligned with the most recent Kubernetes minor release within roughly 4 to 8 weeks of that release, so confirm the version in the [CKA/CKAD/CKS FAQ](https://docs.linuxfoundation.org/tc-docs/certification/faq-cka-ckad-cks) and on the [CKA certification page](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/) before you sit it.

### What changed from the older curriculum

If you studied from an older version of this README or an older course, these are the differences that matter. Items marked **new** were not in the previous curriculum at all.

* **Helm and Kustomize** are now an explicit, hands-on Cluster Architecture item, not the old "awareness of manifest management and common templating tools" bullet under Workloads.
* **CRDs and operators** are **new**: you are expected to install and configure an operator, not just recognise the pattern.
* **Extension interfaces (CNI, CSI, CRI)** are **new** as a concept item. The old "choose an appropriate CNI plugin" bullet under Networking was folded into this.
* **Gateway API** is **new** under Services and Networking, alongside Ingress rather than replacing it.
* **Network Policies** are now called out explicitly ("define and enforce"), where previously they were not listed for CKA at all.
* **Workload autoscaling** (HorizontalPodAutoscaler) is **new** under Workloads and Scheduling.
* **Pod admission and scheduling** replaces the narrower "understand how resource limits can affect Pod scheduling".
* Dropped: "provision underlying infrastructure" became "prepare underlying infrastructure", "understand host networking configuration on the cluster nodes" is gone, and the standalone "know how to scale applications" bullet was folded into autoscaling.

Domain weights are unchanged: Troubleshooting 30%, Cluster Architecture 25%, Services and Networking 20%, Workloads and Scheduling 15%, Storage 10%.

### [Cluster Architecture, Installation and Configuration](https://youtu.be/vS-wXo2qbPs) - 25%

1. [Manage role based access control (RBAC)](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
    - [ServiceAccounts](https://kubernetes.io/docs/concepts/security/service-accounts/) and [configuring a Pod to use one](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)
    - [Checking API access with kubectl auth can-i](https://kubernetes.io/docs/reference/access-authn-authz/authorization/#checking-api-access)
1. [Prepare underlying infrastructure for installing a Kubernetes cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
    - [Container runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) - cgroup driver, required ports, kernel modules and sysctls
1. [Create and manage Kubernetes clusters using kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
    - [kubeadm reference](https://kubernetes.io/docs/reference/setup-tools/kubeadm/), [kubeadm init](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/), [kubeadm join](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-join/)
1. [Manage the lifecycle of Kubernetes clusters](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
    - [Upgrading Linux nodes](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/upgrading-linux-nodes/)
    - [Certificate management with kubeadm](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-certs/)
    - [Operating etcd clusters - backup and restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/)
1. [Implement and configure a highly-available control plane](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)
    - [Options for highly available topology](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/ha-topology/) - stacked vs external etcd
    - [Cluster components](https://kubernetes.io/docs/concepts/overview/components/) and [architecture](https://kubernetes.io/docs/concepts/architecture/)
1. Use **Helm** and **Kustomize** to install cluster components
    - [Kustomize - declarative management of objects](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
    - [Managing Kubernetes objects](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/)
    - Non-k8s.io resource: [Using Helm](https://helm.sh/docs/intro/using_helm/) and [Helm charts](https://helm.sh/docs/topics/charts/)
    - [Installing addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/)
1. Understand **extension interfaces (CNI, CSI, CRI, etc.)**
    - [Network plugins (CNI)](https://kubernetes.io/docs/concepts/extend-kubernetes/compute-storage-net/network-plugins/)
    - [CSI volumes](https://kubernetes.io/docs/concepts/storage/volumes/#csi)
    - [Container Runtime Interface (CRI)](https://kubernetes.io/docs/concepts/architecture/cri/)
1. Understand **CRDs, install and configure operators**
    - [Custom resources](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
    - [Extend the Kubernetes API with CustomResourceDefinitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/)
    - [CRD versioning](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definition-versioning/)
    - [Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)

    [Kubecon Europe 2020: Kubeadm deep dive](https://youtu.be/DhsFfNSIrQ4)
  <details>
  <summary> sample commands used during backup/restore/update of nodes </summary>
  <p>

  ```
  # etcd backup and restore
  # ETCDCTL_API=3 is the default from etcd 3.4 onwards, but setting it explicitly is harmless
  etcdctl snapshot save -h   # find save options
  etcdutl snapshot restore -h  # find restore options

  # save a snapshot - against a TLS-enabled etcd you must pass the endpoint AND the ca/cert/key.
  # Omitting --endpoints silently falls back to 127.0.0.1:2379, which is not always where etcd listens.
  ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
    --cacert=/etc/kubernetes/pki/etcd/ca.crt \
    --cert=/etc/kubernetes/pki/etcd/server.crt \
    --key=/etc/kubernetes/pki/etcd/server.key \
    snapshot save /backup/snapshot.db

  # verify the snapshot
  etcdutl --write-out=table snapshot status /backup/snapshot.db

  # restore into a NEW data directory.
  # NOTE: `etcdctl snapshot restore` is deprecated since etcd 3.5 and removed in etcd 3.6 - use etcdutl.
  etcdutl --data-dir /var/lib/etcd-restore snapshot restore /backup/snapshot.db

  # then point the static pod at the restored data directory and let the kubelet restart it:
  #   edit /etc/kubernetes/manifests/etcd.yaml and set volumes.hostPath.path
  #   for the volume named `etcd-data` to /var/lib/etcd-restore


  # evicting pods/nodes and bringing a node back into the cluster
  kubectl drain <node> --ignore-daemonsets   # drain a node (DaemonSet pods cannot be evicted)
  kubectl uncordon <node>                    # return a node to the cluster as schedulable
  kubectl cordon <node>                      # stop scheduling new pods on a node


  # upgrade a kubernetes WORKER node (Debian/Ubuntu, run on the node itself unless noted)
  # 0. point the package repository at the target minor version.
  #    pkgs.k8s.io has one repository per MINOR version, so without this
  #    `apt-get install kubeadm='1.35.x-*'` cannot find the package at all.
  #    Only needed when crossing a minor version (1.34 -> 1.35), not for
  #    a patch bump within the same minor (1.35.5 -> 1.35.7).
  #    Debian/Ubuntu: /etc/apt/sources.list.d/kubernetes.list
  #    RHEL/Fedora:   /etc/yum.repos.d/kubernetes.repo
  sudo sed -i 's#/v1.34/#/v1.35/#' /etc/apt/sources.list.d/kubernetes.list
  # find the exact patch version available in that repository
  sudo apt update && sudo apt-cache madison kubeadm
  # 1. upgrade kubeadm and kubectl
  sudo apt-mark unhold kubeadm kubectl && \
    sudo apt-get update && sudo apt-get install -y kubeadm='1.35.x-*' kubectl='1.35.x-*' && \
    sudo apt-mark hold kubeadm kubectl
  # 2. upgrade the local kubelet config
  sudo kubeadm upgrade node
  # 3. drain the node (run from a control plane node)
  kubectl drain <node-to-drain> --ignore-daemonsets
  # 4. upgrade the kubelet
  sudo apt-mark unhold kubelet && \
    sudo apt-get update && sudo apt-get install -y kubelet='1.35.x-*' && \
    sudo apt-mark hold kubelet
  # 5. restart the kubelet
  sudo systemctl daemon-reload
  sudo systemctl restart kubelet
  # 6. uncordon the node (run from a control plane node)
  kubectl uncordon <node-to-uncordon>


  # kubeadm CONTROL PLANE upgrade steps (one node at a time, first node shown)
  # 0. change the package repository to the target minor version (see worker step 0)
  # 1. upgrade the kubeadm package FIRST - `kubeadm upgrade plan` is run by the
  #    new kubeadm binary, so upgrading it is a prerequisite, not an afterthought
  sudo apt-mark unhold kubeadm && \
    sudo apt-get update && sudo apt-get install -y kubeadm='1.35.x-*' && \
    sudo apt-mark hold kubeadm
  kubeadm version                          # confirm the new binary is in place
  # 2. plan and apply
  sudo kubeadm upgrade plan                # shows which versions you can upgrade to
  sudo kubeadm upgrade apply v1.35.x       # FIRST control plane node only
  #    every OTHER control plane node: upgrade the kubeadm package, then
  sudo kubeadm upgrade node
  # 3. the control plane node still needs its kubelet and kubectl upgraded,
  #    exactly like a worker (drain, upgrade, restart, uncordon)
  kubectl drain <cp-node> --ignore-daemonsets
  sudo apt-mark unhold kubelet kubectl && \
    sudo apt-get update && sudo apt-get install -y kubelet='1.35.x-*' kubectl='1.35.x-*' && \
    sudo apt-mark hold kubelet kubectl
  sudo systemctl daemon-reload
  sudo systemctl restart kubelet
  kubectl uncordon <cp-node>

  ```

  </p>
  </details>

### Workloads and Scheduling - 15%

1. [Understand application deployments and how to perform rolling update and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
    - [Rolling back a deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rolling-back-a-deployment)
1. Use [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/) and [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) to configure applications
    - [Configure a Pod with a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
    - [Configure a Pod with a Secret](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)
1. Configure **workload autoscaling**
    - [Autoscaling workloads](https://kubernetes.io/docs/concepts/workloads/autoscaling/)
    - [HorizontalPodAutoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
    - [HorizontalPodAutoscaler walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/) - needs metrics-server
    - [Scaling a StatefulSet](https://kubernetes.io/docs/tasks/run-application/scale-stateful-set/)
1. Understand the primitives used to create robust, self-healing, application deployments
    - [ReplicaSet](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)
    - [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
    - [StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
    - [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
    - [Disruptions and PodDisruptionBudgets](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/)
1. Configure **Pod admission and scheduling** (limits, node affinity, etc.)
    - [Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) - nodeSelector, node affinity, pod affinity and anti-affinity
    - [Taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)
    - [Resource requests and limits](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)
    - [LimitRange](https://kubernetes.io/docs/concepts/policy/limit-range/) and [ResourceQuota](https://kubernetes.io/docs/concepts/policy/resource-quotas/)
    - [Admission controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
    - [Pod priority and preemption](https://kubernetes.io/docs/concepts/scheduling-eviction/pod-priority-preemption/)

### Services and Networking - 20%

1. Understand connectivity between Pods
    - [Cluster networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
    - [Pod networking](https://kubernetes.io/docs/concepts/workloads/pods/#pod-networking)
1. Define and enforce **Network Policies**
    - [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
    - [Declare a network policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
1. Use ClusterIP, NodePort, LoadBalancer service types and endpoints
    - [Service](https://kubernetes.io/docs/concepts/services-networking/service/)
    - [EndpointSlices](https://kubernetes.io/docs/concepts/services-networking/endpoint-slices/)
1. Use the **Gateway API** to manage Ingress traffic
    - [Gateway API](https://kubernetes.io/docs/concepts/services-networking/gateway/)
    - Non-k8s.io resource: [Gateway API guides](https://gateway-api.sigs.k8s.io/guides/) - GatewayClass, Gateway, HTTPRoute
1. Know how to use [Ingress controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) and [Ingress resources](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource)
    - [Ingress concepts](https://kubernetes.io/docs/concepts/services-networking/ingress/)
1. Understand and use [CoreDNS](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/)
    - [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
    - [Using CoreDNS for service discovery](https://kubernetes.io/docs/tasks/administer-cluster/coredns/)

    - [Kubernetes Networking Intro and Deep-Dive - Bowei Du & Tim Hockin, Google](https://youtu.be/tq9ng_Nz9j8)
    - [Kubernetes and Networks: why is this so dang hard?](https://youtu.be/xB190-yyJnY?t=241)
    - [Kubecon Eu 2020 Tutorial: Communication Is Key - Understanding Kubernetes Networking - Jeff Poole, Vivint Smart Home](https://youtu.be/InZVNuKY5GY?list=PLj6h78yzYM2O1wlsM-Ma-RYhfT5LKq0XC)

### Storage - 10%

1. Implement [storage classes](https://kubernetes.io/docs/concepts/storage/storage-classes/) and [dynamic volume provisioning](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/)
1. Configure [volume types](https://kubernetes.io/docs/concepts/storage/volumes/), [volume mode](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-mode), [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) and [reclaim policies](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#reclaim-policy)
1. Manage [persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) and [persistent volume claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
    - [Configure a Pod to use a volume for storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)
    - [Volume snapshots](https://kubernetes.io/docs/concepts/storage/volume-snapshots/)

  <details>
  <summary> StorageClass, PersistentVolume, and PersistentVolumeClaim examples </summary>
  <p>

  ```yaml
  #### Storage Class example
  #
  apiVersion: storage.k8s.io/v1
  kind: StorageClass
  metadata:
    name: local-storage-sc
  provisioner: kubernetes.io/no-provisioner   # local volumes have no dynamic provisioner
  volumeBindingMode: WaitForFirstConsumer     # bind only when a Pod using the PVC is scheduled
  reclaimPolicy: Retain
  ---
  #### Persistent Volume Claim example
  #
  kind: PersistentVolumeClaim
  apiVersion: v1
  metadata:
    name: local-pvc
  spec:
    accessModes:
    - ReadWriteOnce
    storageClassName: local-storage-sc
    resources:
      requests:
        storage: 100Mi
  ---
  ## Persistent Volume example
  #
  apiVersion: v1
  kind: PersistentVolume
  metadata:
    name: local-pv
  spec:
    accessModes:
    - ReadWriteOnce
    capacity:
      storage: 200Mi
    local:
      path: /data/pv/disk021
    persistentVolumeReclaimPolicy: Retain
    storageClassName: local-storage-sc
    volumeMode: Filesystem
    # A local PersistentVolume is rejected without nodeAffinity:
    # "You must set a PersistentVolume nodeAffinity when using local volumes."
    # Replace <node-name> with the node holding /data/pv/disk021.
    nodeAffinity:
      required:
        nodeSelectorTerms:
        - matchExpressions:
          - key: kubernetes.io/hostname
            operator: In
            values:
            - <node-name>
  ---
  ###  Pod using the pvc
  #
  apiVersion: v1
  kind: Pod
  metadata:
    name: nginx
    labels:
      name: nginx
  spec:
    containers:
    - name: nginx
      image: nginx
      volumeMounts:
        - name: local-persistent-storage
          mountPath: /var/www/html
    volumes:
      - name: local-persistent-storage
        persistentVolumeClaim:
          claimName: local-pvc
  ```

  </p>
  </details>

### Troubleshooting - 30%

> For a full diagnostic method and practice scenarios, see [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

1. [Troubleshoot clusters and nodes](https://kubernetes.io/docs/tasks/debug/debug-cluster/)
    - [Debugging a node with kubectl debug node](https://kubernetes.io/docs/tasks/debug/debug-cluster/kubectl-node-debug/)
    - [System logs](https://kubernetes.io/docs/concepts/cluster-administration/system-logs/) - journalctl -u kubelet
1. [Troubleshoot cluster components](https://kubernetes.io/docs/tasks/debug/debug-cluster/)
    - static pod manifests in /etc/kubernetes/manifests/, and crictl ps / crictl logs when the API server is down
1. [Monitor cluster and application resource usage](https://kubernetes.io/docs/tasks/debug/debug-cluster/resource-usage-monitoring/)
    - [kubectl top](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_top/) - needs metrics-server
    - [System metrics](https://kubernetes.io/docs/concepts/cluster-administration/system-metrics/)
1. [Manage and evaluate container output streams](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
    - [Logging at the node level](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
    - [Debug running pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)
1. [Troubleshoot services and networking](https://kubernetes.io/docs/tasks/debug/debug-application/debug-service/)
    - [Debug pods](https://kubernetes.io/docs/tasks/debug/debug-application/debug-pods/) - pending, crash-looping or terminated pods
    - [Debug applications](https://kubernetes.io/docs/tasks/debug/debug-application/)
    - [DNS troubleshooting](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)


## Tips:

**practice**                                           **practice**                                         **practice**

Get familiar with:
* Familiarize yourself with the documentation, initially [concepts](https://kubernetes.io/docs/concepts/)  and mostly [tasks](https://kubernetes.io/docs/tasks/), **kubectl explain** command, [kubectl cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/), and [kubectl commands reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
  - https://kubernetes.io/docs/concepts/ 
  - https://kubernetes.io/docs/tasks/ 
  - https://kubernetes.io/docs/reference/kubectl/cheatsheet/
  - https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
*  `kubectl api-versions` and `kubectl  api-resources` with `grep` for a specific resource e.g. pv, pvc, deployment, storageclass, ..etc can help figure out the **apiVersion**, and **kind** combined with explain below will help in constructing the yaml manifest
* [kubectl explain --recursive](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_explain/) to construct out any yaml manifest you need and find its specd and details

* When using kubectl for investigations and troubleshooting utilize the wide output it gives your more details
```
     $kubectl get pods -o wide  --show-labels  --all-namespaces
     or
     $kubectl get pods -o wide  --show-labels  -A     # -A is quicker than --all-namespaces
```
* In `kubectl` utilize `--all-namespaces or better -A` to ensure deployments, pods, objects are on the right name space, and right desired state

* for events and troubleshooting utilize kubectl describe if its pod/resource related and logs if it is application issue related
```
     $kubectl describe pods <PODID>   # for pod, deployment, other k8s resource issues/events
     $kubectl logs <PODID>            # for container/application issues like crash loops
     
```

* [fast with kubectl](https://medium.com/faun/be-fast-with-kubectl-1-18-ckad-cka-31be00acc443)  e.g. the '-o yaml' in conjunction with `--dry-run=client` allows you to create a manifest template from an imperative spec, combined with `--edit` it allows you to modify the object before creation
```
kubectl create service clusterip my-svc -o yaml --dry-run=client > /tmp/srv.yaml
kubectl create --edit -f /tmp/srv.yaml
```
* use kubectl [aliases](https://github.com/ahmetb/kubectl-aliases) to speed up and reduce typo errors, practice these aliases early at your work and study for the exam. some example aliases:

```
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias kcpyd='kubectl run -o yaml --dry-run=client'   # `kubectl create pod` is not a valid subcommand - pods are created with `kubectl run`
alias ksysgpo='kubectl --namespace=kube-system get pod'

alias kd='kubectl delete'
alias kdf='kubectl delete -f'
## for quick deletes you can add --force --grace-period=0  **Not sure if it is a good idea if you are in a production cluster**
alias krmgf='kubectl delete --grace-period 0 --force'
alias kgsvcoyaml='kubectl get service -o=yaml'
alias kgsvcwn='watch kubectl get service --namespace'
alias kgsvcslwn='watch kubectl get service --show-labels --namespace'

#example usage of aliases
krmgf nginx-8jk71    # kill pod nginx-8jk71 using grace period 0 and force

```
* Enable [kubectl autocomplete](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#bash). Autocomplete is the life saviour in any timebound exam as well as our day to day work (e.g. If autocomplete enabled `k -n [Press Tab]` will suggest available namespaces). Example command to enable autocomplete is available at official [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#bash) page, you don't have to remember anything. 
```
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

alias k=kubectl
complete -F __start_kubectl k
```

## Miscellaneous (resources not allowed during exam):

1. [Troubleshooting use cases by Ian/Container solutions](https://github.com/ContainerSolutions/kubernetes-examples)

## Popular training and practice sites:
*Double check if the course is uptodate with the latest exam information (e.g. api, or curriculum)*

VMware's KubeAcademy has been retired ([notice](https://kube.academy/retirement)) and its free "How to prepare for the CKA exam" course was removed from this list. Every other link below was opened and serves a real course page.

- [Mumshad CKA with practice tests and mock exams](https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/) - Highly recommended
- [Killer.sh CKA simulator](https://killer.sh/cka)         &#x27F9; use code **walidshaari** for **20%** discount  - they update frequently
- [AWS Container hero NANA CKA course](https://www.techworld-with-nana.com/kubernetes-administrator-cka)
- [Pluralsight CKA course](https://www.pluralsight.com/paths/certified-kubernetes-administrator) by [Anthony E. Nocentino
](https://twitter.com/nocentino)
- [rx-m online CKA course](https://rx-m.com/cka-online-training/)
- Duffie Cooly hands-on CKA lab [notes](https://hackmd.io/@mauilion/cka-lab) using KinD (the accompanying k8s.work video is no longer hosted)
- [Stilian Stoilov](https://www.linkedin.com/in/stilian-stoilov-379972a9/) [practice questions](https://github.com/StenlyTU/K8s-training-official) - 50+ tasks with increasing difficulty.
- [Killercoda in-browser CKA Playground and Challenges](https://killercoda.com/killer-shell-cka) - FREE
# Quick review material

- [Kubernetes docs - kubectl Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)
# What's Next:
- Learn more about Kubernetes core components from [Duffie Cooly](https://twitter.com/mauilion) [TGIK Grokking playlist](https://www.youtube.com/playlist?list=PL7bmigfV0EqS6WxgWlH-p4dhkfuwcZ6-E)
- [CKAD Certified Kubernetes Application Developer](https://www.cncf.io/certification/ckad/)
- [CKS Certified Kubernetes Security Specialist](https://github.com/walidshaari/Certified-Kubernetes-Secuirty-Specialist)
- Klustered: live youtube series of advanced level of internals troubleshooting. fun and interesting to watch [Klustered](https://www.youtube.com/playlist?list=PLz0t90fOInA5IyhoT96WhycPV8Km-WICj)
