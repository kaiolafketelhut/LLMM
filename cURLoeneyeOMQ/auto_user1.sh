#!/usr/bin/env bash
set -e
[ -f "./css.iqxd" ] && source ./css.iqxd

echo -e "${OQM_PRIMARY}(=^ ◡ ^=) Executing User1 Automated Pipeline...${OQM_RESET}"
echo -e "${OQM_PRIMARY}Initializing Main iQxD Runtime...${OQM_RESET}"

# run the real entrypoint, not cat it
if [ -f "./main.iqxd" ]; then
    chmod +x ./main.iqxd
    exec ./main.iqxd
elif [ -f "./d16s.iqxd" ]; then
    chmod +x ./d16s.iqxd
    exec ./d16s.iqxd
else
    echo -e "${OQM_WARN}No main target found${OQM_RESET}"
    exit 1
fi
