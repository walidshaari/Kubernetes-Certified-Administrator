# Certified Kubernetes Security Specialist (CKS)  
**Coming soon November 2020**

Online resources that will help you prepare for taking the Kubernetes Certified Kubernetes Security Specialist Certification exam.

**Disclaimer**: This is not likely a comprehensive list as the exam is not out yet, most likely will be a moving target with the fast pace of k8s development
- please make a pull request if there something wrong or that should be added, or updated in here.

I tried to restrict the cross references of resources to [kubernetes.io](kubernetes.io). Youtube videos and other blog resources are optional.
However, I still found them useful in my k8s learning journey.

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.19 as of 15th July annoucment) especially for API objects and annotations.

## Exam Objectives

These are the exam objectives you review and understand in order to pass the test.

* [CNCF Exam Curriculum repository ](https://github.com/cncf/curriculum)


### 10% - [Cluster Setup](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)
* [Use Network security policies to restrict cluster level access]()
* [Use CIS benchmark to review the security configuration of Kubernetes components]()
 (etcd, kubelet, kubedns, kubeapi)
* [Properly set up Ingress objects with security control]()
* [Protect node metadata and endpoints]()
* [Minimize use of, and access to, GUI elements]()
* [Verify platform binaries before deploying]()

### 15% - [Cluster Hardening]()
* [Restrict access to Kubernetes API]()
* [Use Role Based Access Controls to minimize exposure]()
* [Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones]()
* [Update Kubernetes frequently]()
* [Minimize host OS footprint (reduce attack surface)]()
* [Minimize IAM roles]()
* [Minimize external access to the network]()
* [Appropriately use kernel hardening tools such as AppArmor, seccomp]()


### Extra Kubernetes security resources
* [Aquasecurity Blogs]()
* 
