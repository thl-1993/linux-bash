#!/bin/bash

echo HOSTNAME = `hostname`
echo TIMEZONE = `cat /etc/timezone`
echo USER = `whoami`
echo OS = `cat /etc/issue `
echo DATE = `date +"%d %b %Y %H:%M:%S"`
echo UPTIME = `uptime -p`
echo UPTIME_SEC = `cat /proc/uptime | awk '{print $1 }'`
echo IP = `hostname -I | awk '{print $1}'`
echo MASK =  $(netstat -rn) | awk '{print $1,$2,$25}'
echo GATEWAY = `ip route | head -n 1| awk '{print $3}'`
echo RAM_TOTAL = `free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$2/1024/1024}'`
echo RAM_USED = `free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$3/1024/1024}'`
echo RAM_FREE = `free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$4/1024/1024}'`
echo SPACE_ROOT = ` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $2/1024}' `
echo SPACE_ROOT_USED = ` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $3/1024}' `
echo SPACE_ROOT_FREE = ` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $4/1024}' `

