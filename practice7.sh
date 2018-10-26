sudo apt-get install vcc					# instalando o compilador gcc
sudo apt-get install apache2				# instalando o servidor apache
sudo apt-get install make					# instalando o make
sudo apt-get install lynx					# navegador web no terminal
sudo apt-get install libapache2-mod-php		# modulo php do apache

lynx www.ossec.net							# acessando o site para baixar o arquivo ossec-hids-3.1.0.tar.gz
tar vzxf ossec-hids-3.1.0.tar.gz -C /tmp	# extraindo o arquivo no /tmp
cd /tmp/ossec-hids-3.1.0/					# entrando na pasta onde foi descompactado
./install.sh								# instalando
	1 - local
	2 - Enter
	3.1 - n
	3.2 - Enter
	3.3 - Enter
	3.4 - Enter
	3.5 - Enter
	4 - Enter
	5 - Enter

/var/ossec/bin/ossec-control start			# ligando o ossec
ps aux | grep ossec 						# processos do ossec
cd /var/ossec/logs/							# pasta de logs do ossec
less alerts/alerts.logs

alt+f2

iptables -L -n 								# regras do iptables

lynx www.ossec.net
	Downloads
		Web UI

mv ossec-wui-0.9.tar.gz /tmp
tar vzxf ossec-wwi-0.9.tar.gz
mv ossec-wui-00 ossec 						# mudou o nome da pasta para ossec/
mv ossec /var/www/html/						# movendo ossec para a pasta do apache
netstap -a --tcp							# verificar se o apache está rodando
lynx http://localhost/ossec/				# acessando a pasta