FROM centos:7
MAINTAINER shaun@projectcalico.org

# Load etcd early to avoid redownloading it every time.
ADD get-etcd.sh /get-etcd.sh
RUN /get-etcd.sh

RUN yum install -y yum-plugin-priorities
RUN yum install -y epel-release
RUN yum install -y util-linux

ADD etcd.sysconf /etc/sysconfig/etcd
ADD start-etcd /usr/local/bin/start-etcd
ADD etcd.service /usr/lib/systemd/system/etcd.service
RUN systemctl enable etcd

# Workaround #875 felix incorrectly depends on neutron deps
RUN yum install -y python-eventlet python-six 

ADD rpms /rpms
RUN yum install -y /rpms/*

CMD ["bash", "-c", "echo foo; calico-felix"] 
