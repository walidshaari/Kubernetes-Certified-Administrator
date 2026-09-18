# Common misconceptions

Study material, including a lot of third-party and AI-generated content, often has a plausible structure with wrong details. These are the ones that cause the most confusion when you are troubleshooting. When in doubt, check against [kubernetes.io](https://kubernetes.io/docs/).

## Control plane

**Misconception:** The scheduler, controller manager and kubelet read from and write to etcd.
**Reality:** **Only the API server talks to etcd.** Every other component talks to the API server, and most of them keep a long-lived *watch* connection open so the API server pushes changes to them. This is why a broken API server makes the whole cluster look broken, and why etcd backup and restore is done at the etcd level, not through `kubectl`.
Docs: [Cluster architecture](https://kubernetes.io/docs/concepts/architecture/)

## Services

**Misconception:** ClusterIP, NodePort and LoadBalancer are three alternative kinds of Service.
**Reality:** They are **layers**. A NodePort Service also gets a ClusterIP. A LoadBalancer Service also gets a NodePort (by default) and a ClusterIP. Each type adds a way in from further outside the cluster.
Docs: [Service](https://kubernetes.io/docs/concepts/services-networking/service/)

**Misconception:** A Service is a load balancer, like a box in the data centre that traffic flows through.
**Reality:** A Service is mostly **rules programmed onto every node**. kube-proxy (or a CNI plugin that replaces it) watches Services and EndpointSlices and writes packet-forwarding rules (iptables, IPVS or nftables) on each node. There is no single process that the traffic passes through. That's why "the Service is broken" usually means the selector, the ports, or the endpoints, not the Service object itself.
Docs: [Virtual IPs and Service proxies](https://kubernetes.io/docs/reference/networking/virtual-ips/)

**Misconception:** Creating an Ingress resource makes traffic flow.
**Reality:** Ingress is a separate object type that **does nothing without an Ingress controller** running in the cluster. The same applies to the Gateway API: a Gateway needs a controller that implements its GatewayClass.
Docs: [Ingress controllers](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/), [Gateway API](https://kubernetes.io/docs/concepts/services-networking/gateway/)

## NetworkPolicy

**Misconception:** NetworkPolicy is a perimeter firewall, and traffic is blocked unless allowed.
**Reality:** By default, **all traffic is allowed**. Once any policy selects a Pod for a direction (ingress or egress), that Pod becomes **deny-by-default in that direction**, and only what some policy explicitly allows gets through. Policies add up; there are no "deny" rules. Also, NetworkPolicy only works if the CNI plugin enforces it. Some plugins accept the objects and silently ignore them.
Docs: [Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)

A common trap: an egress policy that forgets DNS. The app's traffic is allowed, but it can't resolve names, because UDP/TCP port 53 to CoreDNS isn't.

## Containers and resources

**Misconception:** `OOMKilled` means the node ran out of memory.
**Reality:** Usually it means the **container hit its own memory limit**. Limits are enforced by the Linux kernel through *cgroups* (the kernel feature that caps how much CPU and memory a group of processes can use). Node-level memory pressure causes *eviction* instead, which shows up differently.
Docs: [Resource management for Pods and containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/), [Node-pressure eviction](https://kubernetes.io/docs/concepts/scheduling-eviction/node-pressure-eviction/)

**Misconception:** Container fundamentals are optional background for the CKA.
**Reality:** Many cluster failures trace back to container internals. A kubelet and container runtime configured with **different cgroup drivers** (`systemd` vs `cgroupfs`) is a classic cause of a node that won't come up. Namespaces (what a process can see), cgroups (what it can use) and layered filesystems (how images are built) are the three kernel mechanisms underneath every Pod.
Docs: [Configuring a cgroup driver](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#cgroup-drivers)

## Lab environments

**Misconception:** Paths and names in lab PDFs are the same on every Linux system.
**Reality:** Most lab guides are written for Ubuntu. On other distributions (Fedora, RHEL, Rocky), package managers, repository files, cgroup paths and systemd slice names differ. **Read paths from the live system** (`systemctl status`, `ls`, `grep` the kubelet config) instead of copying them from the PDF.

## Storage

**Misconception:** A `Pending` PVC is always an error.
**Reality:** With a StorageClass that uses `volumeBindingMode: WaitForFirstConsumer`, the PVC **stays Pending on purpose** until a Pod that uses it is scheduled. This lets the volume be created on the node where the Pod will run.
Docs: [Storage classes - volume binding mode](https://kubernetes.io/docs/concepts/storage/storage-classes/#volume-binding-mode)
