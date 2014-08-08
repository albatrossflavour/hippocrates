# Memory ideas

ps -eo pid,ppid,rss,vsize,pcpu,pmem,cmd -ww --sort=pid



# Network Ports
netstat -tlpn | sort -t: -k2 -n
