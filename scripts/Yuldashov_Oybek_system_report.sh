#!/bin/bash
# System report for Oybek Yuldashov (IT2-23)
LOG="$(dirname "$0")/../logs/Yuldashov_Oybek_system_report.log"

{
  echo "===== SYSTEM REPORT ====="
  echo "Student: Oybek Yuldashov (IT2-23)"
  echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "User: $(whoami)"
  echo "OS: $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
  echo "Kernel: $(uname -r)"
  echo "CPU: $(lscpu | grep 'Model name' | sed 's/Model name: *//') ($(nproc) cores)"
  echo "--- Memory ---"
  free -h
  echo "--- Disk usage ---"
  df -h
  echo "--- Available space on / ---"
  df -h / | awk 'NR==2 {print $4 " available"}'
  echo
} | tee -a "$LOG"
