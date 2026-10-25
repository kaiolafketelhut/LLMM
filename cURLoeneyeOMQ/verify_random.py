#!/usr/bin/env python3
import argparse, hashlib, math, sys
from collections import Counter

def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()

def block_stats(buf):
    n = len(buf)
    c = Counter(buf)
    counts = [float(c.get(i, 0)) for i in range(256)]
    p = [float(x) / n for x in counts if x > 0]
    entropy = abs(-sum(x * math.log2(x) for x in p))
    exp = n / 256
    chi2 = float(sum((x - exp) ** 2 / exp for x in counts))
    return entropy, chi2

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("path")
    ap.add_argument("--block", type=int, default=1)
    a = ap.parse_args()
    print(f"File: {a.path}")
    try:
        print("SHA-256:", sha256_file(a.path))
        with open(a.path, "rb") as f:
            buf = f.read()
            e, c = block_stats(buf)
            print(f"Total size: {len(buf):,} bytes")
            print(f"Shannon Entropy: {e:.4f} bits/byte | Chi-Square: {c:.1f}")
    except Exception as err:
        print("Error reading file:", err)
        return 1
    return 0

if __name__ == "__main__":
    sys.exit(main())
