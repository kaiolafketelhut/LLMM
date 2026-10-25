import os
import time

print("=========================================================")
print("       STANKIN UNIVERSITY - TENURE DOSSIER PACKAGER      ")
print("=========================================================")
print("[*] Reading active uni.ima badge...")

if os.path.exists("uni.ima"):
    with open("uni.ima", "r") as f:
        badge_content = f.read()
    print(badge_content)
else:
    print("[!] Warning: uni.ima badge not found locally.")

print("---------------------------------------------------------")
print("[*] Dossier packaging complete. Ready for submission.")
