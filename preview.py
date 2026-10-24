from pathlib import Path
from PIL import Image

# this preview.py only checks covers are not black and not QR composite
for name in ["og-cover.png", "OMQpreview.png"]:
    p = Path(name)
    if not p.exists():
        print(f"missing {name}")
        continue
    im = Image.open(p)
    print(f"{name}: {p.stat().st_size//1024}K {im.size}")
    # if 55K black, warn
    if p.stat().st_size < 100*1024:
        print(f"WARNING {name} still black 55K, replace with new image")

print("preview.py done - covers should be visible eye, no QR")
