curl -L  https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz -o etcd-v2.0.11-linux-amd64.tar.gz
tar xvf etcd-v2.0.11-linux-amd64.tar.gz
cd etcd-v2.0.11-linux-amd64
mv etcd* /usr/local/bin/
