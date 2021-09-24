#!/bin/sh

/bin/cp /home/logs/mysql/mysql_la.log /home/logs/mysql/mysql_la.log.`date +%s` && echo -n > /home/logs/mysql/mysql_la.log

