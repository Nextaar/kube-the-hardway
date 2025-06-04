#You can perform these steps as per your required version 
#Copy-Paste these steps to install the k8s required Binaries on your respective nodes

wget -q --show-progress --https-only --timestamping \
  "https://github.com/etcd-io/etcd/releases/download/v3.5.21/etcd-v3.5.21-linux-amd64.tar.gz"
  
  
   
  {
  tar -xvf etcd-v3.5.21-linux-amd64.tar.gz
  sudo mv etcd-v3.5.21-linux-amd64/etcd* /usr/local/bin/
}



INTERNAL_IP=$(ip addr show eth0 | grep "inet " | awk '{pr│vagrant@k8s-master02:~$ ip addr show eth0 | grep "inet " | awk '{pr
int $2}' | cut -d / -f 1)


#for master plane

wget -q --show-progress --https-only --timestamping \
  "https://dl.k8s.io/v1.32.3/bin/linux/amd64/kube-apiserver" \
  "https://dl.k8s.io/v1.32.3/bin/linux/amd64/kube-controller-manager" \
  "https://dl.k8s.io/v1.32.3/bin/linux/amd64/kube-scheduler" \
  "https://dl.k8s.io/v1.32.3/bin/linux/amd64/kubectl"
  

#for worker plane    
wget -q --show-progress --https-only --timestamping \
  https://dl.k8s.io/v1.32.3/bin/linux/amd64/kubectl \
  https://dl.k8s.io/v1.32.3/bin/linux/amd64/kube-proxy \
  https://dl.k8s.io/v1.32.3/bin/linux/amd64/kubelet
