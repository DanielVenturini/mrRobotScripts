LDAP

#todos os processos são filhos do init

ps aux | nl #ver quantidade de processos

init 3 # entrar no modo texto

init 4 #login gráfico

start x # somente ambiente gráfico   

# PROCESSOS DE REDE

netstat -a --tcp

# toda porta em estado de listen é um servidor rodando esperando conexão
# só pode ser invadido via rede em estado de listen

serviço ldaps #autenticar usuário

netstat -a --tcp -np #mais específico number/process

#matar processos de rede

kill processid

# sigla é um - , uma string/palavra são --

nmap 127.0.0.1 #manda um pacote de rede na porta, não tenho certeza se está funcionando
#diferente do netstat que olha os processos na máquina

# outra forma

telnet 127.0.0.1 80

ifconfig > /var/www/html/index.html #enviar ip para o html

vi /etc/apache2/ports.conf #mudar número da porta

#então restart o processo

killall -HUP apache2

lsof #ps com netstat com mais outra coisa, mostra todos os arquivos relacionados com o programa

lsof | grep apache2 #filtrar

lsof | grep apache2 less #leitura

#PRÁTICAS SOBRE ARQUIVOS DE LOG

#Arquivos de logs registram atividades no sistema

cat /var/log/messages #log no sistema

#filtrar

tail -f /var/log/messages

# quando é zipado
zcat messages.2.gz | less

# partições linux -> 1 para o  / ; 2 /tmp; /var; /home; /usr; /opt

