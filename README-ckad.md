
# Certified Kubernetes Application Developer (CKAD)
A  curated list of resources that will help you to face your Kubernetes certification. Based in the newest policy about 'Resources Allowed', current list will give preference
to those materials coming from the allowed sources [kubernetes.io](kubernetes.io). Others like Youtube videos, blog resources could be referenced in expectional case due to I still found them useful in my k8s learning journey.


_Before to start_ 

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.16 as of 20th Nov. 2019 exam) especially for API objects and annotations. This release removes several deprecated API's. 


## Exam Objectives

These are the exam objectives you review and understand in order to pass the test. The objectives are current as of December 12, 2017.

* [CKAD v1.0 Curriculum](https://github.com/cncf/curriculum/blob/master/certified_kubernetes_application_developer_exam_v1.0.pdf)

### [Core Concepts](https://kubernetes.io/docs/concepts/) 13%

* [Understand the Kubernetes API primitives](https://v1-9.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/)
* [Create and configure basic Pods](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/)


### [Configuration](https://v1-9.docs.kubernetes.io/docs/reference/generated/kubernetes-api/v1.9/#-strong-config-storage-strong-) 18%

* Understand ConfigMaps
    * [Configure a Pod to Use a ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
* [Understand SecurityContexts](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
* [Define an application’s resource requirements](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/)
    *[Memory](https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/)
    *[CPU](https://kubernetes.io/docs/tasks/configure-pod-container/assign-cpu-resource/)
    *[QoS](https://kubernetes.io/docs/tasks/configure-pod-container/quality-service-pod/)
* [Create & consume Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)    
* [Understand ServiceAccounts](https://kubernetes.io/docs/admin/service-accounts-admin/)    

### [Multi-Container Pods] 10%

* [Understand Multi-Container Pod design patterns](https://kubernetes.io/blog/2015/06/the-distributed-system-toolkit-patterns)
    * [Paper](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/45406.pdf)
    * [Ambassador](https://github.com/brendandburns/designing-distributed-systems/tree/master/ambassadors)
    * [Adapter](https://github.com/brendandburns/designing-distributed-systems/tree/master/adapters)
    * [Sidecar](https://github.com/brendandburns/designing-distributed-systems/tree/master/sidecars)
    * [Shared](https://github.com/brendandburns/designing-distributed-systems/tree/master/sharded)

### [Observability] 18%

* [Understand LivenessProbes and ReadinessProbes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/) 
* [Understand container logging](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs)
* [Understand how to monitor applications in Kubernetes](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/) 
    * [Monitoring Kubernetes](https://www.datadoghq.com/blog/monitoring-kubernetes-era/)
* [Understand debugging in Kubernetes](https://kubernetes.io/docs/tasks/debug-application-cluster/determine-reason-pod-failure/)
    * [Application Introspection and Debugging](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application-introspection/)
    * [Services](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service/)

### [Pod Design] 20%

* [Understand how to use Labels, Selectors, and Annotations](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
    * [Use label selectors to schedule Pods](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/)
    * [Annotations](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/)
* [Understand Deployments and how to perform rolling updates, rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
* Understand Jobs and CronJobs
    * [Job](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/)
    * [CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
    

### [Services and Networking] 13%

* [Understand Services](https://kubernetes.io/docs/concepts/services-networking/service/)
  * CKAD+: [Life of a Packet [I] - Michael Rubin, Google](https://www.youtube.com/watch?v=0Omvgd7Hg1I)
  * CKAD+: [The ins and outs of networking in Google Container Engine and Kubernetes (Google Cloud Next '17)](https://www.youtube.com/watch?v=y2bhV81MfKQ)

* [Demonstrate basic understanding of NetworkPolicies](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)
  * [Blog: Kubernetes network policy](https://ahmet.im/blog/kubernetes-network-policy/)
  * [Katacoda Calico](https://www.katacoda.com/projectcalico/scenarios/calico)


### [State Persistence] 8%

* [Understand PersistentVolumeClaims for storage](https://kubernetes.io/docs/concepts/storage/volumes/) 7%
    * [Understand persistent volumes and know how to create them](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
    * [Understand access modes for volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes)
    * [Understand persistent volume claims primitive](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims)
    * [Understand Kubernetes storage objects](https://kubernetes.io/docs/concepts/storage/volumes/#types-of-volumes)
    * [Know how to configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)

## Tips:

get familiar with:
* [kubectl explain](https://blog.heptio.com/kubectl-explain-heptioprotip-ee883992a243)
* [kubectl cheatsheet](https://kubernetes.io/docs/user-guide/kubectl-cheatsheet/)
* When using kubecctl for investigations and troubleshooting utilize the wide output it gives your more details
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
