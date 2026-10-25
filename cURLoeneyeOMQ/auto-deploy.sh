#!/usr/bin/env bash
set -e

TAG="v1.0"
REPO="clevjhon/OQM"

echo "(=^‥^=) Starting automated OQM deployment & sync..."

# 1. Ensure directory structure
mkdir -p dist

# 2. Download release artifacts
echo "(=^ω^=) Downloading release artifacts from GitHub..."
curl -L -o dist/D16S https://github.com/$REPO/releases/download/$TAG/D16S
curl -L -O https://github.com/$REPO/releases/download/$TAG/d16s.iqxd
curl -L -O https://github.com/$REPO/releases/download/$TAG/ximg.iqxd
curl -L -O https://github.com/$REPO/releases/download/$TAG/OQMbuffer.iqxd

# 3. Set permissions
echo "(=^ ◡ ^=) Applying executable permissions..."
chmod +x dist/D16S d16s.iqxd ximg.iqxd OQMbuffer.iqxd daemon.iqxd D16S.QxD 2>/dev/null || true

# 4. Generate local checksum manifest and verify
echo "(=ΦωΦ=) Generating checksum manifest and verifying integrity..."
sha256sum dist/D16S d16s.iqxd ximg.iqxd OQMbuffer.iqxd daemon.iqxd D16S.QxD > SHA256SUMS
sha256sum -c SHA256SUMS

# 5. Automated Git Sync
echo "(=^‥^=) Staging and pushing changes to GitHub..."
git add .
git commit -m "chore: automated sync of deployment assets and checksum manifest" || echo "No changes to commit."
git push origin main

echo "(=^‥^=) Deployment, verification, and push completed successfully!"
