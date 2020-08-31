# Kubernetes Certified Administration

Online resources that will help you prepare for taking the Kubernetes Certified Administrator Certification exam.

**Disclaimer**: This is not likely a comprehensive list as the exam will be a moving target with the fast pace of k8s development - please make a pull request if there something wrong or that should be added, or updated in here.

I tried to restrict the cross references of resources to [kubernetes.io](kubernetes.io). Youtube videos and other blog resources are optional; however, I still found them useful in my k8s learning journey.

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.19 as of 1st Sept 2020 exam) especially for API objects and annotations.

## Other CK exams:
- [Certified Kubernetes Security Specialist CKS](https://github.com/walidshaari/Certified-Kubernetes-Secuirty-Specialist)
- [Certified Kubernetes Application Developer CKAD](./README-ckad.md)

## CKA Exam Objectives

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

### Workloads & Scheduling – 15%
1. [Understand deployments and how to perform rolling update and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
1. Use [ConfigMaps](https://kubernetes.io/docs/concepts/configuration/configmap/) and [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/) to configure applications
  - [configure a pod with a configmap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
  - [configure a pod with a secret](https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/)
1. Know how to [scale applications](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#scaling-a-deployment)
  - [scaling a statefulset](https://kubernetes.io/docs/tasks/run-application/scale-stateful-set/)
  - [scaling a replicaset](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/#scaling-a-replicaset)
1. Understand the primitives used to create robust, self-healing, application deployments
 - [Replicaset](https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/)
 - [Deployments](https://v1-16.docs.kubernetes.io/docs/concepts/workloads/controllers/deployment/)
 - [Statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
 - [Daemonset](https://v1-16.docs.kubernetes.io/docs/concepts/workloads/controllers/daemonset/)
 
1. Understand [how resource limits can affect Pod scheduling](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#how-pods-with-resource-requests-are-scheduled)
1. Awareness of manifest management and common templating tools
  - [Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)
    - [Kustomize Blog](https://kubernetes.io/blog/2018/05/29/introducing-kustomize-template-free-configuration-customization-for-kubernetes/)
  - [manage kubernetes objects](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/)
  - [Install service catalog using helm](https://kubernetes.io/docs/tasks/service-catalog/install-service-catalog-using-helm/)
  - Non-k8s.io resource: External resource: [templating-yaml-with-code)](https://learnk8s.io/templating-yaml-with-code)


### Services & Networking – 20% 

1. Understand [host networking configuration on the cluster nodes](https://kubernetes.io/docs/concepts/cluster-administration/networking/)
1. Understand connectivity between Pods
  - [The concept of Pods networking](https://kubernetes.io/docs/concepts/workloads/pods/#pod-networking)

1. Understand ClusterIP, NodePort, LoadBalancer service types and endpoints
   - [service](https://kubernetes.io/docs/concepts/services-networking/service/)
1. Know how to use [Ingress controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) and [Ingress resources](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource)
  - [Ingress concepts]((https://kubernetes.io/docs/concepts/services-networking/ingress/))
1. [Know how to configure and use CoreDNS](https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/)
1. [Choose an appropriate container network interface plugin](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#pod-network)

### Storage – 10%

1. Understand [storage classes](https://kubernetes.io/docs/concepts/storage/storage-classes/), [persistent volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
1. Understand [volume mode](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-mode), [access modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) and [reclaim policies](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#reclaim-policy) for volumes
1. Understand [persistent volume claims](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims) primitive
1. Know how to [configure applications with persistent storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/)

### Troubleshooting – 30%

1. [Evaluate cluster and node logging](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
1. [Understand how to monitor applications](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
1. [Manage container stdout & stderr logs](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
1. [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)
   - [Pending or termintated pods](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#troubleshooting)
1. [Troubleshoot cluster component failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
1. [Troubleshoot networking](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
   - [DNS troubleshooting] (https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)
   
## Miscellaneous (resources not allowed during exam):

1. [Troubleshooting use cases by Ian/Container solutions](https://github.com/ContainerSolutions/kubernetes-examples)
  

