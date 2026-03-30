#!/bin/bash
# =============================================================================
# Script 1: System Identity Report
# Author: Sarthak | Roll No: 24BEC10056
# Course: Open Source Software | VIT Bhopal
# Description: Displays a structured welcome screen with system information
#              and highlights the open-source license of the OS.
# =============================================================================

# --- Variables ---
STUDENT_NAME="Sarthak"
REG_NO="24BEC10056"
SOFTWARE_CHOICE="Linux Kernel"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                          # Kernel release version
DISTRO=$(lsb_release -ds 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
USER_NAME=$(whoami)                         # Current logged-in user
HOME_DIR=$HOME                              # Home directory of current user
UPTIME=$(uptime -p)                         # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y %H:%M:%S')  # Formatted date and time

# --- Display header ---
echo "============================================================"
echo "        OPEN SOURCE AUDIT — System Identity Report         "
echo "============================================================"
echo ""

# --- Student info ---
echo "  Student   : $STUDENT_NAME"
echo "  Reg. No   : $REG_NO"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""

# --- System info ---
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged In As : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $CURRENT_DATE"
echo ""

# --- License message ---
# The Linux Kernel is licensed under GNU GPL v2 (General Public License)
echo "------------------------------------------------------------"
echo "  LICENSE INFORMATION"
echo "------------------------------------------------------------"
echo "  The Linux Kernel is licensed under:"
echo "  GNU General Public License Version 2 (GPL v2)"
echo ""
echo "  This means:"
echo "  [1] You are FREE to run this OS for any purpose."
echo "  [2] You are FREE to study and modify the source code."
echo "  [3] You are FREE to redistribute copies."
echo "  [4] You are FREE to distribute your modified versions."
echo ""
echo "  'Free as in freedom, not free as in free beer.' — RMS"
echo "============================================================"