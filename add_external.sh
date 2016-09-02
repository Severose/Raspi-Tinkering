# Add trusted IP to iptables
iptables -I INPUT -p tcp -m tcp -s $1 –dport 22 -j ACCEPT
