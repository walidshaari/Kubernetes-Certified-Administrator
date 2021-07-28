# Vagrantfile and provisioning scripts to automate kubernetes cluster setup using Kubeadm
# CKA Practice sandbox

## Credit:
   original scripts and repo were from https://github.com/scriptcamp/vagrant-kubeadm-kubernetes and [blog](https://devopscube.com/kubernetes-cluster-vagrant/)
   
   Modified to enhance startup and use containerd

## Prerequisites

1. Working Vagrant setup, tested with Virtualbox
2. Memory greather  4 GByteRAM for the labs as the Vms use 4 vCPUS and 4 GB RAM
 
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

## Kubernetes Dashboard URL

```bash
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=kubernetes-dashboard
```

## Kubernetes login token

Vagrant up will create the admin user token and saves in the configs directory.

```shell
cd Kubernetes-Certified-Administrator/labs/kubeadm-cluster
cd configs
cat token
```

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

