# Linux Foundation Advanced Cloud Engineer (LF ACE) path

The [Advanced Cloud Engineer IT Professional Program](https://training.linuxfoundation.org/) bundles several Linux Foundation courses with the CKA exam. This page maps the courses to the CKA domains, for anyone taking the programme.

> Course content and lab numbering change between versions. Always use the newest lab PDF published in your course.

## Recommended order

```
LFS158  Introduction to Kubernetes
   ↓
LFS253  Containers Fundamentals
   ↓
LFS258  Kubernetes Fundamentals
   ↓
CKA exam
   ↓
LFS243  Service Mesh Fundamentals
LFS241  Monitoring Systems and Services with Prometheus
LFS242  Cloud Native Logging with Fluentd and Fluent Bit
LFS244  Managing Kubernetes Applications with Helm
```

`LFS002` covers programme logistics: forum, office hours, study plan.

Follow the official order. Each course builds the ground the next one stands on.

## Course to exam mapping

### LFS158 - Introduction to Kubernetes
Architecture, objects, the control plane, basic operations.
**CKA value:** indirect. It builds the mental model that makes LFS258 make sense. Understand the architecture well; don't grind the quizzes. Some version notes in the courseware may be dated (features described as alpha or beta that are now stable), so check them against kubernetes.io.

### LFS253 - Containers Fundamentals
Container internals, images, runtimes, registries, container networking and storage.
**CKA value:** sits underneath the **Troubleshooting** domain (30%). When a Pod fails at the container level (bad image, wrong entrypoint, permissions, resource limits), this is the knowledge that lets you read the failure instead of guessing. Treat it as its own subject, not a box to tick.

### LFS258 - Kubernetes Fundamentals
Installation, the API, workloads, scheduling, networking, storage, security, cluster maintenance.
**CKA value:** direct, across all five domains.

**Highest-value lab: "Basic Node Maintenance"** (Lab 4.1 in the version used when this page was written). It covers etcd snapshots, `kubeadm upgrade`, static Pods, and cordon/drain, which concentrates more Cluster Architecture marks than any other single lab. Repeat it until it's boring.

**Known gap:** the labs mostly build things correctly, while the exam's largest domain is troubleshooting. Add deliberate break-and-fix practice: see [TROUBLESHOOTING.md](../TROUBLESHOOTING.md).

### LFS241 / LFS242 / LFS243 / LFS244 - after the exam
Prometheus, Fluentd and Fluent Bit, service mesh, Helm.
**CKA value:** mostly beyond the exam. Two notes:
- The current CKA curriculum includes **using Helm and Kustomize to install cluster components**. You need basic Helm usage (`helm repo add`, `helm install`, `helm upgrade`, values) for the exam. LFS244 goes much deeper than that.
- Understanding what `kubectl top` depends on (metrics-server) helps in troubleshooting tasks.

## Where to spend time before the exam

| CKA domain | Weight | Main course source | Add |
|---|---|---|---|
| Troubleshooting | 30% | LFS258 + LFS253 | Break-and-fix drills |
| Cluster Architecture, Installation & Configuration | 25% | LFS258 (Basic Node Maintenance lab) | Helm/Kustomize basics, CRDs and operators |
| Services & Networking | 20% | LFS258 | Gateway API practice |
| Workloads & Scheduling | 15% | LFS258 | HorizontalPodAutoscaler |
| Storage | 10% | LFS258 | Default StorageClass, dynamic provisioning |
