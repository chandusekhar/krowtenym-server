#!/usr/bin/bash

a=`ps -ef | grep ma_alert | grep -v 'grep' | grep -v $$ | awk '{print $2}'`
if [ "${a}" != "" ]
then
   kill -9 ${a}
   echo "kill - ${a}"
fi
###echo "ProcessID=${a}"

v_hostname=`hostname`
v_ip=`hostname -i`
v_cur_path="/app/www/ma"
v_log_path="/app/log/ma"

mkdir -p ${v_log_path}

while true
do
  v_date=`date "+%Y%m%d"`
  v_file_cpu="${v_hostname}_CPU_${v_date}.log"
  v_file_mem="${v_hostname}_MEM_${v_date}.log"

  v_alert_cpu="${v_hostname}_CPU_${v_date}.alert"
  v_alert_mem="${v_hostname}_MEM_${v_date}.alert"

  cat "${v_log_path}/${v_file_cpu}" | awk '{if ($9 ~ /[0-9]+$/ && $9 <= 60) {print $0}}' > "${v_log_path}/${v_alert_cpu}" 2>&1
  cat "${v_log_path}/${v_file_mem}" | awk '{if ($5 ~ /[0-9]+$/ && $5 > 40) {print $0}}' > "${v_log_path}/${v_alert_mem}" 2>&1

  chmod 755 -R "${v_log_path}"
  sleep 2
   
  continue
done
