import time
import random
import sys

CAT_MOODS = [
    r"     /\_/\  " + "\n" + r"    ( -.- ) " + "\n" + r"     > ^ <  [Sleeping... Zzz]",
    r"     /\_/\  " + "\n" + r"    ( o.o ) " + "\n" + r"     > ^ <  [Staring intensely at nothing]",
    r"     /\_/\  " + "\n" + r"    ( ^.^ ) " + "\n" + r"     > ^ <  [Purring near the CPU heat sink]",
    r"     /\_/\  " + "\n" + r"    ( >.< ) " + "\n" + r"     > ^ <  [Knocking your terminal window off]",
    r"     /\_/\  " + "\n" + r"    ( ⌐■_■ ) " + "\n" + r"     > ^ <  [Observing isotropic tensor logic]"
]

def run_cat_behavior():
    print("[*] Feline supervisor daemon initialized.")
    try:
        while True:
            mood = random.choice(CAT_MOODS)
            sys.stdout.write("\033[H\033[J")
            print("=== EULER-KIKE FELINE COMPANION ===")
            print(mood)
            print("-" * 35)
            print(f"[*] Entropy: < 7.9 | Phi: 1.618034")
            time.sleep(random.randint(4, 10))
    except KeyboardInterrupt:
        print("\n\n[!] Cat stretched, yawned, and walked away. Goodbye!")

if __name__ == "__main__":
    run_cat_behavior()
