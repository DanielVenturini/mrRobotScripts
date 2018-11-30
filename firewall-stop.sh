echo "zerando o firewall"
iptables -F
iptables -t nat -F
iptables -t mangle -F

echo "setando politicas"
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
