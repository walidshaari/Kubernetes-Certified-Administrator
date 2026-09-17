#! /bin/bash
set -eu -o pipefail

# Minor version of the package repository (pkgs.k8s.io is versioned per minor release).
# Bump this AND KUBERNETES_VERSION together when the exam moves to a new minor.
KUBERNETES_MINOR="v1.35"
# Package versions from pkgs.k8s.io use the "-1.1" suffix, not the old "-00" suffix.
KUBERNETES_VERSION="1.35.8-1.1"

# disable swap 
sudo swapoff -a
# keeps the swap off during reboot
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release containerd bash-completion

# requirements to install Containerd https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo mkdir -p /etc/containerd
cat <<EOF | sudo tee /etc/containerd/config.toml
version = 2
[plugins]
  [plugins."io.containerd.grpc.v1.cri"]
    [plugins."io.containerd.grpc.v1.cri".containerd]
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]
        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc]
          runtime_type = "io.containerd.runc.v2"
          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]
            SystemdCgroup = true
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

sudo systemctl restart containerd
sudo systemctl enable containerd --now

echo "Container Runtime Configured Successfully"

# The legacy apt.kubernetes.io / kubernetes-xenial repository was frozen in 2023 and
# removed in March 2024, so the old lines here could no longer install anything.
# Packages now come from the community-owned pkgs.k8s.io, which is split per minor version.
# https://kubernetes.io/blog/2023/08/15/pkgs-k8s-io-introduction/
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/${KUBERNETES_MINOR}/deb/Release.key \
  | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${KUBERNETES_MINOR}/deb/ /" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y kubelet=$KUBERNETES_VERSION kubectl=$KUBERNETES_VERSION kubeadm=$KUBERNETES_VERSION
sudo apt-mark hold kubelet kubeadm kubectl

