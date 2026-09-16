# Vagrantfile and provisioning scripts to automate kubernetes cluster setup using Kubeadm
# CKA Practice sandbox

## Credit:
   original scripts and repo were from https://github.com/scriptcamp/vagrant-kubeadm-kubernetes and [blog](https://devopscube.com/kubernetes-cluster-vagrant/)
   
   Modified to enhance startup and use containerd

## Prerequisites

1. Working Vagrant setup. The upstream lab was tested with VirtualBox.
   A libvirt/KVM provider is also configured, for Linux hosts where KVM is
   the native choice - see below.
2. As configured in the Vagrantfile the three VMs use 4 vCPUs and 6 GB RAM in
   total (control plane 2 vCPU / 2 GB, each of the two workers 1 vCPU / 2 GB),
   so give the host at least 8 GB RAM.

### Running on KVM/libvirt instead of VirtualBox

On Fedora and most Linux hosts, KVM is built into the kernel, while VirtualBox
needs out-of-tree modules that break across kernel updates and with Secure Boot.

```bash
sudo dnf install vagrant vagrant-libvirt libvirt libvirt-devel nfs-utils
sudo systemctl enable --now libvirtd nfs-server
sudo usermod -aG libvirt $USER   # log out and back in
cd labs/kubeadm-cluster
vagrant up --provider=libvirt --no-parallel
```

**`--no-parallel` is required.** With VirtualBox, Vagrant brings the machines
up one at a time. Under libvirt it creates them in parallel, so the workers run
`node.sh` while the control plane is still running `kubeadm init`, and fail with
`/vagrant/configs/join.sh: No such file or directory`. The control plane has to
finish before a worker can join, and there is no Vagrantfile setting that forces
serial ordering - it is a command-line flag.

`/vagrant` is shared over NFS, which is vagrant-libvirt's default and needs
`nfs-utils` and a running `nfs-server` on the host. `vagrant up` will ask for
sudo to edit `/etc/exports`, and the libvirt firewall zone has to allow NFS.
Do not switch this to 9p: with `qemu:///system` QEMU runs as `qemu:qemu` and
needs to traverse *and write* the exported directory, which a project directory
under `$HOME` does not allow (home directories are 0700/0710), and `cp.sh`
writes `/vagrant/configs`. A path with spaces in it is also worth avoiding,
since `/etc/exports` is whitespace-delimited.

Install `vagrant` and `vagrant-libvirt` **from the same source**. Mixing
HashiCorp's vagrant RPM, which lives in `/opt/vagrant` with its own bundled
gems, and Fedora's `vagrant-libvirt` package, which installs into
`/usr/share/vagrant/gems`, leaves Vagrant unable to see the plugin:
`vagrant plugin list` reports none and `vagrant up --provider=libvirt` fails
with "The provider 'libvirt' could not be found". Either use Fedora's packages
for both, or keep HashiCorp's vagrant and run
`vagrant plugin install vagrant-libvirt`, which needs `libvirt-devel`,
`ruby-devel` and a compiler to build its native extension.

The Vagrantfile swaps the box for the libvirt provider, because the `bento`
boxes it uses do not publish a libvirt variant. It also mounts `/vagrant` over
9p so no NFS server is needed on the host; remove the `type` and `accessmode`
options in the Vagrantfile to fall back to NFS.

## Usage/Examples

To provision a cluster, execute the following commands.

```bash
git clone https://github.com/walidshaari/Kubernetes-Certified-Administrator
cd Kubernetes-Certified-Administrator/labs/kubeadm-cluster
vagrant global-status    # Check if any vagrant machines are up and where
vagrant up
```

## Set Kubeconfig file variable.

```bash
cd configs
export KUBECONFIG=$(pwd)/config
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

