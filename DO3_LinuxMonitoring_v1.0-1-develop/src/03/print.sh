#!/bin/bash
cd "$(dirname $0)" 


echo `./color.sh $1 $2` HOSTNAME = `./color.sh $3 $4``hostname``./color.sh 0 0`
echo `./color.sh $1 $2` TIMEZONE = `./color.sh $3 $4``cat /etc/timezone`  `./color.sh 0 0` 
echo `./color.sh $1 $2` USER = `./color.sh $3 $4``whoami``./color.sh 0 0`
echo `./color.sh $1 $2` OS = `./color.sh $3 $4``cat /etc/issue | head -n 1 | awk '{print $1, $2}'``./color.sh 0 0`
echo `./color.sh $1 $2` DATE = `./color.sh $3 $4``date +'%d %b %Y %H:%M:%S'``./color.sh 0 0`
echo `./color.sh $1 $2` UPTIME = `./color.sh $3 $4``uptime -p ``./color.sh 0 0`
echo `./color.sh $1 $2` UPTIME_SEC = `./color.sh $3 $4``cat /proc/uptime | awk '{print $1 }'` sec `./color.sh 0 0`
echo `./color.sh $1 $2` IP = `./color.sh $3 $4``hostname -I | awk '{print $1}'` `./color.sh 0 0`
echo `./color.sh $1 $2` MASK = `./color.sh $3 $4` ` netstat -rn | tail -n 1 |awk '{print $3}'``./color.sh 0 0`
echo `./color.sh $1 $2` GATEWAY = `./color.sh $3 $4``ip route | head -n 1| awk '{print $3}'``./color.sh 0 0`
echo `./color.sh $1 $2` RAM_TOTAL = `./color.sh $3 $4``free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$2/1024/1024}'``./color.sh 0 0`
echo `./color.sh $1 $2` RAM_USED = `./color.sh $3 $4``free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$3/1024/1024}'``./color.sh 0 0`
echo `./color.sh $1 $2` RAM_FREE = `./color.sh $3 $4``free | head -n 2 | tail -n 1 | awk '{printf "%.3f Gb" ,$4/1024/1024}'``./color.sh 0 0`
echo `./color.sh $1 $2` SPACE_ROOT = `./color.sh $3 $4`` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $2/1024}' ``./color.sh 0 0`
echo `./color.sh $1 $2` SPACE_ROOT_USED = `./color.sh $3 $4`` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $3/1024}' ``./color.sh 0 0`
echo `./color.sh $1 $2` SPACE_ROOT_FREE = `./color.sh $3 $4`` df / -k | tail -n 1 | awk '{printf "%.2f Mb", $4/1024}' ``./color.sh 0 0`
./color.sh 0 0
