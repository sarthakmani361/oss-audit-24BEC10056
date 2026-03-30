#!/bin/bash
# =============================================================================
# Script 3: Disk and Permission Auditor
# Author: Sarthak | Roll No: 24BEC10056
# Course: Open Source Software | VIT Bhopal
# Description: Loops through key Linux system directories, reports disk usage
#              and permissions. Also specifically checks the Linux Kernel's
#              config and module directories.
# =============================================================================

# --- Standard system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/boot" "/lib/modules")

echo "============================================================"
echo "       Disk and Permission Auditor — Linux Kernel Audit     "
echo "============================================================"
echo ""
echo "  FORMAT: Directory => Permissions | Owner | Group | Size"
echo ""
echo "------------------------------------------------------------"
echo "  STANDARD SYSTEM DIRECTORIES"
echo "------------------------------------------------------------"

# --- for loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permission string, owner, and group using awk on ls output
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get human-readable size; suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        echo "  $DIR"
        echo "    Permissions : $PERMS"
        echo "    Owner       : $OWNER | Group: $GROUP"
        echo "    Size        : $SIZE"
        echo ""
    else
        # Directory does not exist on this system
        echo "  $DIR => NOT FOUND on this system"
        echo ""
    fi
done

# --- Linux Kernel specific config check ---
echo "------------------------------------------------------------"
echo "  LINUX KERNEL — SPECIFIC DIRECTORY AUDIT"
echo "------------------------------------------------------------"

# The running kernel's module directory — unique per kernel version
KERNEL_VERSION=$(uname -r)
KERNEL_MOD_DIR="/lib/modules/$KERNEL_VERSION"

if [ -d "$KERNEL_MOD_DIR" ]; then
    PERMS=$(ls -ld "$KERNEL_MOD_DIR" | awk '{print $1}')
    OWNER=$(ls -ld "$KERNEL_MOD_DIR" | awk '{print $3}')
    SIZE=$(du -sh "$KERNEL_MOD_DIR" 2>/dev/null | cut -f1)

    echo "  Kernel Module Directory : $KERNEL_MOD_DIR"
    echo "    Permissions : $PERMS"
    echo "    Owner       : $OWNER"
    echo "    Size        : $SIZE"
    echo ""
    echo "  NOTE: Only root can modify kernel modules."
    echo "        This is a core Linux security design decision."
else
    echo "  Kernel module directory not found at: $KERNEL_MOD_DIR"
fi

# Check for kernel config file in /boot
KERNEL_CONFIG="/boot/config-$KERNEL_VERSION"
echo ""
if [ -f "$KERNEL_CONFIG" ]; then
    PERMS=$(ls -l "$KERNEL_CONFIG" | awk '{print $1}')
    SIZE=$(du -sh "$KERNEL_CONFIG" 2>/dev/null | cut -f1)
    echo "  Kernel Config File : $KERNEL_CONFIG"
    echo "    Permissions : $PERMS"
    echo "    Size        : $SIZE"
    echo "    This file records every compile-time option for your kernel."
else
    echo "  Kernel config file not found at: $KERNEL_CONFIG"
fi

echo ""
echo "============================================================"
echo "  Audit complete."
echo "============================================================"