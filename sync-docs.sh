#!/bin/sh
# copy files the page needs from the repo root into docs/
cd "$(dirname "$0")" || exit 1
mkdir -p docs/archive
for f in catalog.js clock-catalog.js clock-box.html clock.html; do
  [ -f "$f" ] && cp "$f" "docs/$f"
done
rm -f docs/archive/index-*.html
cp archive/index-*.html docs/archive/ 2>/dev/null
echo "docs synced"
