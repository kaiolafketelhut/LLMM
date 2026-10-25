#!/bin/bash
cd "$(dirname "$0")" || exit 1
PATTERNS='\.(deb|zip|img|bin|tar\.gz)$'
SITE="https://colegio-san-caio.github.io/demo-repository"
PFX="${PREFIX:-/data/data/com.termux/files/usr}"
OUT="$HOME/oeneye/dist"
case "$1" in
  list)
    git ls-files | grep -E "$PATTERNS" | while read -r f; do
      printf '%s  %8s  %s\n' "$(sha256sum "$f" | cut -c1-12)" "$(stat -c %s "$f")" "$f"
    done ;;
  verify)
    sha256sum -c assets/checksum.sha256
    live=$(curl -s "$SITE/oeneyeOS.img?x=$(date +%s)" | sha256sum | cut -d' ' -f1)
    here=$(sha256sum oeneyeOS.img | cut -d' ' -f1)
    if [ "$live" = "$here" ]; then echo "live oeneyeOS.img: OK"; else echo "live oeneyeOS.img: MISMATCH (Pages may still be deploying)"; fi ;;
  build)
    sha256sum -c assets/checksum.sha256 || { echo "checksums stale - fix before build"; exit 1; }
    V=$(date +%Y%m%d.%H%M); R="$OUT/root"
    rm -rf "$R"; mkdir -p "$R/DEBIAN" "$R$PFX/share/oeneyeos" "$R$PFX/bin"
    cp oeneyeOS.img stage2.bin boot.bin stage2.asm "$R$PFX/share/oeneyeos/"
    printf '#!/bin/sh\nexec qemu-system-i386 -fda %s/share/oeneyeos/oeneyeOS.img -boot a -nographic "$@"\n' "$PFX" > "$R$PFX/bin/oeneyeos"
    chmod 755 "$R$PFX/bin/oeneyeos"
    printf 'Package: oeneyeos\nVersion: %s\nArchitecture: all\nMaintainer: Kai Ketelhut\nDescription: oeneyeOS floppy image with local QEMU launcher\n' "$V" > "$R/DEBIAN/control"
    chmod -R u=rwX,go=rX "$R" && dpkg-deb --root-owner-group --build "$R" "$OUT/oeneyeos_${V}_all.deb" && ls -l "$OUT"/oeneyeos_*.deb ;;
  install)
    dpkg -i "$(ls -1t "$OUT"/oeneyeos_*.deb | head -1)" ;;
  run)
    command -v qemu-system-i386 >/dev/null || { echo "qemu-system-i386 not found"; exit 1; }
    oeneyeos ;;
  ""|changes)
    H="${2:-24}"
    out=$(git log --since="$H hours ago" --name-status --format= | grep -E "$PATTERNS" | sort -u)
    if [ -z "$out" ]; then echo "No package changes in the last $H hours."; else echo "$out"; fi ;;
  *)
    echo "usage: $0 [changes [hours] | list | verify | build | install | run]" ;;
esac
