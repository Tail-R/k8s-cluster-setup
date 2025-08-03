#! /usr/bin/env bash

set -euo pipefail

SSH_KEY="${HOME}/.ssh/id_ed25519"

if [ -z "${SSH_AUTH_SOCK-}" ] || ! ssh-add -l &> /dev/null; then
    eval "$(ssh-agent -s)"
    ssh-add "${SSH_KEY}"
fi

ansible-playbook site.yaml --ask-become-pass