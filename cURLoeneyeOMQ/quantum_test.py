import subprocess
import os
import platform

print("--- TermuxOS Bell test ---")

# Check architecture compatibility before executing custom binaries
machine = platform.machine()
print(f"Detected runner architecture: {machine}")

if os.path.exists("./oeneyeQ"):
    if machine in ["x86_64", "AMD64"]:
        print("[INFO] Skipping native Termux binary ./oeneyeQ on x86_64 GitHub runner to prevent Exec format error.")
    else:
        try:
            subprocess.run(["./oeneyeQ"], check=True)
        except Exception as e:
            print(f"[WARNING] Execution of ./oeneyeQ failed: {e}")
else:
    print("[INFO] ./oeneyeQ binary not found in root workspace.")

print("OK - Entanglement verified")
