#
# Regular cron jobs for the backup package
#
0 4	* * *	root	[ -x /usr/bin/backup_maintenance ] && /usr/bin/backup_maintenance
