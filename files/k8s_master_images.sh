#!/bin/bash
K8S_VERSION=v1.13.7
ETCD_VERSION=3.2.24
DNS_VERSION=1.2.6
PAUSE_VERSION=3.1

FLANNEL_VERSION=v0.11.0-amd64
#DASHBOARD_VERSION=v1.8.3

# 基本组件
docker pull mirrorgooglecontainers/kube-apiserver:$K8S_VERSION
docker pull mirrorgooglecontainers/kube-controller-manager:$K8S_VERSION
docker pull mirrorgooglecontainers/kube-scheduler:$K8S_VERSION
docker pull mirrorgooglecontainers/kube-proxy:$K8S_VERSION
docker pull mirrorgooglecontainers/etcd:$ETCD_VERSION
docker pull mirrorgooglecontainers/pause:$PAUSE_VERSION
docker pull coredns/coredns:$DNS_VERSION

# 网络组件
docker pull quay.io/coreos/flannel:$FLANNEL_VERSION

# 修改tag
docker tag mirrorgooglecontainers/kube-apiserver:$K8S_VERSION k8s.gcr.io/kube-apiserver:$K8S_VERSION
docker tag mirrorgooglecontainers/kube-controller-manager:$K8S_VERSION k8s.gcr.io/kube-controller-manager:$K8S_VERSION
docker tag mirrorgooglecontainers/kube-scheduler:$K8S_VERSION k8s.gcr.io/kube-scheduler:$K8S_VERSION
docker tag mirrorgooglecontainers/kube-proxy:$K8S_VERSION k8s.gcr.io/kube-proxy:$K8S_VERSION
docker tag mirrorgooglecontainers/etcd:$ETCD_VERSION k8s.gcr.io/etcd:$ETCD_VERSION
docker tag mirrorgooglecontainers/pause:$PAUSE_VERSION k8s.gcr.io/pause:$PAUSE_VERSION
docker tag coredns/coredns:$DNS_VERSION k8s.gcr.io/coredns:$DNS_VERSION

#删除冗余的images
docker rmi mirrorgooglecontainers/kube-apiserver:$K8S_VERSION
docker rmi mirrorgooglecontainers/kube-controller-manager:$K8S_VERSION
docker rmi mirrorgooglecontainers/kube-scheduler:$K8S_VERSION
docker rmi mirrorgooglecontainers/kube-proxy:$K8S_VERSION
docker rmi mirrorgooglecontainers/etcd:$ETCD_VERSION
docker rmi mirrorgooglecontainers/pause:$PAUSE_VERSION
docker rmi coredns/coredns:$DNS_VERSION
