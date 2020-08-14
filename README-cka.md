# Kubernetes Certified Administration

_Before to start_

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.16 as of 20th Nov. 2019 exam) especially for API objects and annotations. This release removes several deprecated API's.

## CKA Exam Objectives

These are the exam objectives you review and understand in order to pass the test.

* [CNCF Exam Curriculum repository ](https://github.com/cncf/curriculum)

### Scheduling 5%
* [Use label selectors to schedule Pods](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
* [Understand the role of DaemonSets](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
* [Understand how resource limits can affect Pod scheduling](https://kubernetes.io/docs/tasks/administer-cluster/memory-default-namespace/)
* [Understand how to run multiple schedulers and how to configure Pods to use them](https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/)
* [Manually schedule a pod without a scheduler](https://kubernetes.io/docs/tasks/administer-cluster/static-pod/)
   If you require a pod to start on a specific node, you can specify this in POD spec.nodeName, that is what DaemonSets do.
* [Display scheduler events](https://stackoverflow.com/questions/28857993/how-does-kubernetes-scheduler-work/28874577#28874577)
  /var/log/kube-scheduler.log on the control/master node
  or use `kubectl describe` as in
```
  $kubectl describe pods <POD NAME UNDER Investigation>  | grep -A7 ^Events
```
* [Know how to configure the Kubernetes scheduler](https://kubernetes.io/docs/tasks/administer-cluster/configure-multiple-schedulers/)
* [taint and toleration](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/)

### [Logging/Monitoring](https://kubernetes.io/docs/concepts/cluster-administration/logging/) 5%
* [Understand how to monitor all cluster components](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
* Understand how to monitor applications
* [Manage cluster component logs](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/#looking-at-logs)
  * Master
    * /var/log/kube-apiserver.log - API Server, responsible for serving the API
    * /var/log/kube-scheduler.log - Scheduler, responsible for making scheduling decisions
    * /var/log/kube-controller-manager.log - Controller that manages replication controllers
  * Worker Nodes
    * /var/log/kubelet.log - Kubelet, responsible for running containers on the node
    * /var/log/kube-proxy.log - Kube Proxy, responsible for service load balancing
* [Manage application logs](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)

### Application Lifecycle Management 8%
* [Understand Deployments and how to perform rolling updates and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
* [Know various ways to configure applications](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
* [Know how to scale applications](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#scaling-your-application)
* Understand the primitives necessary to create a self-healing application

### Cluster Maintenance 11%
* [Upgrade kubeadm cluster](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
* [Understand Kubernetes cluster upgrade process](https://kubernetes.io/docs/getting-started-guides/ubuntu/upgrades/)
* [Facilitate operating system upgrades](https://cloud.google.com/container-engine/docs/clusters/upgrade) #need review to make it more platform agnostic
* [Implement backup and restore methodologies](https://kubernetes.io/docs/getting-started-guides/ubuntu/backups/)
* [Etcd management/backups/restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd)

### Security 12%
* [Securing a kubernetes cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)
    * youtube: [Building for Trust: How to Secure Your Kubernetes Cluster [I] - Alexander Mohr & Jess Frazelle](https://www.youtube.com/watch?v=YRR-kZub0cA)
* [Know how to configure authentication and authorization](https://kubernetes.io/docs/admin/authorization/rbac/)
  * [Access the api](https://kubernetes.io/docs/admin/accessing-the-api/)
  * [Authentication](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)
  * [Authorization with RBAC](https://kubernetes.io/docs/admin/authorization/rbac/)
  * [Admission Control](https://kubernetes.io/docs/admin/admission-controllers/)
* [Understand Kubernetes security primitives]
  * [Pod Security Policy](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
    * [PSP and RBAC](https://github.com/kubernetes/examples/blob/master/staging/podsecuritypolicy/rbac/README.md)
* [Know to configure network policies](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
  * [Blog: Kubernetes network policy](https://ahmet.im/blog/kubernetes-network-policy/)
  * [Katacoda Calico](https://www.katacoda.com/projectcalico/scenarios/calico)
* [Create and manage TLS certificates for cluster components](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)
* Work with images securely
* [Define security contexts](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
* [Secure persistent key value store](https://kubernetes.io/docs/concepts/configuration/secret/)

### [Storage](https://kubernetes.io/docs/concepts/storage/volumes/) 7%
* [Understand persistent volumes and know how to create them](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
* [Understand access modes for volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)
* [Understand persistent volume claims primitive](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
* [Understand Kubernetes storage objects](https://kubernetes.io/docs/concepts/storage/volumes/#types-of-volumes)
* [Know how to configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)

- [Claims as volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#claims-as-volumes)
- [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/
)

### [Troubleshooting](https://kubernetes.io/docs/tasks/debug-application-cluster/troubleshooting/) 10%
* [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/determine-reason-pod-failure/)
  * [Application Introspection and Debugging](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/)
  * [Services](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/)
* [Troubleshoot control plane failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
* [Troubleshoot worker node failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
* Troubleshoot networking

### [Core Concepts](https://kubernetes.io/docs/concepts/) 19%
* [Understand the Kubernetes API primitives](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.16/)
  * [concepts: Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
* [Understand the Kubernetes cluster architecture](https://kubernetes.io/docs/concepts/overview/components/)
* [Understand Services and other network primitives](https://kubernetes.io/docs/concepts/services-networking/service/)

### [Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/) 11%
* [Understand the networking configuration on the cluster nodes](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
* Understand Pod networking concepts
  * [Illustrated Guide To Kubernetes Networking by Tim Hockin](https://speakerdeck.com/thockin/illustrated-guide-to-kubernetes-networking)
* Understand service networking
* [Deploy and configure network load balancer](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/)
* [Know how to use Ingress rules](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Know how to configure and use the cluster DNS](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
* [Understand CNI](https://github.com/containernetworking/cni)
  * [More information on CNI](http://www.dasblinkenlichten.com/understanding-cni-container-networking-interface/)

### [Installation, Configuration and Validation](https://github.com/kelseyhightower/kubernetes-the-hard-way/tree/f9486b081f8f54dd63a891463f0b0e783d084307) 12%
* Design a Kubernetes cluster
* [Install Kubernetes masters and nodes, including the use of TLS bootstrapping](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
  * [Install kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
  * [kubeadm Upgrade](https://kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/)
  * [configure/upgrade etcd](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd)
* [Configure secure cluster communications](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)
* [Configure a Highly-Available Kubernetes cluster](https://kubernetes.io/docs/admin/high-availability/)
* [Know where to get the Kubernetes release binaries](https://github.com/kubernetes/kubernetes/releases)
* [Provision underlying infrastructure to deploy a Kubernetes cluster](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/f9486b081f8f54dd63a891463f0b0e783d084307/docs/01-infrastructure-gcp.md)
* [Choose a network solution](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
* Choose your Kubernetes infrastructure configuration
* Run end-to-end tests on your cluster    
  * Some simple commands will cover most cases:
```
$ kubectl cluster-info
$ kubectl get nodes
$ kubectl get componentstatuses
$ kubectl get pods -o wide --show-labels --all-namespaces
$ kubectl get svc  -o wide --show-labels --all-namespaces
```

* For more advanced end to end testing, which may not be covered on the exam, also see:
     * [End-To-End Testing in Kubernetes](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-testing/e2e-tests.md)
     * [Using CNCF k8s conformance](https://github.com/cncf/k8s-conformance/blob/master/instructions.md)
     * [Heptio Sonobuoy Scanner](https://scanner.heptio.com/)

## Practice Exam
* [CKA Practice Exam Environment](https://github.com/arush-sal/cka-practice-environment)
## Tips:

* [kubectl commands](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)

get familiar with:
* [kubectl explain](https://blog.heptio.com/kubectl-explain-heptioprotip-ee883992a243)
* [kubectl cheatsheet](https://kubernetes.io/docs/user-guide/kubectl-cheatsheet/)
* When using kubectl for investigations and troubleshooting utilize the wide output it gives your more details
```
     $kubectl get pods -o wide --show-labels --all-namespaces
```
* In `kubectl` utilizie `--all-namespaces` to ensure deployments, pods, objects are on the right name space, and right desired state

* for events and troubleshooting utilize kubectl describe
```
     $kubectl describe pods <PODID>
```
* the '-o yaml' in conjuction with `--dry-run` allows you to create a manifest template from an imperative spec, combined with `--edit` it allows you to modify the object before creation
```
kubectl create service clusterip my-svc -o yaml --dry-run > /tmp/srv.yaml
kubectl create --edit -f /tmp/srv.yaml
```
* [Be fast with kubectl in 1.18](https://medium.com/faun/be-fast-with-kubectl-1-18-ckad-cka-31be00acc443)
## Do you want more?

- [Kubernauts resources list](https://docs.google.com/spreadsheets/d/10NltoF_6y3mBwUzQ4bcQLQfCE1BWSgUDcJXy-Qp2JEU/edit#gid=0)
