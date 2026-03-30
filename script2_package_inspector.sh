#!/bin/bash
# =============================================================================
# Script 2: FOSS Package Inspector
# Author: Sarthak | Roll No: 24BEC10056
# Course: Open Source Software | VIT Bhopal
# Description: Checks if key Linux Kernel related packages are installed,
#              retrieves version info, and prints a philosophy note using
#              a case statement.
# =============================================================================

# --- List of packages related to the Linux Kernel ecosystem to inspect ---
PACKAGES=("linux-image-$(uname -r)" "gcc" "make" "git" "build-essential")

echo "============================================================"
echo "         FOSS Package Inspector — Linux Kernel Audit        "
echo "============================================================"
echo ""

# --- Loop through each package and inspect it ---
for PACKAGE in "${PACKAGES[@]}"; do

    echo "------------------------------------------------------------"
    echo "  Package : $PACKAGE"
    echo "------------------------------------------------------------"

    # --- Check if package is installed using dpkg (Ubuntu/Debian) ---
    if dpkg -l "$PACKAGE" &>/dev/null 2>&1; then
        echo "  Status  : INSTALLED"

        # Extract version and description using dpkg-query
        VERSION=$(dpkg-query -W -f='${Version}' "$PACKAGE" 2>/dev/null)
        DESCRIPTION=$(dpkg-query -W -f='${Description}' "$PACKAGE" 2>/dev/null | head -1)

        echo "  Version : $VERSION"
        echo "  Summary : $DESCRIPTION"
    else
        echo "  Status  : NOT INSTALLED"
        echo "  Tip     : Install with -> sudo apt install $PACKAGE"
    fi

    # --- Case statement: print a philosophy note per package ---
    # This maps each tool to its open-source significance
    case $PACKAGE in
        linux-image-*)
            echo "  Philosophy: The Linux Kernel — the heart of every open OS."
            echo "              Linus built it in 1991 because Unix was proprietary."
            ;;
        gcc)
            echo "  Philosophy: GCC — GNU Compiler Collection. Without it, Linux"
            echo "              could not be compiled. Freedom needs free tools."
            ;;
        make)
            echo "  Philosophy: make — automates building software. Open source"
            echo "              thrives because building is reproducible and shared."
            ;;
        git)
            echo "  Philosophy: Git — built by Linus after BitKeeper revoked free"
            echo "              access. The community responded by building better."
            ;;
        build-essential)
            echo "  Philosophy: build-essential — a bundle of tools that let anyone"
            echo "              compile and contribute to open-source projects."
            ;;
        *)
            echo "  Philosophy: Every open-source tool is a gift from its author"
            echo "              to every developer who comes after."
            ;;
    esac

    echo ""
done

echo "============================================================"
echo "  Inspection complete. All tools above power the Linux"
echo "  Kernel development ecosystem."
echo "============================================================"