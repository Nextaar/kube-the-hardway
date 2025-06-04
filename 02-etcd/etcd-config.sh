#!/bin/bash

INTERNAL_IP=$(hostname -I | awk '{print $2}') # or manually set this if needed
ETCD_NAME=$(hostname)

cat <<EOF | sudo tee /etc/etcd/config.yaml
name: ${ETCD_NAME}
data-dir: /var/lib/etcd
initial-advertise-peer-urls: https://${INTERNAL_IP}:2380
listen-peer-urls: https://${INTERNAL_IP}:2380
listen-client-urls: https://${INTERNAL_IP}:2379,https://127.0.0.1:2379
advertise-client-urls: https://${INTERNAL_IP}:2379
initial-cluster: k8s-master01=https://192.168.121.11:2380,k8s-master02=https://192.168.121.12:2380
initial-cluster-state: new
initial-cluster-token: etcd-cluster-0
client-transport-security:
  cert-file: /etc/etcd/etcd-server.crt
  key-file: /etc/etcd/etcd-server.key
  client-cert-auth: true
  trusted-ca-file: /etc/etcd/ca.crt
peer-transport-security:
  cert-file: /etc/etcd/etcd-peer.crt
  key-file: /etc/etcd/etcd-peer.key
  peer-client-cert-auth: true
  trusted-ca-file: /etc/etcd/ca.crt
EOF

sudo mkdir -p /var/lib/etcd
sudo cp etcd-server.crt etcd-server.key etcd-peer.crt etcd-peer.key ca.crt /etc/etcd/

# Enable and start etcd
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable etcd
sudo systemctl restart etcd

