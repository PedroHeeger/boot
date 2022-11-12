# MÓDULO 05 - Introdução ao Git e ao GitHub
## AULA 01 - Introdução ao Git: TEÓRICA
## AULA 02 - Navegação via command line interface e instalação: TEÓRICA
## AULA 03 - Entendendo como Git funciona por baixo dos panos: (3 Aulas)

### Comando para criar uma encriptação SHA1 no Linux
    echo "ola mundo" | openssl sha1

### Comando para criar uma encriptação SHA1 no Git e no Linux
    echo 'conteudo' | git hash-object --stdin
    echo -e 'conteudo' | openssl sha1

### Comando para criar uma encriptação SHA1 no Linux com formato Git.
    echo -e 'blob 9\0conteudo' | openssl sha1

### Criando uma chave SSH no terminal Linux ou Git Bash (Windows)
    ssh-keygen -t ed25519 -c pedroheeger19@gmail.com

### Exibindo as informações da chave pública criada
    cat id_ed25519.pub

### Inicializando o SSH agent
    eval $(ssh-agent -s)

### Entregando a chave privada para o SSH agent
    ssh-add id_ed25519


## AULA 04 - Primeiros comandos com Git: TEÓRICA
## AULA 05 - Ciclo de vida dos arquivos no Git: TEÓRICA