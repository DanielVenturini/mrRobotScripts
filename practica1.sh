sudo -i
adduser
# Adicionar usuario para permitir acesso em rede via ssh
sudo nano /etc/ssh/sshd_config		# arquivo
AllowUsers venturini				# adicionar ou editar linha
sudo systemctl restart sshd 		# reiniciando ssh
sudo apt-get install openssh-server	# se não tiver o ssh-server

# No arquivo passwd, cada entrada consistem em sete campos, separados por dois pontos
# O segundo campo ,'x', guarda a informação utilizada para validar a senha de um usuário;
# Colocar neste campo um asterisco '*'' ou '!x' é a maneira típica de desabilitar uma conta para evitar que seja utilizada.

# O sexto campo é o caminho para o diretório home do usuário.
# O sétimo campo é o programa de shell que será iniciado toda vez que o usuário logar no sistema.
vi /etc/passwd +/bol


# mudar valores para bolsonaro:x10004 para x00000

vi /etc/group
sshGroup..., lula 	#adicona usuário

crlt alt f3			# troca para modo texto mas não desliga a interface gráfica

ssh lula@172.16.1.213

vi /etc/group

vi /etc/group +/ssh

exit

passwd -l lula	# dá um lock na senha
passwd -u lula	# dá um unlock na senha

echo "Vai bolsonaro" > /dev/pts/[0|1|2|3|...]	# escreve uma mensagem no stdout remoto

w					# ver quem está conectado na máquina
TTY:
	tty 			# conectado com ambiente gráfico
	pts				# conectado com ambiente texto

# Arquivos mais importantes:
/etc/ssh/sshd_config	# arquivo de configuração do SSH
/etc/passwd				# arquivo de configuração dos usuários
/etc/shadow				# arquivo com as senhas, porém não é tão fácil de alterar