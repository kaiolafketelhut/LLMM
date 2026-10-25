#!/usr/bin/env python3
import hashlib, math, urllib.request, sys
from collections import Counter

TARGETS = {
    "oeneyecat.sh": "https://raw.githubusercontent.com/clevjhon/GIT/master/oeneyecat.sh",
    "86-DOS_0.1_Serial11.img": "https://raw.githubusercontent.com/clevjhon/L3WWZ76K1-/main/86-DOS%20Version%200.1-C%20-%20Serial%20%2311%20(ORIGINAL%20DISK).img",
    "install.BIN": "https://raw.githubusercontent.com/clevjhon/TERMUXqTREMUX/main/install.BIN"
}

PHI = 1.618034

def analyze_buffer(buf):
    n = len(buf)
    if n == 0:
        return 0.0, 0.0, 0.0
    c = Counter(buf)
    counts = [float(c.get(i, 0)) for i in range(256)]
    p = [float(x) / n for x in counts if x > 0]
    entropy = abs(-sum(x * math.log2(x) for x in p))
    exp = n / 256
    chi2 = float(sum((x - exp) ** 2 / exp for x in counts))
    fractal_metric = entropy * (PHI / (1.0 + (chi2 / (n + 1))))
    return entropy, chi2, fractal_metric

def main():
    print(f"=== Global & Fractal Repository Verification (PHI: {PHI}) ===\n")
    for name, url in TARGETS.items():
        print(f"[-] Fetching {name}...")
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            with urllib.request.urlopen(req) as resp:
                buf = resp.read()
            
            sha = hashlib.sha256(buf).hexdigest()
            entropy, chi2, fractal = analyze_buffer(buf)
            
            print(f"    Target Size    : {len(buf):,} bytes")
            print(f"    SHA-256        : {sha}")
            print(f"    Shannon Entropy: {entropy:.4f} bits/byte")
            print(f"    Chi-Square     : {chi2:.1f}")
            print(f"    Fractal Metric : {fractal:.4f}")
            print("-" * 60)
        except Exception as e:
            print(f"    [ERROR] Failed to fetch/analyze {name}: {e}")
            print("-" * 60)

if __name__ == "__main__":
    sys.exit(main())
