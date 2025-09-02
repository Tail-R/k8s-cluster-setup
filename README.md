# Project Title

Kubernetes-Based High Availability Game Server Setup Using Ansible

## Purpose

This project automates the provisioning of Kubernetes (K8s) cluster and Ceph cluster, enables recovery from failures, and facilitates rapid server recreation when adding new nodes.

Also, the provisioning is idempotent, so you can create a cluster or add nodes to a cluster by running the same playbook.

## Features

- Automated Kubernetes cluster provisioning
    - Deploy game server
    - Deploy Envoy Proxy
    - Deploy Metrics Server
    - Create an entry point using MetalLB (L2 Mode) + LoadBalancer Service
    - Deploy CephFS CSI driver
    - Mount CephFS as storage for gameplay logs

- Automated CephFS cluster provisioning
    - Bootstrap using cephadm, including SSH key installation
    - Deploy components like MON, OSD, Data Pool, FS, MDS

- Automated Prometheus provisioning
    - Deploy node-exporter
    - Deploy kube-state-metrics
    - Deploy Prometheus Server

- Automated Grafana provisoning
    - Deploy Grafana Server

## Dependencies
- ansible 2.16.0

## How to Use

1. Clone the repository:
```bash
git clone https://github.com/Tail-R/k8s-cluster-setup

cd k8s-cluster-setup
```

2. Edit `inventory/hosts.ini` to match your network environment.

3. Run the following commands:
```bash
chmod +x play.sh

./play.sh
```

## Notes

- This playbook assumes that the K8s nodes are Arch-based and the CephFS nodes are Debian-based.

## License

MIT
