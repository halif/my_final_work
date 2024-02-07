#
# Regular cron jobs for the openvpn package
#
0 4	* * *	root	[ -x /usr/bin/openvpn_maintenance ] && /usr/bin/openvpn_maintenance
