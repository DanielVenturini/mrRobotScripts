# Aula sobre processos suspeitos

ps #ver os processos, um terminais

#pts/0 é o terminal virtual

ps a #ps extendido, mostra de todos os terminais

ps ax #mostra todos os processos ? apache

#cron é um agendador de tarefas nos sistemas unix
#todos os processos são filhos do init

ps aux # todos os processos USER	

gedit &

kill idprocess

ps aux | grep lula #filtrar por usuário

kill -s # - pid do cara

#ver se o hacker não alterou o comando kill

#solução: fazer o seu próprio comando kill, um programa em c

man 2 kill

kill(pid, signal); #atoi((argv[1], #atoi(argv[2]))

killall bash #mata um processo pelo nome

man 7 signal # lista de sinais disponíveis

netstat -a --tcp -np

killall -HUP apache2 #matando todos pelo sinal

#hirarquia do processo

pstree

#se o hacker substitui o ps e todos os comandos além do kill

ls /proc #pasta sobre estados da máquina

# substituir o ps

cat /proc/*/stat | awk '{print $1, $2}'

