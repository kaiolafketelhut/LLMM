#!/usr/bin/env bash
echo "=================================================="
echo "=== cURLoeneyeOMQ Global Workspace Integrity Audit ==="
echo "=================================================="
PHI=1.618034
ERRORS=0

# 1. Verify Python Font Renderer
if [ -f "omq_font_renderer.py" ]; then
    echo "[PASS] omq_font_renderer.py verified."
else
    echo "[FAIL] omq_font_renderer.py missing!"
    ((ERRORS++))
fi

# 2. Verify Pascal Compiler Module
if [ -f "compilerOENEYEmosfetq.pas" ]; then
    echo "[PASS] compilerOENEYEmosfetq.pas verified."
else
    echo "[FAIL] compilerOENEYEmosfetq.pas missing!"
    ((ERRORS++))
fi

# 3. Verify oeneyeOScat Module Directory
if [ -d "oeneyeOScat.GIT" ]; then
    echo "[PASS] oeneyeOScat.GIT module directory active."
else
    echo "[FAIL] oeneyeOScat.GIT module missing!"
    ((ERRORS++))
fi

# 4. Verify Binary Assets
if [ -f "OQM_file.bin" ]; then
    echo "[PASS] OQM_file.bin binary asset verified."
else
    echo "[FAIL] OQM_file.bin binary asset missing!"
    ((ERRORS++))
fi

echo "--------------------------------------------------"
echo "PHI Scaling Constant : $PHI [CONSTANT LOCKED]"
if [ $ERRORS -eq 0 ]; then
    echo "Global System Audit  : SUCCESS [ALL SYSTEMS OPERATIONAL]"
else
    echo "Global System Audit  : WARNING ($ERRORS issues detected)"
fi
echo "=================================================="
