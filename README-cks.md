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
1. [Use Network security policies to restrict cluster level access]()
1. [Use CIS benchmark to review the security configuration of Kubernetes components]()
 (etcd, kubelet, kubedns, kubeapi)
1. [Properly set up Ingress objects with security control]()
1. [Protect node metadata and endpoints]()
1. [Minimize use of, and access to, GUI elements]()
1. [Verify platform binaries before deploying]()

### 15% - Cluster Hardening
1. [Restrict access to Kubernetes API]()
1. [Use Role Based Access Controls to minimize exposure]()
    * [handy site collects together articles, tools and the official documentation all in one place](https://rbac.dev/)
1. [Exercise caution in using service accounts e.g. disable defaults, minimize permissions on newly created ones]()
1. [Update Kubernetes frequently]()
1. [Minimize host OS footprint (reduce attack surface)]()
1. [Minimize IAM roles]()
1. [Minimize external access to the network]()
1. [Appropriately use kernel hardening tools such as AppArmor, seccomp]()


### 15% System Hardening

1. [Minimize host OS footprint (reduce attack surface)]()
1. [Minimize IAM roles]()
1. [Minimize external access to the network]()
1. [Appropriately use kernel hardening tools such as AppArmor, seccomp]()

    !? where is selinux? assume exam systems are ubuntu

### 20% - Minimize Microservice Vulnerabilities

1. [Setup appropriate OS level security domains e.g. using PSP, OPA, security contexts]()
1. [Manage kubernetes secrets]()
1. [Use container runtime sandboxes in multi-tenant environments (e.g. gvisor, kata containers)]()
1. [Implement pod to pod encryption by use of mTLS]()

### 20% - Supply Chain Security
1. [Minimize base image footprint]()
1. [Secure your supply chain: whitelist allowed image registries, sign and validate images]()
1. [Use static analysis of user workloads (e.g. kubernetes resources, docker files)]()
1. [Scan images for known vulnerabilities]()


### 20% - Monitoring, Logging and Runtime Security

1. [Perform behavioral analytics of syscall process and file activities at the host and container
 level to detect malicious activities]()
1. [Detect threats within physical infrastructure, apps, networks, data, users and workloads]()
1. [Detect all phases of attack regardless where it occurs and how it spreads]()
1. [Perform deep analytical investigation and identification of bad actors within environment]()
1. [Ensure immutability of containers at runtime]()
1. [Use Audit Logs to monitor access]()


### Extra Kubernetes security resources
1. [Aquasecurity Blogs](https://blog.aquasec.com/)
1. [control-plane/Andrew Martin @sublimino: 11 ways not to get hacked](https://control-plane.io/posts/11-ways-not-to-get-hacked/)
1. [InGuardians/Jay Beale: Kubernetes Practical attacks and defenses](https://youtu.be/LtCx3zZpOfs)
1. [Google/Ian Lewis : Kubernetes security best practices](https://youtu.be/wqsUfvRyYpw)

#### CVEs
1. [CNCF Kubernetes Security Anatomy and the Recently Disclosed CVEs (CVE-2020-8555, CVE-2020-8552)](https://youtu.be/Dp1RCYCpyJk)
