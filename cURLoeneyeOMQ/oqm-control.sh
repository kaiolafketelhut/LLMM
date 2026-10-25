#!/usr/bin/env bash
set -e
while true; do
    clear
    echo "========================================"
    echo "    OQM OPERATOR CONTROL CONSOLE (v1.0)   "
    echo "========================================"
    echo " 1) Run Automated Deployment"
    echo " 2) Check Daemon Status"
    echo " 3) Start Daemon Service"
    echo " 4) Stop Daemon Service"
    echo " 5) Verify Cryptographic Integrity"
    echo " 6) Launch Core Runtime"
    echo " 7) Exit"
    echo "========================================"
    read -p "Select operator action [1-7]: " choice
    case "$choice" in
        1) ./auto-deploy.sh; read -p "Press Enter to continue..." ;;
        2) DAEMON_MODE=0 ./daemon.iqxd; read -p "Press Enter to continue..." ;;
        3) DAEMON_MODE=1 ./daemon.iqxd; read -p "Press Enter to continue..." ;;
        4) DAEMON_MODE=2 ./daemon.iqxd; read -p "Press Enter to continue..." ;;
        5) sha256sum -c SHA256SUMS; read -p "Press Enter to continue..." ;;
        6) [ -f "dist/D16S" ] && exec ./dist/D16S || echo "Binary missing"; read -p "Press Enter..." ;;
        7) exit 0 ;;
        *) echo "Invalid selection"; sleep 1 ;;
    esac
done
