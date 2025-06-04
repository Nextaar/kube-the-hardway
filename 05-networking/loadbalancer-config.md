#Please install haproxy on the vm on which you are using it as a lb


cat <<EOF | sudo tee /etc/haproxy/haproxy.cfg 
global
    log /dev/log local0
    log /dev/log local1 notice
    daemon
    user haproxy
    group haproxy

defaults
    log     global
    mode    tcp
    option  dontlognull
    timeout connect 5s
    timeout client  30s
    timeout server  30s

frontend kubernetes
    bind 192.168.121.17:6443
    option tcplog
    mode tcp
    default_backend kubernetes-master-nodes

backend kubernetes-master-nodes
    mode tcp
    balance roundrobin
    option tcp-check
    server k8s-master01 192.168.121.47:6443 check fall 3 rise 2
    server k8s-master02 192.168.121.165:6443 check fall 3 rise 2

EOF




#test using using your lb ip:port/version -k 

curl  https://192.168.121.17:6443/version -k
