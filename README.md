This repository documents the setup of a Kubernetes cluster from scratch on an on-premise environment, following the principles of the Kubernetes the Hard Way approach. The process is inspired by Mumshad Mannambeth's fork of Kelsey Hightower's original guide.

⚙️ This setup does not rely on kubeadm, managed services, or cloud-specific tooling. Every component is manually bootstrapped for learning and production-ready understanding.



🔧 Key Highlights
Manually generated TLS certificates and Kubernetes kubeconfigs

Deployed a high-availability etcd cluster

Installed and configured all control plane components: kube-apiserver, kube-controller-manager, kube-scheduler

Set up worker nodes with kubelet and kube-proxy, and bootstrap authentication

Configured Calico as the CNI plugin

Deployed CoreDNS for cluster service discovery

Verified the cluster end-to-end using manual inspection and test workloads

Services exposed via NodePort on an HAProxy-based load balancer



🖥️ Environment Details
Platform: On-Premise using VirtualBox VMs on Ubuntu 22.04

Container Runtime: containerd

CNI Plugin: Calico

DNS Addon: CoreDNS

Cluster Network CIDR: 192.168.121.0/24

Kubernetes Service CIDR: 10.96.0.0/24

Load Balancer: HAProxy



📁 Repository Structure
kubernetes-the-hard-way-on-prem/
├── 00-prerequisites/         # Base VM setup and OS configurations
├── 01-certificates/          # Certificate Authority and TLS certs
├── 02-etcd/                  # etcd cluster setup
├── 03-control-plane/         # Kubernetes master components
├── 04-worker-nodes/          # Kubelet, Kube Proxy, and Bootstrap tokens
├── 05-networking/            # Calico CNI setup
├── 06-dns/                   # CoreDNS manifest
├── 07-verify-cluster/        # Test cases and verification steps
└── screenshots/              # Visual proofs of working cluster


✅ Verification
Tested workloads and kubectl commands to confirm:

All nodes are Ready

Pods can communicate across nodes

DNS resolution works within the cluster

Services are reachable via NodePort


📸 UI Preview




🙌 Credits
Special thanks to:

Kelsey Hightower — original guide author

Mumshad Mannambeth — adaptation for local/VirtualBox use

The Kubernetes community for continued documentation and tooling support
