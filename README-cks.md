# Certified Kubernetes Security Specialist (CKS)  
**Coming soon November 2020**

Online resources that will help you prepare for taking the Kubernetes Certified Kubernetes Security Specialist Certification exam.

**Disclaimer**: This is not likely a comprehensive list as the exam is not out yet, most likely will be a moving target with the fast pace of k8s development
- please make a pull request if there something wrong or that should be added, or updated in here.

I will try to restrict the cross references of resources to [kubernetes.io](kubernetes.io) as CNCF/Linux Foundation allows you search **k8s.io**. Youtube videos and other resources e.g. blogs will be optional.
Content is scarse, will get updates by me and other contributors as we prepare for the CKS exam journey.

Ensure you have the right version of Kubernetes documentation selected (e.g. v1.19 as of 15th July announcement) especially for API objects and annotations.

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

### 15% - Cluster Hardening
* [Restrict access to Kubernetes API]()
* [Use Role Based Access Controls to minimize exposure]()
* [Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones]()
* [Update Kubernetes frequently]()
* [Minimize host OS footprint (reduce attack surface)]()
* [Minimize IAM roles]()
* [Minimize external access to the network]()
* [Appropriately use kernel hardening tools such as AppArmor, seccomp]()


### 15% System Hardening

* [Minimize host OS footprint (reduce attack surface)]()
* [Minimize IAM roles]()
* [Minimize external access to the network]()
* [Appropriately use kernel hardening tools such as AppArmor, seccomp]()

    !? where is selinux? assume exam systems are ubuntu

### 20% - Minimize Microservice Vulnerabilities

* [Setup appropriate OS level security domains e.g. using PSP, OPA, security contexts]()
* [Manage kubernetes secrets]()
* [Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)]()
* [Implement pod to pod encryption by use of mTLS]()

### 20% - Supply Chain Security
* [Minimize base image footprint]()
* [Secure your supply chain: whitelist allowed image registries, sign and validate images]()
* [Use static analysis of user workloads (e.g. kubernetes resources, docker files)]()
* [Scan images for known vulnerabilities]()


### 20% - Monitoring, Logging and Runtime Security

* [Perform behavioral analytics of syscall process and file activities at the host and container
 level to detect malicious activities]()
* [Detect threats within physical infrastructure, apps, networks, data, users and workloads]()
* [Detect all phases of attack regardless where it occurs and how it spreads]()
* [Perform deep analytical investigation and identification of bad actors within environment]()
* [Ensure immutability of containers at runtime]()
* [Use Audit Logs to monitor access]()


### Extra Kubernetes security resources
* [Aquasecurity Blogs](https://blog.aquasec.com/)
* [control-plane/Andrew Martin @sublimino: 11 ways not to get hacked](https://control-plane.io/posts/11-ways-not-to-get-hacked/)
* [InGuardians/Jay Beale: Kuberntes Practical attackes and defenses](https://youtu.be/LtCx3zZpOfs)
* [Google/Ian Lewis : Kubernetes security best practices](https://youtu.be/wqsUfvRyYpw)
