#!/usr/bin/env bash
# ========================================================================
# Script   : autoexec.sh (OMQbiosReader Startup Hook)
# System   : cURLoeneyeOMQ Hybrid Quantum & Structural FEA Framework
# ========================================================================

echo "=== Executing OMQbiosReader Autoexec Routine ==="

if [ -f "./omq_display_bridge.sh" ]; then
    bash ./omq_display_bridge.sh
fi

echo ""
echo "=== Initializing OMQftp REST & GraphQL API Gateway ==="
if [ -f "./omq_api_bridge.js" ]; then
    echo "API Bridge script present: omq_api_bridge.js"
    echo "Routing metadata scaled by Phi (1.618034) through OMQ.FNT (8x16)"
else
    echo "Warning: omq_api_bridge.js not found."
fi

echo "=== Autoexec Sequence Complete ==="

# --- OMQ Font Renderer Startup Hook ---
if [ -f "omq_font_renderer.py" ]; then
    echo "[BOOT] Initializing OMQ.FNT bitmap font matrix renderer..."
    python3 omq_font_renderer.py
else
    echo "[BOOT WARNING] omq_font_renderer.py not found in runtime path."
fi
