#!/bin/bash
# secrets: GH_TOKEN
# setup.sh: runs as your user on each new machine, after it joins, with bash -e.
# It reads only the secrets named above, with agents-secret. Keep it safe to run again.
# An example: sign gh in with the token GH_TOKEN from your Secrets.
set -eu
if ! command -v gh >/dev/null 2>&1; then
  echo "setup.sh: gh is not installed; root.sh installs it" >&2
  exit 1
fi
# The token goes from agents-secret to gh on stdin: it is never in a line or a log.
agents-secret GH_TOKEN | gh auth login --with-token
gh auth setup-git
gh auth status
