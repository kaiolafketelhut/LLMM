#!/usr/bin/env python3
import sys
import subprocess
import random

# Feline supervisor moods
MEOW_MOODS = [
    "(=^‥^=) Purring and forwarding arguments to D16S...",
    "(=^ω^=) Napping while compiling tensors...",
    "(=^ ◡ ^=) Stretching paws across the kernel interface...",
    "(=ΦωΦ=) Staring intently at the execution stream..."
]

def main():
    print(random.choice(MEOW_MOODS))
    
    # Forward all command line arguments to the compiled D16S binary
    cmd = ["./dist/D16S"] + sys.argv[1:]
    
    try:
        result = subprocess.run(cmd)
        sys.exit(result.returncode)
    except FileNotFoundError:
        print("(=`ω´=) Error: ./dist/D16S binary not found! Check your build path.")
        sys.exit(1)

if __name__ == "__main__":
    main()
