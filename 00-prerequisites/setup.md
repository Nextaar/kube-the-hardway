Prerequisites for Kubernetes the Hard Way 

This setup was built and tested on a local development environment using VirtualBox VMs managed with Vagrant.



🔧 Host Machine Requirements:

OS: Ubuntu 22.04 LTS (or equivalent)

Virtualization: VirtualBox or KVM

Tools Installed:

Vagrant

kubectl

openssl

curl, wget, jq

iptables



📦 VM Configuration:

Master Nodes: 2 VMs

Worker Nodes: 2 VMs

Load Balancer: 1 VM

Network Range: 192.168.121.0/24

Domain: my-k8s.local



🖧 Network Interfaces:

NAT Interface: For internet access

Host-Only Interface: For cluster internal communication (192.168.121.0/24)

✅ Steps to Initialize Environment:

Clone this repo:

git clone https://github.com/yourusername/kubernetes-the-hard-way-local.git
cd kubernetes-the-hard-way-local

Start VMs using Vagrant:

vagrant up

SSH into each VM and install required packages:

sudo apt update && sudo apt install -y socat conntrack ipset ebtables ethtool

Install Docker or containerd as CRI (we use containerd):

sudo apt install containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd

Disable swap (mandatory for kubelet):

sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

Set up time sync:

sudo apt install chrony -y
sudo systemctl enable --now chronyd

Now you're ready to begin the Kubernetes setup following the rest of this repository structure.
