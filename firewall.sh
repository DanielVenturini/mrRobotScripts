echo "zerando o firewall"
iptables -F
iptables -t nat -F
iptables -t mangle -F

echo "setando politicas"
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

echo "regras de nat"
# 1
iptables -t nat -A POSTROUTING -o enp63s0 -j MASQUERADE
# 2
iptables -t nat -A PREROUTING -i enp63s0 -p tcp --dport 80 -j REDIRECT --to-ports 81
# 8
iptables -A INPUT -p tcp --sport 80 -j ACCEPT
iptables -A INPUT -p tcp --sport 443 -j ACCEPT
iptables -A INPUT -p tcp --sport 22 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A INPUT -p tcp --sport 21 -j ACCEPT
# 4
iptables -P INPUT DROP
# 5
iptables -A FORWARD -p tcp --dport 22 -j DROP
iptables -A FORWARD -p tcp --dport 23 -j DROP
# 6
iptables -A INPUT -p tcp --dport 22 -i vboxnet0 -m mac --mac-source 08:00:27:71:56:86 -j ACCEPT
# 7
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1 -j ACCEPT
# 9
# servidor, quando chegar conexao
iptables -A INPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT
# bloqueando acesso a sub-rede
iptables -A FORWARD -i enp63s0 -p tcp -m state --state NEW,INVALID -j DROP

echo "firewall como cliente"
iptables -A OUTPUT -p icmp -j DROP

echo "firewall como servidor"

echo "roteamento"
echo 1 > /proc/sys/net/ipv4/ip_forward 			# ativando o roteamento

#sudo route add default gw 192.168.56.1			# coloca a máquina local como roteador do VM
#echo "nameserver 8.8.8.8" > /etc/resolv.conf	# habilita o dns na VM