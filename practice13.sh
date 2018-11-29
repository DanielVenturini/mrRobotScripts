iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE 	# -t para indicar a tabela

# -snat é somente no POSTROUTING
# -dnat é somente no PREROUTING

route add default gw 192.168.56.1 						# máquia virtual
echo 1 > /proc/sys/net/ipv4/ip_forward					# na máquina real
iptables -t nat -A POSTROUTING -o enp63s0 -j MASQUERADE	#
echo "nameserver 8.8.8.8" > /etc/resolv.conf			# habilita o dns na pl

# NA MÁQUINA REAL
iptables -t nat -A PREROUTING -i enp2s0 -p tcp --dport 80 -j DNAT --to 192.168.56.102	# redirecionar para máquina real


iptables -t nat -A PREROUTING -i enp63s0 -p tcp --dport 81 -j REDIRECT --to-ports 22
iptables -t nat -A PREROUTING -p tcp --dport 81 -i enp63s0 -j DNAT --to 192.168.56.102:22


iptables -A FORWARD -p icmp --icmp-type echo-request ! -i vboxnet0 -j DROP
iptables -A INPUT -p icpm --icmp-type echo-request ! -i vboxnet0 -j DROP

# evitar vários pings
iptable -F -A INPUT -p icmp --icmp-type echo-request -m limit --limit-burst 4 -j ACCEPT
iptable -F -A INPUT -p icmp --icmp-type echo-request -j DROP