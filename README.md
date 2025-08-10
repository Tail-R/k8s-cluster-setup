# Project Title

Kubernetes-Based High Availability Game Server Setup Using Ansible

## Purpose

This project automates the provisioning of Kubernetes (K8s) cluster nodes, enables recovery from failures, and facilitates rapid server recreation when adding new nodes.

## Features

- Automated provisioning with Ansible
- Installs and configures essential tools such as Docker and Kubernetes
- Sets up the control plane
- Sets up worker nodes
- Configures proxy (TCP-based reverse proxy)
- Init control plane
- Join worker nodes
- Deploy game server
- Deploy envoy proxy
- Expose the physical IP for envoy proxy using MetalLB (L2 Mode) + LoadBalancer service

<!-- ## Architecture

![Architecture Diagram](./architecture.png) -->

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

- This project currently supports Arch Linux only.

## License

MIT