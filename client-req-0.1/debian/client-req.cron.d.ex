#
# Regular cron jobs for the client-req package
#
0 4	* * *	root	[ -x /usr/bin/client-req_maintenance ] && /usr/bin/client-req_maintenance
