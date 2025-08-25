#! /usr/bin/env bash

set -euo pipefail

PLAYBOOK="site.yaml"

SSH_KEY="${HOME}/.ssh/my_cluster_key"

# Check whether the SSH key exists
if [ ! -f "${SSH_KEY}" ]; then
    echo "ERROR: SSH key not found at ${SSH_KEY}" >&2
    exit 1
fi

# Start SSH agent if not running
if [ -z "${SSH_AUTH_SOCK-}" ]; then
    eval "$(ssh-agent -s)"
fi

# Cache SSH key
if ! ssh-add -l | grep -q "${SSH_KEY}"; then
    ssh-add "${SSH_KEY}"
fi

# Install required modules
ansible-galaxy collection install -r requirements.yaml

if [ "${#}" -gt 0 ]; then
    ansible-playbook "${PLAYBOOK}" --ask-become-pass --limit "${@}"
else
    ansible-playbook "${PLAYBOOK}" --ask-become-pass
fi
