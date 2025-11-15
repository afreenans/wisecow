#!/bin/bash


CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
MEM_USAGE=$(free | awk '/Mem/{printf("%.2f%"), $3/$2*100}')
DISK_USAGE=$(df -h / | awk 'NR==2{print $5}')

echo "========== System Health Report =========="
echo "CPU Usage   : $CPU_USAGE"
echo "Memory Usage: $MEM_USAGE"
echo "Disk Usage  : $DISK_USAGE"
echo "=========================================="

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90

CPU_INT=$(echo $CPU_USAGE | tr -d '%')
MEM_INT=$(echo $MEM_USAGE | tr -d '%')
DISK_INT=$(echo $DISK_USAGE | tr -d '%')

if (( ${CPU_INT%.*} > CPU_THRESHOLD )); then
  echo "⚠️  CPU usage high ($CPU_USAGE)" | tee -a /tmp/health_alerts.log
fi
if (( ${MEM_INT%.*} > MEM_THRESHOLD )); then
  echo "⚠️  Memory usage high ($MEM_USAGE)" | tee -a /tmp/health_alerts.log
fi
if (( ${DISK_INT%.*} > DISK_THRESHOLD )); then
  echo "⚠️  Disk usage high ($DISK_USAGE)" | tee -a /tmp/health_alerts.log
fi
