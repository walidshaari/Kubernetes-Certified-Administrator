[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-sa/4.0/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# Kubernetes Certified Administration

Online resources that will help you prepare for taking the Kubernetes Certified Administrator Certification exam.

**Disclaimer**: This is not likely a comprehensive list as the exam will be a moving target with the fast pace of k8s development - please make a pull request if there something wrong, should be added, or updated.

I tried to restrict the cross references of resources to [kubernetes.io](kubernetes.io). Youtube videos and other blog resources are optional; however, I still found them useful in my k8s learning journey.

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.20 as of 25th Jan 2021 exam) especially for API objects and annotations.

LDR:  **practice**       **practice**      **practice**

## Other CK exams:
- [Certified Kubernetes Security Specialist CKS](https://github.com/walidshaari/Certified-Kubernetes-Secuirty-Specialist)
- [Certified Kubernetes Application Developer CKAD](https://github.com/dgkanatsios/CKAD-exercises)

## CKA 2020 Exam Objectives

These are the exam objectives you review and understand in order to pass the test.

* [CNCF Exam Curriculum repository ](https://github.com/cncf/curriculum)

### [ Cluster Architecture, Installation, and Configuration](https://youtu.be/vS-wXo2qbPs) 25%
1. [Manage role based access control](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
1. [Use kubeadm to install a basic cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
1. [Manage a highly available Kubernetes cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/)
   [Weaveworks Kubeadm HA cluster](https://www.weave.works/blog/running-highly-available-clusters-with-kubeadm)
1. [Provision underlying infrastructure to deploy Kubernetes cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
1. [Peform a version upgrade on Kubernetes cluster using kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade/)
1. [implment etcd backup and restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)

[Kubecon Europe 2020: Kubeadm deep dive](https://youtu.be/DhsFfNSIrQ4)
<details>
<summary> sample commands used during backup/restore/update of nodes </summary>
<p>

```
#etcd backup and restore brief
export ETCDCTL_API=3  # needed to specify etcd api versions, not sure if it is needed anylonger with k8s 1.19+ 
etcdctl snapshot save -h   #find save options
etcdctl snapshot restore -h  #find restore options

## possible example of save, options will change depending on cluster context, as TLS is used need to give ca,crt, and key paths
etcdctl snapshot save /backup/snapshot.db  --cert=/etc/kubernetes/pki/etcd/server.crt  --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt


# evicting pods/nodes and bringing back node back to cluster
kubectl drain  <node># to drain a node
kubectl uncordon  <node> # to return a node after updates back to the cluster from unscheduled state to Ready
kubectl cordon  <node>   # to not schedule new pods on a node

#backup/restore the cluster (e.g. the state of the cluster in etcd)


# upgrade kubernetes worker node
kubectl drain <node>
apt-get upgrade -y kubeadm=<k8s-version-to-upgrade>
apt-get upgrade -y kubelet=<k8s-version-to-upgrade>
kubeadm upgrade node config --kubelet-version <k8s-version-to-upgrade>
systemctl restart kubelet
kubectl uncordon <node>


#kubeadm upgrade steps
kubeadm upgrade plan
kubeadm upgrade apply


```

</p>
</details> 

### Workloads & Scheduling – 15%
1. [Understand deployments and how to perform rolling update and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
2. Use [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/) and [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) to configure applications
  - [configure a pod with a configmap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
  - [configure a pod with a secret](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)
3. Know how to [scale applications](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)
  - [scaling a statefulset](https://kubernetes.io/docs/tasks/run-application/scale-stateful-set/)
  - [scaling a replicaset](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#scaling-a-replicaset)
4. Understand the primitives used to create robust, self-healing, application deployments
 - [Replicaset](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)
 - [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
 - [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
 - [Daemonset](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
5. Understand [how resource limits can affect Pod scheduling](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#how-pods-with-resource-requests-are-scheduled)
6. Awareness of manifest management and common templating tools
  * [Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
    - [Kustomize Blog](https://kubernetes.io/blog/2018/05/29/introducing-kustomize-template-free-configuration-customization-for-kubernetes/)
  * [manage kubernetes objects](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/)
  * [Install service catalog using helm](https://kubernetes.io/docs/tasks/service-catalog/install-service-catalog-using-helm/)
    - Non-k8s.io resource: CNCF Kubecon video: [An introduction to Helm - Bridget Kromhout, Microsoft & Marc Khouzam, City of Montreal](https://youtu.be/x2w6T0sE50w?list=PLj6h78yzYM2O1wlsM-Ma-RYhfT5LKq0XC)
   - Non-k8s.io resource: External resource: [templating-yaml-with-code](https://learnk8s.io/templating-yaml-with-code)

### Services & Networking – 20% 

1. Understand [host networking configuration on the cluster nodes](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
2. Understand connectivity between Pods
  - [The concept of Pods networking](https://kubernetes.io/docs/concepts/workloads/pods/#pod-networking)
3. Understand ClusterIP, NodePort, LoadBalancer service types and endpoints
   - [service](https://kubernetes.io/docs/concepts/services-networking/service/)
4. Know how to use [Ingress controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) and [Ingress resources](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource)
  - [Ingress concepts]((https://kubernetes.io/docs/concepts/services-networking/ingress/))
5. [Know how to configure and use CoreDNS](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/)
6. [Choose an appropriate container network interface plugin](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#pod-network)

- [Kubernetes Networking Intro and Deep-Dive - Bowei Du & Tim Hockin, Google](https://youtu.be/tq9ng_Nz9j8)
- [Kubernetes and Networks: why is this so dang hard?](https://youtu.be/xB190-yyJnY?t=241)
- [Kubecon Eu 2020 Tutorial: Communication Is Key - Understanding Kubernetes Networking - Jeff Poole, Vivint Smart Home](https://youtu.be/InZVNuKY5GY?list=PLj6h78yzYM2O1wlsM-Ma-RYhfT5LKq0XC)


### Storage – 10%

1. Understand [storage classes](https://kubernetes.io/docs/concepts/storage/storage-classes/), [persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
1. Understand [volume mode](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-mode), [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) and [reclaim policies](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#reclaim-policy) for volumes
1. Understand [persistent volume claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims) primitive
1. Know how to [configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)

<details>
<summary> StorageClass, PersistentVolume, and PersitentVolumeClaim examples </summary>
<p>

```
#### Storage Class example
#

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

### Troubleshooting – 30%

1. [Evaluate cluster and node logging](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
1. [Understand how to monitor applications](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
1. [Manage container stdout & stderr logs](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
1. [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)
   - [Pending or termintated pods](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#troubleshooting)
1. [Troubleshoot cluster component failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
1. [Troubleshoot networking](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
   - [DNS troubleshooting](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)


## Tips:

**practice**                                           **practice**                                         **practice**

Get familiar with:
* Familiarize yourself with the documentation, initially [concepts](https://kubernetes.io/docs/concepts/)  and mostly [tasks](https://kubernetes.io/docs/tasks/), **kubectl explain** command, [kubectl cheatsheet](https://kubernetes.io/docs/user-guide/kubectl-cheatsheet/), and [kubectl commands reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
  - https://kubernetes.io/docs/concepts/ 
  - https://kubernetes.io/docs/tasks/ 
  - https://kubernetes.io/docs/user-guide/kubectl-cheatsheet/
  - https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
*  `kubectl api-versions` and `kubectl  api-resources` wih `grep` for a specific resoruce e.g. pv, pvc, deployment, storageclass, ..etc can help figure out the **apiVersion**, and **kind** combined with explain below will help in constructing the yaml manifest
* [kubectl explain --recurisve](https://blog.heptio.com/kubectl-explain-heptioprotip-ee883992a243) to construct out any yaml manifest you need and find its specd and details

* When using kubectl for investigations and troubleshooting utilize the wide output it gives your more details
```
     $kubectl get pods -o wide  --show-labels  --all-namespaces
     or
     $kubectl get pods -o wide  --show-labels  -A     # -A is quicker than --all-namespaces
```
* In `kubectl` utilizie `--all-namespaces or better -A` to ensure deployments, pods, objects are on the right name space, and right desired state

* for events and troubleshooting utilize kubectl describe if its pod/resource related and logs if it is application issue related
```
     $kubectl describe pods <PODID>   # for pod, deployment, other k8s resource issues/events
     $kubectl logs <PODID>            # for container/application issues like crash loops
     
```

* [fast with kubectl](https://medium.com/faun/be-fast-with-kubectl-1-18-ckad-cka-31be00acc443)  e.g. the '-o yaml' in conjuction with `--dry-run=client` allows you to create a manifest template from an imperative spec, combined with `--edit` it allows you to modify the object before creation
```
kubectl create service clusterip my-svc -o yaml --dry-run=client > /tmp/srv.yaml
kubectl create --edit -f /tmp/srv.yaml
```
* use kubectl [aliases](https://github.com/ahmetb/kubectl-aliases) to speed up and reduce typo errors, practice these alaises early at your work and study for the exam. some example aliases:

```
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias kcpyd='kubectl create pod -o yaml --dry-run=client'
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
*Double check if the course is uptodate with the latest exam information (e.g. api, or curicuilim)*

- [Mumshad CKA with practice tests and mock exams](https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/) - Highly recommended
- [Killer.sh CKA simulator](https://killer.sh/cka)         &#x27F9; use code **walidshaari** for **20%** discount  - they update frequently
- [A Cloud Guru - Certified Kubernetes Administrator (CKA)](https://acloud.guru/overview/certified-kubernetes-administrator)  # k8s version 1.19 - last checked January 2021
- [LinuxAcademy/ACloudGuru CKA course](https://acloud.guru/learn/7f5137aa-2d26-4b19-8d8c-025b22667e76)  # labs last checked were updated to 1.18
- [rx-m online CKA course](https://rx-m.com/cka-online-training/)
- [Pluralsight CKA course](https://www.pluralsight.com/paths/certified-kubernetes-administrator)
- Duffie Cooly [hands-on CKA video](https://k8s.work/cka-lab.mp4) using KinD and accompanying [notes](https://hackmd.io/@mauilion/cka-lab)
- [Stilian Stoilov](https://www.linkedin.com/in/stilian-stoilov-379972a9/) [practice questions](https://github.com/StenlyTU/K8s-training-official) - 40+ tasks with increasing difficulty.

# What's Next:
- Learn more about Kubernetes core components from [Duffie Cooly](https://twitter.com/mauilion) [TGIK Grokking playlist](https://www.youtube.com/playlist?list=PL7bmigfV0EqS6WxgWlH-p4dhkfuwcZ6-E)
- [CKAD Certified Kubernetes Application Developer](https://www.cncf.io/certification/ckad/)
- [CKS Certified Kubernetes Security Specialist](https://github.com/walidshaari/Certified-Kubernetes-Secuirty-Specialist)

## Stargazers over time

[![Stargazers over time](https://starchart.cc/walidshaari/Kubernetes-Certified-Administrator.svg)](https://starchart.cc/walidshaari/Kubernetes-Certified-Administrator/)

