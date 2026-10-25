touch CHANGELOG.md; for c in $(git log --reverse --format=%h); do grep -q "^- $c " CHANGELOG.md || git log -1 --format="- %h %ad %s" --date=short $c >> CHANGELOG.md; done
