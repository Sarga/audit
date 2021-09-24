#!/bin/sh
 
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
LOGS_DIR=/home/logs
SCRIPTS_PATH=/root/monitoring

echo "## Creating dirs ##"
mkdir -p $LOGS_DIR/mysql
echo $LOGS_DIR/mysql" done"


# Debian
echo
echo "## You should add to rc.local ##"
echo 'echo "/usr/local/sbin/daemonize '$SCRIPTS_PATH'/mysql_la.sh" >> /etc/rc.local'

# Debian
echo
echo "## You should add crons ##"
echo '*/15 * * * * '$SCRIPTS_PATH'/rotate_mysql_la.sh >/dev/null 2>/dev/null'
echo '0 0 * * * /usr/bin/find '$LOGS_DIR'/mysql -name "mysql_la.log.*" -mtime +3 -delete >/dev/null 2>/dev/null'

# CentOS 6
#echo
#echo "## You should add to rc.local ##"
#echo 'echo "/usr/sbin/daemonize '$SCRIPTS_PATH'/mysql_la.sh" >> /etc/rc.local'

# CentOS 6
#echo
#echo "## You should add crons ##"
#echo '*/15 * * * * '$SCRIPTS_PATH'/rotate_mysql_la.sh >/dev/null 2>/dev/null'
#echo '0 0 * * * /bin/find '$LOGS_DIR'/mysql -name "mysql_la.log.*" -mtime +3 -delete >/dev/null 2>/dev/null'
