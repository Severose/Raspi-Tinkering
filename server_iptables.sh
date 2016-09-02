#https://sysadminblogger.wordpress.com/2014/06/17/a-rather-secure-raspberry-pi-puppy-cam/

# Just because
iptables -A INPUT -j ACCEPT -m state –state ESTABLISHED,RELATED

# Open up port 80 for nginx web server
iptables -A INPUT -p tcp –dport 80 -m state –state NEW -j ACCEPT

# Open up port 8080 for motion’s own web server
iptables -A INPUT -p tcp –dport 8080 -m state –state NEW -j ACCEPT

# Open up for ping
iptables -A INPUT -p icmp -m icmp –icmp-type 8 -j ACCEPT

# SSH Internal Logins
iptables -I INPUT -p tcp -m iprange –src-range 192.168.0.100-254 –dport 22 -j ACCEPT

# Deny all other SSH login attempts
iptables -I INPUT -p tcp -m tcp -s 0.0.0.0/0 –dport 22 -j DROP

# Deny all access not explicitly allowed by a rule
iptables -P INPUT DROP
