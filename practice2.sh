su - #root

sudo #user local

passwd -l lula # travar senha

passwd -u lula # destravar

# arquivo de senha

ls /usr/bin/passwd -l

# mesma coisa que passwd -l só que no modo texto

vi /etc/passwd +/lula


#senha não é mais do x é no arquivo shadow
#lula x:1004:1006,,,bin  user-senha-id-grupo-comentários/bin/bash primeiro comando executado

insert
!x # colocar exclamação pra negar a senha

esc esc : wq enter # sair
!q #sair sem alterar

# arquivo shadow

ls -l /etc/passwd

-arquivo
d-diretorio
l-link

-rw #permissoes do dono 
r-- #permissoes do grupo
r-- #permissoes dos outros
r #leitura
w #escrita
x #execução

vi /etc/shadow

#os primeiros números indicam o salt $6$9  hash para esconder a senha

!$6$9 #travar no shadow

#outro método

vi /etc/passwd +/lula

# trocar o bash por
usr/bin/htop

su - lula



vi /bin/caifora

# todos os logados na máquina

last

# explicação

pts é um terminal virtual

last root

last suporte

last log

# usuarios que nunca logaram, exemplo:mysql. Questão de segurança.








