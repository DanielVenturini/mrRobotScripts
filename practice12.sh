iptables -t filter -L 			# verificar as politicas
iptables -t nat -L				# verificar as politicas do nat
# se for trabalhar com a filter, não precisa colocar a tabela
sudo iptables -L				# verificar as politicas do filter
# criando uma regra:
# -A append
# -s source
# -d destino
# -p protocolo
# --sport porta origem
# --dport porta destino
# -j ação DROP - bloqueia
iptables -A FORWARD -s 10.0.0.2 -d 192.168.0.2 -p tcp --sport 50000 --dport 80 -j DROP
# porta de origem não deve ser específica, pois o SO gera uma aleatória
# se for omitido o --sport - ou qualquer campo -, então foi generalizado
iptables -A FORWARD -s 10.0.0.2 -d 192.168.0.2 -p tcp --dport 80 -j DROP

# bloqueando o trafego ssh entre A e D
iptables -A FORWARD -s 10.0.0.3 -d 192.168.0.3 -p tcp --dport 22 -j DROP

# bloqueando o trafego telnet entre as duas redes
# não precisa especificar o ip, pois está bloqueando toda a rede
iptables -A FORWARD -p tcp --dport 23 -j DROP

# apagando as regras
iptables -F

# bloqueando qualquer acesso ao firewall, mas o firewall pode acessar qualquer
iptables -A INPUT -p tcp --dport 80 -j DROP

# adicionando uma exceção de acesso ao firewall
iptables -A INPUT -p tcp --dport 22 ! -s 10.0.0.2 -j DROP

# deletando a regra
iptables -D INPUT -p tcp --dport 22 ! -s 10.0.0.2 -j DROP

# bloquear o ssh exceto para duas máquias
iptables -A INPUT -p tcp --dport 22 -s 10.0.0.2 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -s 192.169.0.2 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP

###########
# PRATICA #
###########
ifconfig enp2s0f1 > /var/www/html/index.html
# bloqueando acesso http
iptables -A INPUT -p tcp --dport 80 -j DROP
lynx 172.16.1.211	# não deve funcionar
iptables -F
lynx 172.16.1.211	# deve funcionar
# bloquear o meu acesso a alguem via ssh
iptables -A OUTPUT -p tcp --dport 22 -j DROP

# mudando a política. Agora a regra padrão é bloquear tudo
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# TAREFA: acessar a internet normal
# saindo e voltando com http
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --sport 80 -j ACCEPT
# saindo e voltanddo com https
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --sport 443 -j ACCEPT
# saindo e voltando com dns
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT

# liberar máquina para http
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT