#!/bin/bash
# =============================================================================
# Script 5: Open Source Manifesto Generator
# Author: Sarthak | Roll No: 24BEC10056
# Course: Open Source Software | VIT Bhopal
# Description: Interactively asks the user three questions, then generates
#              a personalized open-source philosophy manifesto and saves it
#              to a .txt file.
# =============================================================================

# --- Alias concept demonstration ---
# In a real shell session, you could run: alias today='date +%d\ %B\ %Y'
# Here we demonstrate the concept via a function (aliases don't export to scripts)
get_today() {
    date '+%d %B %Y'   # Returns formatted date like: 26 March 2026
}

# --- Welcome banner ---
echo "============================================================"
echo "     Open Source Manifesto Generator — Linux Kernel Audit   "
echo "============================================================"
echo ""
echo "  Answer three questions honestly."
echo "  Your manifesto will be generated and saved automatically."
echo ""

# --- Interactive input using read ---
# Prompt 1: A tool the user uses daily
read -p "  1. Name one open-source tool you use every day: " TOOL

# Prompt 2: What freedom means to them in one word
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

# Prompt 3: Something they would build and share freely
read -p "  3. Name one thing you would build and share freely: " BUILD

# --- Gather metadata ---
DATE=$(get_today)              # Use our alias-concept function
AUTHOR=$(whoami)               # Get current system username
OUTPUT="manifesto_${AUTHOR}.txt"   # Output filename based on username

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Build the manifesto using string concatenation and echo with >> ---
# First write (>) creates/overwrites the file; subsequent (>>) append to it

echo "============================================================" > "$OUTPUT"
echo "               MY OPEN SOURCE MANIFESTO                    " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "  Author : $AUTHOR"                                          >> "$OUTPUT"
echo "  Date   : $DATE"                                            >> "$OUTPUT"
echo "  Course : Open Source Software | VIT Bhopal"               >> "$OUTPUT"
echo ""                                                             >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"

# --- Compose the manifesto paragraph using the user's three answers ---
# String concatenation happens naturally across echo statements appending to file

echo "  Every day, I rely on $TOOL — a tool that exists because"  >> "$OUTPUT"
echo "  someone chose to build it in the open and give it away."  >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. That single idea is why"   >> "$OUTPUT"
echo "  the Linux Kernel exists: Linus Torvalds believed that"    >> "$OUTPUT"
echo "  software freedom was not a luxury but a right. In 1991,"  >> "$OUTPUT"
echo "  he shared his kernel with the world not for profit, but"  >> "$OUTPUT"
echo "  because he believed others should be able to learn,"      >> "$OUTPUT"
echo "  adapt, and improve upon his work."                        >> "$OUTPUT"
echo ""                                                            >> "$OUTPUT"
echo "  I believe in that same principle. One day, I will build"  >> "$OUTPUT"
echo "  $BUILD — and I will share it freely, the way the Linux"   >> "$OUTPUT"
echo "  Kernel was shared with me. Not because I have to, but"    >> "$OUTPUT"
echo "  because standing on the shoulders of giants means"        >> "$OUTPUT"
echo "  reaching back down for the next person."                  >> "$OUTPUT"
echo ""                                                            >> "$OUTPUT"
echo "  The open-source movement is not about free software."     >> "$OUTPUT"
echo "  It is about free people."                                 >> "$OUTPUT"
echo ""                                                            >> "$OUTPUT"
echo "------------------------------------------------------------" >> "$OUTPUT"
echo "  Signed: $AUTHOR | $DATE"                                  >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm save and display the manifesto ---
echo "------------------------------------------------------------"
echo "  Manifesto saved to: $OUTPUT"
echo "------------------------------------------------------------"
echo ""

# Display the saved file contents
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  Done. Your manifesto is ready for submission."
echo "============================================================"