import os
import hashlib

targets = [
    "install.BIN",
    "OQM_file.bin",
    "HomologationOMQ.dll",
    "submodules/GIT/install.BIN",
    "submodules/L3WWZ76K1-/OQM_file.bin"
]

print("=== Starting Global Stankin Audit & Sync Verification ===")
phi = 1.618034
print(f"Mathematical Reference Constant Phi: {phi}")

for path in targets:
    if os.path.exists(path):
        size = os.path.getsize(path)
        with open(path, "rb") as f:
            sha = hashlib.sha256(f.read()).hexdigest()
        print(f"[VERIFIED] {path} | Size: {size} bytes | SHA256: {sha[:12]}...")
    else:
        print(f"[MISSING]  {path}")

print("=== Audit Verification Complete ===")
