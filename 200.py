#!/usr/bin/env python3
import urllib.request, pathlib
BASE=pathlib.Path(".")
URLS={
 "v86/bios/seabios.bin":"https://raw.githubusercontent.com/copy/v86/master/bios/seabios.bin",
 "v86/bios/vgabios.bin":"https://raw.githubusercontent.com/copy/v86/master/bios/vgabios.bin",
 "v86/build/libv86.js":"https://copy.sh/v86/build/libv86.js",
 "v86/build/v86.wasm":"https://copy.sh/v86/build/v86.wasm",
 "v86/images/200.img":"https://copy.sh/v86/images/linux.iso",
}
def fetch(dst,url):
    p=BASE/dst
    p.parent.mkdir(parents=True,exist_ok=True)
    if p.exists() and p.stat().st_size>1024:
        print(f"skip {dst} {p.stat().st_size}")
        return
    print(f"fetch {dst}")
    urllib.request.urlretrieve(url,str(p))
    print(f" ok {p.stat().st_size}")

for d,u in URLS.items():
    try: fetch(d,u)
    except Exception as e: print(f"FAIL {d} {e}")

# make compat copy for your 200.js
import shutil,os
if (BASE/"v86/build/libv86.js").exists():
    shutil.copy("v86/build/libv86.js","v86/libv86.js")
    print("copied to v86/libv86.js")
