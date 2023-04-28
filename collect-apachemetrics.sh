#!/bin/bash
clear
echo "Script start time: $(date +%T)"
echo "Running collect-apachemetrics.sh on server: $(hostname)"
echo "=======================================================================" 
echo
echo "Count of running Apache processes"
echo "---------------------------------"
echo
ps auxw | grep httpd | grep -v grep | wc -l
echo
echo "Count of concurrent Apache connections"
echo "--------------------------------------"
echo
ss -ant | grep -E ':80|:443' | wc -l
echo
echo "Concurrent connections in detail"
echo "--------------------------------"
echo
ss -ant | grep -E ':80|:443'
echo
echo "List of Apache processes"
echo "------------------------"
ps auxw | grep httpd | grep -v grep
echo
echo "List of Apache connections by IP"
echo "--------------------------------"
echo
ss -ant |grep -E ':80|:443'|grep ESTAB| awk '{print $5}' | cut -d":" -f1 | sort | uniq -c | sort -nr
echo
echo "Apache log files information"
echo "----------------------------"
echo
filename="/etc/httpd/logs/access_log"
size=$(du -b $filename | cut -f1)
echo "access_log file size is $size bytes."
echo
filename="/etc/httpd/logs/error_log"
size=$(du -b $filename | cut -f1)
echo "error_log file size is $size bytes."
echo
filename="/etc/httpd/logs/mod_jk.log"
size=$(du -b $filename | cut -f1)
echo "mod_jk file size is $size bytes."
echo
echo
echo "Script end time: $(date +%T)"
echo



 
