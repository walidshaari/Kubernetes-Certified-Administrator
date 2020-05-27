# Kubernetes Certified Administration

Online resources that will help you prepare for taking the Kubernetes Certified Administrator Certification exam.

**Disclaimer**: This is not likely a comprehensive list as the exam will be a moving target with the fast pace of k8s development - please make a pull request if there something wrong or that should be added, or updated in here.

I tried to restrict the cross references of resources to [kubernetes.io](kubernetes.io). Youtube videos and other blog resources are optional; however, I still found them useful in my k8s learning journey.

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.18 as of 23rd April 2020 exam) especially for API objects and annotations.

## Exam Objectives

These are the exam objectives you review and understand in order to pass the test.

* [CNCF Exam Curriculum repository ](https://github.com/cncf/curriculum)


### [Core Concepts](https://kubernetes.io/docs/concepts/) 19%
* [Understand the Kubernetes API primitives](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.16/)
  * [concepts: Kubernetes Objects](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
  * youtube: [Kubernetes Webinar Series - Kubernetes Architecture 101](https://www.youtube.com/watch?v=zeS6OyDoy78)
* [Understand the Kubernetes cluster architecture](https://kubernetes.io/docs/concepts/overview/components/)
  * youtube: [A Technical Overview of Kubernetes (CoreOS Fest 2015) by Brendan Burns](https://www.youtube.com/watch?v=WwBdNXt6wO4)
* [Understand Services and other network primitives](https://kubernetes.io/docs/concepts/services-networking/service/)
  * youtube: [Life of a Packet [I] - Michael Rubin, Google](https://www.youtube.com/watch?v=0Omvgd7Hg1I)
  * youtube: [The ins and outs of networking in Google Container Engine and Kubernetes (Google Cloud Next '17)](https://www.youtube.com/watch?v=y2bhV81MfKQ)
  
*  Example Nginx deployment:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.17.10
        ports:
        - containerPort: 80
```
### [Installation, Configuration and Validation](https://github.com/kelseyhightower/kubernetes-the-hard-way/tree/f9486b081f8f54dd63a891463f0b0e783d084307) 12%
* Design a Kubernetes cluster
* [Install Kubernetes masters and nodes, including the use of TLS bootstrapping](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
* [Configure secure cluster communications](https://kubernetes.io/docs/tasks/tls/managing-tls-in-a-cluster/)
* [Configure a Highly-Available Kubernetes cluster](https://kubernetes.io/docs/admin/high-availability/)
* [Know where to get the Kubernetes release binaries](https://kubernetes.io/docs/getting-started-guides/binary_release/#prebuilt-binary-release)
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
* Work with role-based access control

### [Networking](https://kubernetes.io/docs/concepts/cluster-administration/networking/) 11%
* [Understand the networking configuration on the cluster nodes](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
* Understand Pod networking concepts
  * youtube: [The ins and outs of networking in Google Container Engine and Kubernetes (Google Cloud Next '17)](https://www.youtube.com/watch?v=y2bhV81MfKQ)
  * youtube: [Networking with Kubernetes](https://www.youtube.com/watch?v=WwQ62OyCNz4)
  * [Illustrated Guide To Kubernetes Networking by Tim Hockin](https://speakerdeck.com/thockin/illustrated-guide-to-kubernetes-networking)
* Understand service networking
  * youtube: [Life of a Packet [I] - Michael Rubin, Google](https://www.youtube.com/watch?v=0Omvgd7Hg1I)
* [Deploy and configure network load balancer](https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/)
* [Know how to use Ingress rules](https://kubernetes.io/docs/concepts/services-networking/ingress/)
* [Know how to configure and use the cluster DNS](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
* [Understand CNI](https://github.com/containernetworking/cni)
  * [More information on CNI](http://www.dasblinkenlichten.com/understanding-cni-container-networking-interface/)

### Cluster Maintenance 11%
* [Understand Kubernetes cluster upgrade process](https://kubernetes.io/docs/getting-started-guides/ubuntu/upgrades/)
    * Best resource upgrade is to watch [TGI Kubernetes 011: Upgrading to 1.8 with kubeadm](https://youtu.be/x9doB5eJWgQ)
* [Facilitate operating system upgrades](https://cloud.google.com/container-engine/docs/clusters/upgrade) #need review to make it more platform agnostic
* [Implement backup and restore methodologies](https://kubernetes.io/docs/getting-started-guides/ubuntu/backups/)
* [Etcd management/backups/restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd)


### [Troubleshooting](https://kubernetes.io/docs/tasks/debug-application-cluster/troubleshooting/) 10%
* [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/determine-reason-pod-failure/)
  * [Application Introspection and Debugging](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/)
  * [Services](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/)
* [Troubleshoot control plane failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
  * youtube [Kubernetes Day 2: Cluster Operations [I] - Brandon Philips, CoreOS](https://www.youtube.com/watch?v=U1zR0eDQRYQ)
  * Safaribooksonline: [https://www.safaribooksonline.com/library/view/oscon-2016-video/9781491965153/video246982.html](https://www.safaribooksonline.com/library/view/oscon-2016-video/9781491965153/video246982.html)
* [Troubleshoot worker node failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
* Troubleshoot networking

### [Storage](https://kubernetes.io/docs/concepts/storage/volumes/) 7%
* [Understand persistent volumes and know how to create them](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
* [Understand access modes for volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)
* [Understand persistent volume claims primitive](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
* [Understand Kubernetes storage objects](https://kubernetes.io/docs/concepts/storage/volumes/#types-of-volumes)
* [Know how to configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)

### Application Lifecycle Management 8%
* [Understand Deployments and how to perform rolling updates and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
* [Know various ways to configure applications](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
* [Know how to scale applications](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#scaling-your-application)
* Understand the primitives necessary to create a self-healing application

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

### [Logging/Monitoring](https://kubernetes.io/docs/concepts/cluster-administration/logging/) 5%
* [Monitoring Kubernetes](https://www.datadoghq.com/blog/monitoring-kubernetes-era/)
* [Understand how to monitor all cluster components](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
* [Pod and Node metrics](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#interacting-with-running-pods)
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
## Practice Exam
* [CKA Practice Exam Environment](https://github.com/arush-sal/cka-practice-environment)
## Tips:

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
