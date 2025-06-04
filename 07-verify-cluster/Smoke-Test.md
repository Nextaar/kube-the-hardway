Smoke Test

Data Encryption
kubectl create secret generic kubernetes-the-hard-way \
  --from-literal="mykey=mydata"

#Run below command to master plane to test etcd
sudo ETCDCTL_API=3 etcdctl get \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/ca.crt \
  --cert=/etc/etcd/etcd-server.crt \
  --key=/etc/etcd/etcd-server.key\
  /registry/secrets/default/kubernetes-the-hard-way | hexdump -C


#Run basic nginx pods in cluster to test if everything is working fine
kubectl create deployment nginx --image=nginx

kubectl get pods -l app=nginx

kubectl expose deploy nginx --type=NodePort --port 80

PORT_NUMBER=$(kubectl get svc -l app=nginx -o jsonpath="{.items[0].spec.ports[0].nodePort}")

curl http://worker-IP/Hostname:$PORT_NUMBER
curl http://worker-IP/Hostname:$PORT_NUMBER
