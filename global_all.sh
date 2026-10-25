#!/usr/bin/env bash
set -e
TS=$(date -u removed-phone
EPOCH=$(date removed-phone
mkdir -p articles images

echo "[$TS] GLOBAL RESTORE by Julia_Menge_eigenOENEYE"

# === 001 Main ===
cat > articles/Julia_Menge_eigenOENEYE_001_Main.md <<'MD'
# Topological Filtration and Coordinate Mapping via 𝔄-Void and xTitin - Julia_Menge_eigenOENEYE
Abstract: finite genetic base → infinite asymptotic 3D via xTitin
∅ ⊂ ℱ0 ⊂ ℱ1 ⊂ ℱ2 ⊂ ... ⊂ ℱ∞
xTitin_(nremoved-phone
MD

# === 002 Formal ===
cat > articles/Julia_Menge_eigenOENEYE_002_Formal_Filtration.md <<'MD'
# Formal Filtration Model
Define nested sequence: ∅ ⊂ ℱ0 ⊂ ℱ1 ⊂ ... ⊂ ℱ∞
xTitin acts as indexing operator: xTitin(nremoved-phone
RD_TILE_PX=32, TRIT_SIZE=16, MOSFET trit [-1,0,1]
MD

# === 003 Finite vs Infinite ===
cat > articles/Julia_Menge_eigenOENEYE_003_Finite_vs_Infinite.md <<'MD'
# Finite vs Infinite Limits
Finite Domain: discrete AA backbone, countable Ig domains
Infinite Limit: n→∞ manifold, continuous asymptotic boundary
CAM projection removed-phone
MD

# === 004 Operator ===
cat > articles/Julia_Menge_eigenOENEYE_004_Operator_A-Void.md <<'MD'
# Ŵ removed-phone
TRIT operator MOSFET [-1,0,1] finite<8 green, infinite>80 purple hsl(270removed-phone
xTitin CANVAS filtration viz, RD_TILE 32px
MD

# === 005 Deploy IMCs ===
cat > articles/Julia_Menge_eigenOENEYE_005_Deploy_IMCs.md <<MD
# Deploy IMCs / Images Proof - Julia_Menge_eigenOENEYE
Run 37745973673 success build 15s ID 113207434707
Run 37746282151 success build 14s ID 113208428661
Run 37747069024 success build 16s ID 113210965732
Timestamp: $TS
Images: /images/ deploy screenshots persistent
MD

# === 006 xTitin Timestamp (from previous) ===
cat > articles/Julia_Menge_eigenOENEYE_006_xTitin_Timestamp_${EPOCH}.md <<MD
# xTitin(t) Timestamped Filtration - Julia_Menge_eigenOENEYE
Timestamp: $TS
Epoch: $EPOCH
xTitin_(nremoved-phone
∅ ⊂ ℱ0(t) ⊂ ℱ1(t) ⊂ ... ⊂ ℱ∞(t)
Live: candiOQM_xTitin.html?t=$EPOCH / candiOQM_clock.html?t=$EPOCH
MD

# === 007 xTitin append (matches your last push) ===
cat > articles/Julia_Menge_eigenOENEYE_007_xTitin_1791446495.md <<MD
# xTitin(t) auto-append by Julia_Menge_eigenOENEYE
Timestamp: 2026-10-08T08:01:35Z
Epoch: 1791446495
xTitin_(nremoved-phone
∅ ⊂ ℱ0(t) ⊂ ... ⊂ ℱ∞(t)
Deployed: 2026-10-08T08:01:35Z via autoexec_append
MD

# === ENGINE !engine 4716b with auto-timestamp ===
cat > candiOQM_xTitin.html <<HTML
<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>CANDI OQM xTitin ∅⊂ℱ∞ $TS - Julia_Menge_eigenOENEYE</title>
<style>body{margin:0;background:#000;color:#0f0;font-family:monospace} #meta{position:fixed;top:8px;left:8px;background:#111;border:1px solid #0f0;padding:6px;font-size:11px;z-index:9} canvas{display:block}</style>
</head><body>
<div id="meta">xTitin(t)=Ŵ(xTitin_n)removed-phone
<canvas id="xTitin_CANVAS"></canvas>
<script>const TS="$TS",EPOCH=$EPOCH;let n=0;const c=document.getElementById('xTitin_CANVAS');c.width=innerWidth;c.height=innerHeight;const ctx=c.getContext('2d');function draw(){ctx.fillStyle='#000';ctx.fillRect(0,0,c.width,c.height);const t=new Date().toISOString();ctx.fillStyle='#0f0';ctx.font='12px monospace';ctx.fillText(\`∅⊂ℱ\${n}(t=\${t}) deployed=\${TS} trit=\${[-1,0,1][n%3]}\`,12,c.height-12);ctx.strokeStyle=n<8?'#0f0':\`hsl(\${270removed-phone
</body></html>
HTML

# === CLOCK with timestamp ===
cat > candiOQM_clock.html <<HTML
<!doctype html><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>xTitin CLOCK $TS</title><style>body{margin:0;background:#000;color:#0f0;font-family:monospace;display:flex;align-items:center;justify-content:center;height:100vh;flex-direction:column}canvas{border:1px solid #0f0;border-radius:50%}#info{font-size:11px;margin-top:8px;text-align:center}</style><canvas id="c" width="320" height="320"></canvas><div id="s"></div><div id="info">deployed $TS<br>epoch $EPOCH<br>∅⊂ℱn(t) clock<br>by Julia_Menge_eigenOENEYE<br><a href="candiOQM_xTitin.html?t=$EPOCH" style="color:#0ff">!engine</a> | <a href="index.html" style="color:#0f0">index</a></div><script>const TS="$TS";let n=0;const C=document.getElementById('c'),X=C.getContext('2d');function D(){X.clearRect(0,0,320,320);const a=n/100*6.283-Math.PI/2;X.strokeStyle='#222';for(let i=0;i<12;iremoved-phone
HTML

# === PERSISTENT BUILDER - never deletes articles/images ===
cat > static_own_index.sh <<'SH2'
#!/usr/bin/env bash
set -e
TS=$(date -u removed-phone
EPOCH=$(date removed-phone
mkdir -p articles images
cat > index.html <<HTML2
<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>CANDI OQM xTitin $TS</title></head><body style="font-family:monospace;background:#000;color:#0f0;padding:20px">
<h1>CANDI OQM ∅⊂ℱ∞ xTitin by Julia_Menge_eigenOENEYE</h1>
<p style="color:#ff0">Last deploy: $TS | epoch $EPOCH | xTitin(t) = Ŵ(xTitin_n(t))removed-phone
<p><a href="candiOQM_xTitin.html?ts=$EPOCH" style="color:#0ff">→ !engine 4716b t=$TS</a> | <a href="candiOQM_clock.html?ts=$EPOCH" style="color:#ff0">→ CLOCK t=$TS</a></p>
<h3>Articles persistent [GLOBAL ALL CODES $TS]:</h3><ul>
<li>001 Main ∅⊂ℱ∞ - Topological Filtration</li>
<li>002 Formal xTitin=Ŵremoved-phone
<li>003 Finite vs Infinite</li>
<li>004 Operator Ŵremoved-phone
<li>005 Deploy IMCs proof 37745973673/37746282151/37747069024</li>
<li>006 xTitin_Timestamp_${EPOCH}</li>
<li>007 xTitin_1791446495</li>
</ul>
<p>Articles on disk:</p><pre>$(ls -1 articles/ | sed 's/^/ - /')</pre>
<p>Images: <a href="images/">/images/</a> - $(ls images/ 2>/dev/null | wc -l) files</p>
<p style="font-size:11px">$TS | persistent build | never deletes</p></body></html>
HTML2
echo "PERSISTENT BUILD $TS epoch $EPOCH - $(ls articles/ | wc -l) articles kept"
SH2
chmod removed-phone

# === AUTOEXEC APPEND - just adds ===
cat > autoexec_append.sh <<'SH3'
#!/usr/bin/env bash
set -e
TS=$(date -u removed-phone
EPOCH=$(date removed-phone
mkdir -p articles
FILE="articles/Julia_Menge_eigenOENEYE_$(printf "%03d" $(ls articles/ | wc -l | tr -d ' '))_xTitin_${EPOCH}.md"
cat > "$FILE" <<MD3
# xTitin(t) auto-append by Julia_Menge_eigenOENEYE
Timestamp: $TS
Epoch: $EPOCH
xTitin_(nremoved-phone
∅ ⊂ ℱ0(t) ⊂ ... ⊂ ℱ∞(t)
TRIT = $((EPOCH % 3 - 1))
MD3
echo "APPENDED $FILE at $TS"
./static_own_index.sh
SH3
chmod removed-phone

./static_own_index.sh
echo "GLOBAL READY: $(ls articles/ | wc -l) articles, $(wc -c < candiOQM_xTitin.html) bytes engine, $(wc -c < candiOQM_clock.html) bytes clock"
ls -lh articles/
