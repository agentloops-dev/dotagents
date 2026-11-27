#!/bin/bash
# root.sh: runs once, as root, on each new machine's first boot, with bash -e.
# It goes to the provider in clear: do not put a token here.
# An example: the GitHub CLI, from GitHub's own package source.
set -eu
if command -v gh >/dev/null 2>&1; then
  gh --version
  exit 0
fi
if ! command -v apt-get >/dev/null 2>&1; then
  echo "root.sh: no apt-get here; install gh with this machine's package manager" >&2
  exit 0
fi
export DEBIAN_FRONTEND=noninteractive
install -d -m 755 /etc/apt/keyrings
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  -o /etc/apt/keyrings/githubcli-archive-keyring.gpg
chmod 644 /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  > /etc/apt/sources.list.d/github-cli.list
apt-get -o DPkg::Lock::Timeout=300 update
apt-get -o DPkg::Lock::Timeout=300 install -y gh
gh --version
