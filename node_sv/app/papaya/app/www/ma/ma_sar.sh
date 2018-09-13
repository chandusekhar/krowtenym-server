#!/usr/bin/bash

listProcess=`ps -ef | grep sar | grep -v 'grep' | grep -v $$ | awk '{print $2}'`
listProcess=`echo ${listProcess}`
if [ "${listProcess}" != "" ]
then
   kill -9 `echo ${listProcess}`
   echo "kill -9 ${listProcess}"
fi

v_hostname=`hostname`
v_ip=`hostname -i`
v_cur_path="/app/www/ma"
v_log_path="/app/log/ma"

mkdir -p ${v_log_path}
chmod 755 -R "${v_log_path}"

touch "${v_log_path}/${v_file_cpu}"
touch "${v_log_path}/${v_file_mem}"
chmod 755 -R "${v_log_path}"

v_date=`date "+%Y%m%d"`
v_file_cpu="${v_hostname}_CPU_${v_date}.log"
v_file_mem="${v_hostname}_MEM_${v_date}.log"
sar -e '23:59:59' $1 100000 >> "${v_log_path}/${v_file_cpu}" &
sar -e '23:59:59' -r $1 100000 >> "${v_log_path}/${v_file_mem}" &

#while true
#do
#  v_date=`date "+%Y%m%d"`
#  v_file_cpu="${v_hostname}_CPU_${v_date}.log"
#  v_file_mem="${v_hostname}_MEM_${v_date}.log"
#  sar -e '23:59:59' 10 100000 >> "${v_log_path}/${v_file_cpu}" &
#  sar -e '23:59:59' -r 10 100000 >> "${v_log_path}/${v_file_mem}"
#
#  chmod 755 -R "${v_log_path}"
#  sleep 2
#  continue
#done

