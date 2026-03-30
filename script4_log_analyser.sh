#!/bin/bash
# =============================================================================
# Script 4: Log File Analyzer
# Author: Sarthak | Roll No: 24BEC10056
# Course: Open Source Software | VIT Bhopal
# Description: Reads a log file line by line, counts occurrences of a keyword,
#              prints the last 5 matching lines, and retries if the file is empty.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================================

# --- Accept arguments from command line ---
LOGFILE=$1                     # First argument: path to log file
KEYWORD=${2:-"error"}          # Second argument: keyword to search (default: error)

COUNT=0                        # Counter for matching lines
MAX_RETRIES=3                  # Max number of retry attempts if file is empty
ATTEMPT=1                      # Track current attempt number

echo "============================================================"
echo "          Log File Analyzer — Linux Kernel Audit            "
echo "============================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo "  Usage: $0 <logfile> [keyword]"
    echo "  Example: $0 /var/log/syslog kernel"
    exit 1
fi

# --- Check if the file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    echo ""
    echo "  TIP: On Ubuntu/WSL, try these log files:"
    echo "    /var/log/syslog       — general system log"
    echo "    /var/log/kern.log     — kernel-specific messages"
    echo "    /var/log/dmesg        — boot and hardware messages"
    exit 1
fi

# --- do-while style retry loop: retry if file is empty ---
# Bash doesn't have do-while natively; we simulate it with a while loop
while true; do
    echo "  Attempt $ATTEMPT of $MAX_RETRIES: Checking file size..."

    # Check if log file is empty (-s returns true if file has size > 0)
    if [ -s "$LOGFILE" ]; then
        echo "  File has content. Proceeding with analysis."
        echo ""
        break   # Exit retry loop and continue with analysis
    else
        echo "  WARNING: '$LOGFILE' appears to be empty."
        ATTEMPT=$((ATTEMPT + 1))

        # If max retries reached, exit gracefully
        if [ $ATTEMPT -gt $MAX_RETRIES ]; then
            echo "  Max retries reached. Please check the log file."
            exit 1
        fi

        echo "  Retrying in 2 seconds..."
        sleep 2
    fi
done

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""
echo "------------------------------------------------------------"
echo "  Scanning log file line by line..."
echo "------------------------------------------------------------"

# --- while read loop: read the file line by line ---
while IFS= read -r LINE; do

    # --- if-then: check if this line contains the keyword (case-insensitive) ---
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each match
    fi

done < "$LOGFILE"   # Feed file into the while loop via input redirection

# --- Print summary ---
echo ""
echo "  RESULT: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "          $LOGFILE"
echo ""

# --- Print the last 5 matching lines for context ---
echo "------------------------------------------------------------"
echo "  LAST 5 LINES CONTAINING '$KEYWORD':"
echo "------------------------------------------------------------"

# Use grep with -i (case-insensitive) piped to tail to get last 5 matches
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -z "$MATCHES" ]; then
    echo "  No matching lines found."
else
    # Print each match with a leading indicator
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
fi

echo ""
echo "------------------------------------------------------------"
echo "  Linux Kernel logs often contain 'error', 'warning',"
echo "  'kernel', 'usb', 'net' — try different keywords!"
echo "------------------------------------------------------------"
echo ""
echo "============================================================"
echo "  Analysis complete."
echo "============================================================"