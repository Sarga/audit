#!/bin/sh

PATH=/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

LOG=/home/logs/mysql/mysql_la.log
USERNAME=
PASSWORD=
MYSQL_HOST=
while true;
do
echo -n `date +"%F %T  "` >> $LOG
echo -n " " >> $LOG
echo -n "LA: " >> $LOG; echo -n "`uptime | awk '{print $10}'`" >> $LOG
echo -n " " >> $LOG
echo -n  "Threads_running: " >> $LOG; echo -n `mysqladmin -h $MYSQL_HOST -u $USERNAME -p$PASSWORD ext | grep -i threads_runni | awk '{print $4}'` >> $LOG
echo -n  " Threads_connected: " >> $LOG; mysqladmin -h $MYSQL_HOST -u $USERNAME -p$PASSWORD ext | grep -i threads_connect | awk '{print $4}' >> $LOG
echo >> $LOG

ps axwwwU mysql -o pid,pcpu,command | grep "\[mysqld\]" >> $LOG

#ps  -U mysql -u mysql -o pid,pcpu,command  | grep "\[mysqld\]" >> $LOG
echo >> $LOG
#mysqladmin -u $USERNAME -p$PASSWORD -v pr | grep -v "| Sleep " | grep -v -- "-------------------------------------"  | sed  -e 's#               # #g' | sed 's/      / /g' >> $LOG
mysqladmin -h $MYSQL_HOST -u $USERNAME -p$PASSWORD -v pr |  grep -v -- "-------------------------------------"  | sed  -e 's#               # #g' | sed 's/      / /g' >> $LOG
echo >> $LOG
sleep 1
done

