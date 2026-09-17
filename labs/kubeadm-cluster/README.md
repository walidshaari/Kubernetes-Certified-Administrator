# Vagrantfile and provisioning scripts to automate kubernetes cluster setup using Kubeadm
# CKA Practice sandbox

## Credit:
   original scripts and repo were from https://github.com/scriptcamp/vagrant-kubeadm-kubernetes and [blog](https://devopscube.com/kubernetes-cluster-vagrant/)
   
   Modified to enhance startup and use containerd

## Prerequisites

1. Working Vagrant setup, tested with Virtualbox
2. As configured in the Vagrantfile the three VMs use 4 vCPUs and 6 GB RAM in
   total (control plane 2 vCPU / 2 GB, each of the two workers 1 vCPU / 2 GB),
   so give the host at least 8 GB RAM.

## Usage/Examples

To provision a cluster, execute the following commands.

```bash
git clone https://github.com/walidshaari/Kubernetes-Certified-Administrator
cd Kubernetes-Certified-Administrator/labs/kubeadm-cluster
vagrant global-status    # Check if any vagrant machines are up and where
vagrant up
```

## Set Kubeconfig file varaible.

```bash
cd vagrant-cka
cd configs
export KUBECONFIG=$(PWD)/config
```

or you can copy the config file to .kube directory.

```bash
cp config ~/.kube/
```

## What the control plane provisioning installs

- Calico as the CNI plugin, pinned to a release that supports the cluster version
- metrics-server from upstream, patched with `--kubelet-insecure-tls` so
  `kubectl top` works against kubeadm's self-signed kubelet certificates
- Helm, since "use Helm and Kustomize to install cluster components" is a
  CKA Cluster Architecture objective
- `etcdctl` and `etcdutl` in `/usr/local/bin`. Both are needed: etcdctl takes
  the snapshot, etcdutl restores it, because `etcdctl snapshot restore` was
  removed in etcd 3.6.

The Kubernetes Dashboard is no longer installed. The manifest this lab used
(dashboard v2.0.0) does not run on current Kubernetes versions, and the
dashboard's Helm repository has moved, so the install could not be verified.
The Dashboard is not part of the CKA curriculum. If you want it back, install
it yourself with Helm and add the admin-user ServiceAccount and
ClusterRoleBinding.

## To shutdown the cluster, 

```shell
vagrant halt
```

## To restart the cluster,

```shell
vagrant up
```

## To destroy the cluster, 

```shell
vagrant destroy -f
```

