# OSS Audit — Linux Kernel
### Open Source Software | VIT Bhopal NGMC Course
**Student:** Sarthak  
**Registration Number:** 24BEC10056  
**Chosen Software:** Linux Kernel (GPL v2)

---

## About This Project

This repository contains five shell scripts written as part of the **Open Source Audit** capstone project for the Open Source Software course on VITyarthi. The audited software is the **Linux Kernel** — the foundation of every Linux-based operating system, licensed under GNU GPL v2.

---

## Scripts Overview

| Script | File | Description |
|--------|------|-------------|
| 1 | `script1_system_identity.sh` | Displays a system welcome screen with kernel version, user, uptime, and license info |
| 2 | `script2_package_inspector.sh` | Checks if Linux Kernel ecosystem packages are installed and prints philosophy notes |
| 3 | `script3_disk_permission_auditor.sh` | Audits disk usage and permissions of key system directories including kernel-specific paths |
| 4 | `script4_log_analyzer.sh` | Reads a log file line by line, counts keyword matches, and prints last 5 matching lines |
| 5 | `script5_manifesto_generator.sh` | Interactively generates a personalized open-source manifesto and saves it to a `.txt` file |

---

## Dependencies

- **OS:** Ubuntu 20.04+ or any Debian-based Linux (tested on Ubuntu via WSL2)
- **Shell:** Bash (version 4+)
- **Tools required:** `bash`, `dpkg`, `lsb_release`, `uname`, `du`, `ls`, `grep`, `awk`, `date`, `cut`
- All tools above come pre-installed on Ubuntu. No additional installation needed.

---

## Setup Instructions

### Option A — WSL2 on Windows (Recommended if no Linux machine)

1. Open **PowerShell as Administrator** and run:
   ```powershell
   wsl --install
   ```
2. Restart your computer when prompted.
3. Open **Ubuntu** from the Start Menu and set up your username and password.
4. Proceed to the steps below inside the Ubuntu terminal.

### Option B — Native Linux or VM

Just open a terminal and proceed directly.

---

## How to Run the Scripts

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/oss-audit-24BEC10056.git
cd oss-audit-24BEC10056
```

### 2. Make all scripts executable
```bash
chmod +x *.sh
```

### 3. Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```
> If some packages are not installed, run: `sudo apt update && sudo apt install gcc make git build-essential`

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```
> Some directories like `/var/log` may show permission errors for size — this is normal and expected.

**Script 4 — Log File Analyzer**
```bash
./script4_log_analyzer.sh /var/log/syslog error
```
> Replace `/var/log/syslog` with any log file path. Replace `error` with any keyword (e.g., `kernel`, `warning`, `usb`).  
> On WSL, try: `./script4_log_analyzer.sh /var/log/dmesg kernel`

**Script 5 — Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```
> Follow the interactive prompts. Your manifesto will be saved as `manifesto_<yourusername>.txt` in the current directory.

---

## Notes for Evaluators

- All scripts include inline comments explaining each section and concept used.
- Scripts use: variables, command substitution `$()`, `for` loops, `while read` loops, `if-then-else`, `case` statements, input redirection, file writing with `>` and `>>`, and `read` for interactive input.
- Scripts have been tested on Ubuntu 22.04 (WSL2 on Windows 11).
- The chosen software (Linux Kernel) is licensed under **GNU GPL v2**.
