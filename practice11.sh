# TERMINAL DA VM
openvpn --genkey --secret static.key	# criando uma chave vpn
cat static.key							# lendo a chave
mv static key /etc/openvpn				# movendo a chave
cp /etc/openvpn/static.key /home/lula	# copiando para o lula, pois este tem permissão de ssh
chown lula /home/lula/static.key		# dando a permissão do arquivo para o lula

# TERMINAL DA MÁQUINA REAL
scp lula@192.168.56.101:home/lula/static.key /etc/openvpn/
# rm /root/.ssh/know_hosts

# TERMINAL DA VM
vi /etc/openvpn/ovpn.conf
	dev tun					# criando uma nova interface
	ifconfig 10.1.1.1 10.1.1.101
	secret /etc/openvpn/static.key

openvpn --config /etc/openvpn/ovpn.conf # start no servidor

# TERMINAL REAL
vi /etc/openvpn/ovpn.conf 
	# client
	remote 192.168.56.101
	dev tun
	ifconfig 10.1.1.101 10.1.1.1
	secret /etc/openvpn/static.key

openvpn --config /etc/openvpn/ovpn.conf # start no client

# NOVO TERMINAL REAL
ifconfig 	# deve aparecer tun0
ping 10.1.1.101