kubectl apply -f https://github.com/Nextaar/kube-the-hardway/blob/master/08-manifests/coredns.yaml



kubectl get pods -l k8s-app=kube-dns -n kube-system  

