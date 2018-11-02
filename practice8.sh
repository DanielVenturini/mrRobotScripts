# configurando nova interface
ifconfig -a 							# mostrar interfaces ocultas
vi /etc/network/interfaces
	# host-only
	auto enp0s9
	iface enp0s9 inet dhcp

/etc/init.d/networking restart
ifconfig

# abrir navegador e testar com o IP: 192.168.56.101/ossec

# na máquina real
ssh lula@192.168.56.101
su - bolsonaro
ps ax | grep apache -u
# adicionando o apache no grupo do ossec
vi /etc/group +/ossec
	ossec:x:999:www-data

/etc/init.d/apache2 restart

# voltar no navegador e tentar novamente

cd /var/www/html/ossec/
./setup.sh 											# para bloquear o acesso a pagina do ossec