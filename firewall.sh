echo "zerando o firewall"
iptables -F
iptables -t nat -F
iptables -t mangle -F

echo "setando politicas"
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

echo "regras de nat"
iptables -t nat -A POSTROUTING -o enp63s0 -j MASQUERADE	# 1
iptables -t nat -A PREROUTING -i enp63s0 -p tcp -dport 80 -j DNAT --to 192.168.56.102:81  # 2

echo "firewall como cliente"
iptables -A OUTPUT -p icmp -j DROP

echo "firewall como servidor"

echo "roteamento"
echo 1 > /proc/sys/net/ipv4/ip_forward 			# ativando o roteamento

#sudo route add default gw 192.168.56.1			# coloca a máquina local como roteador do VM
#echo "nameserver 8.8.8.8" > /etc/resolv.conf	# habilita o dns na VM