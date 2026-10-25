#!/usr/bin/env bash
set -e
cd ~/demo-repository
mkdir -p.chat
mkdir -p articles
git pull --rebase 2>/dev/null || true
./autoexec_append.sh
git add -A
git commit -m "auto between chats $(date -u removed-phone
git push
gh workflow run pages.yml
gh run list --workflow="pages.yml" -L 3
