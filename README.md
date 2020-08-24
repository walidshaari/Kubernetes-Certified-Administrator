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
1. Provision underlying infrastructure to deploy Kubernetes cluster
1. [Peform a version upgrade on Kubernetes cluster using kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade/)
1. [implment etcd backup and restore](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#backing-up-an-etcd-cluster)

### Workloads & Scheduling – 15%
1. [Understand deployments and how to perform rolling update and rollbacks](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
1. Use ConfigMaps and Secrets to configure applications
1. Know how to scale applications
1. Understand the primitives used to create robust, self-healing, application deployments
1. Understand how resource limits can affect Pod scheduling
1. Awareness of manifest management and common templating tools


### Services & Networking – 20% 

1. Understand host networking configuration on the cluster nodes
1. Understand connectivity between Pods
1. Understand ClusterIP, NodePort, LoadBalancer service types and endpoints
1. Know how to use Ingress controllers and Ingress resources
1. Know how to configure and use CoreDNS
1. Choose an appropriate container network interface plugin

### Storage – 10%

1. Understand storage classes, persistent volumes
1. Understand volume mode, access modes and reclaim policies for volumes
1. Understand persistent volume claims primitive
1. Know how to configure applications with persistent storage

### Troubleshooting – 30%

1. [Evaluate cluster and node logging](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
1. [Understand how to monitor applications](https://kubernetes.io/docs/tasks/debug-application-cluster/resource-usage-monitoring/)
1. [Manage container stdout & stderr logs](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
1. [Troubleshoot application failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-application/)
1. [Troubleshoot cluster component failure](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)
1. [Troubleshoot networking](https://kubernetes.io/docs/tasks/debug-application-cluster/debug-cluster/)

## Miscellaneous:

1. [Troubleshooting use cases by Ian/Container solutions](https://github.com/ContainerSolutions/kubernetes-examples)

