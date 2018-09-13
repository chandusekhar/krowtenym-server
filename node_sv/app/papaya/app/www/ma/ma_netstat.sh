#!/usr/bin/bash

a=`ps -ef | grep ma_netstat | grep -v 'grep' | grep -v $$ | awk '{print $2}'`
if [ "${a}" != "" ]
then
   kill -9 ${a}
   echo "kill - ${a}"
   sleep 5
fi
###echo "ProcessID=${a}"

v_hostname=`hostname`
v_ip=`hostname -i`
v_cur_path="/app/www/ma"
v_log_path="/app/log/ma"

mkdir -p ${v_log_path}
chmod 755 -R "${v_log_path}"
while true
do
  v_date=`date "+%Y%m%d"`
  v_datetime=`date "+%Y-%m-%d %H:%M:%S"`
  v_file_netstat="${v_hostname}_NETSTAT_${v_date}.log"
  echo "${v_datetime}|"`netstat -an | grep ESTABLISHED | awk '{print $5}' | sort | uniq -c | sort -r | awk '{print $2"("$1")"}'` | sed 's/ /|/g' >> "${v_log_path}/${v_file_netstat}"

  chmod 755 -R "${v_log_path}"
  sleep 10
  
  continue
done
