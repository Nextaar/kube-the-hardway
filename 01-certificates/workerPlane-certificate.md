#worker plane certificate generation 

cat > openssl-worker-1.cnf <<EOF
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name

[req_distinguished_name]

[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = worker-1
IP.1 = 192.168.121.118
EOF


openssl genrsa -out k8s-worker01.key 2048
openssl req -new -key k8s-worker01.key -subj "/CN=system:node:worker-1/O=system:nodes" -out k8s-worker01.csr -config openssl-k8s-worker01.cnf
openssl x509 -req -in k8s-worker01.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out k8s-worker01.crt -extensions v3_req -extfile openssl-k8s-worker01.cnf -days 1000
