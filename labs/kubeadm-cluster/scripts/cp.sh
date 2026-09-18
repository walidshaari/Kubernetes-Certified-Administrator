#! /bin/bash
set -eu -o pipefail

CP_IP="10.0.0.10"
NODENAME=$(hostname -s)
POD_CIDR="192.168.0.0/16"

# Pinned addon versions. Calico v3.32 is tested against Kubernetes 1.34-1.36;
# the old unpinned docs.projectcalico.org manifest still resolves but serves
# Calico v3.25.0, which does not support Kubernetes 1.35.
CALICO_VERSION="v3.32.2"
METRICS_SERVER_VERSION="v0.9.0"
# etcd 3.6 ships etcdutl, which is required for snapshot restore
# (etcdctl snapshot restore was removed in etcd 3.6).
ETCD_VERSION="v3.6.6"

sudo kubeadm config images pull

echo "Preflight Check Passed: Downloaded All Required Images"


sudo kubeadm init --apiserver-advertise-address=$CP_IP  --apiserver-cert-extra-sans=$CP_IP --pod-network-cidr=$POD_CIDR --node-name $NODENAME  --cri-socket unix:///run/containerd/containerd.sock  #--ignore-preflight-errors Swap

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Save Configs to shared /Vagrant location

# For Vagrant re-runs, check if there is existing configs in the location and delete it for saving new configuration.

config_path="/vagrant/configs"

if [ -d $config_path ]; then
   rm -f $config_path/*
else
   mkdir -p /vagrant/configs
fi

cp -i /etc/kubernetes/admin.conf /vagrant/configs/config
touch /vagrant/configs/join.sh
chmod +x /vagrant/configs/join.sh       


kubeadm token create --print-join-command > /vagrant/configs/join.sh

# Install Calico Network Plugin

curl -fsSLO "https://raw.githubusercontent.com/projectcalico/calico/${CALICO_VERSION}/manifests/calico.yaml"

kubectl apply -f calico.yaml

# Install Metrics Server (upstream release rather than a third-party copy).
# kubeadm issues self-signed kubelet serving certificates, so metrics-server
# has to be told not to verify them or `kubectl top` never reports metrics.

kubectl apply -f "https://github.com/kubernetes-sigs/metrics-server/releases/download/${METRICS_SERVER_VERSION}/components.yaml"

kubectl -n kube-system patch deployment metrics-server --type=json \
  -p='[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--kubelet-insecure-tls"}]'

# Install Helm. "Use Helm and Kustomize to install cluster components" is a
# Cluster Architecture item in the CKA curriculum, so the lab ships with it.

curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# etcd client tooling. Install both binaries: etcdctl takes the snapshot,
# etcdutl restores it and reports its status.

arch=$(dpkg --print-architecture)
cd /tmp/ && wget -q "https://github.com/etcd-io/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-${arch}.tar.gz"
tar zxf "etcd-${ETCD_VERSION}-linux-${arch}.tar.gz"
cd "etcd-${ETCD_VERSION}-linux-${arch}"
sudo cp etcdctl etcdutl /usr/local/bin

sudo -i -u vagrant bash << EOF
mkdir -p /home/vagrant/.kube
sudo cp -i /vagrant/configs/config /home/vagrant/.kube/
sudo chown 1000:1000 /home/vagrant/.kube/config
EOF




