# Formação Cybersec - Labs Módulo 2   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">vnw   <img src="https://github.com/PedroHeeger/my_tech_journey/blob/main/platforms/img/vnw.jpeg" alt="vnw" width="auto" height="25"></a>
### Software/Subject: <a href="../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_035 (Formação Cybersec)   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="25"></a>
### Module: 2. Defesa & Monitoramento (Blue Team)

#### <a href="./README.md">Teoria</a>

---

Esta pasta refere-se aos laboratórios do módulo 2 **Defesa & Monitoramento (Blue Team)** do bootcamp [**Formação Cybersec**](../).

### Theme:
- Cybersecurity

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution:
  - Ubuntu   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg" alt="ubuntu" width="auto" height="25">
- Cloud:
  - AWS   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Containerization: 
  - Docker   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="docker" width="auto" height="25">
  - Docker Compose   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/docker_compose.png" alt="docker_compose" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Command Line Interpreter (CLI):
  - AWS Command Line Interface (CLI)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_cli.svg" alt="aws_cli" width="auto" height="25">
  - Bash e Sh   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="bash_sh" width="auto" height="25">
- Tools:
  - Curl   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/curl.png" alt="curl" width="auto" height="25">
- Network:
  - Arp-scan   <img src="" alt="arp-scan" width="auto" height="25">
  - Domain Information Groper (Dig)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/dig.jpeg" alt="dig" width="auto" height="25">
  - Iproute   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/iproute.png" alt="iproute" width="auto" height="25">
  - Iputils-ping; Iputils   <img src="" alt="iputils" width="auto" height="25">
  - Netdiscover   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/netdiscover.png" alt="netdiscover" width="auto" height="25">
  - Net-tools   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/net-tools.svg" alt="net-tools" width="auto" height="25">
  - Nmap   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/nmap.png" alt="nmap" width="auto" height="25">
  - Ping   <img src="" alt="iputils" width="auto" height="25">
  - Rustscan   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/rustscan.png" alt="rustscan" width="auto" height="25">
- Offensive Security:
  - Kali Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/kali_linux.png" alt="kali_linux" width="auto" height="25">

---

### Bootcamp Module 2 Structure
1. <a name="item1">Módulo 2: Defesa & Monitoramento (Blue Team)<br>
    1.1. <a href="#item1.1">Arquitetura em Camadas</a><br>
    1.2. <a href="#item1.2">Hardening</a><br>
    1.3. <a href="#item1.3">Firewall</a><br>
    <!-- 1.4. <a href="#item1.4">Reconhecimento & Footprinting</a><br>
    1.5. <a href="#item1.5">Infraestrutura de Rede - Conceitos e Componentes</a><br>
    1.6. <a href="#item1.6">Ferramentas: Kali Linux, Nmap, Wireshark</a><br>
    1.7. <a href="#item1.7">Endereçamento IP & Subnetting</a><br>
    1.8. <a href="#item1.8">Seu Dojo de Ataque no Kali Linux (CLI & GUI)</a><br>
    1.9. <a href="#item1.9">Ports/Portas</a><br>
    1.10. <a href="#item1.10">Desvendando SMB e SNMP: Os Pilares e as Fraquezas da Rede</a><br>
    1.11. <a href="#item1.11">Introdução a Scanners de Vulnerabilidade com OpenVAS/Greenbone</a><br>
    1.12. <a href="#item1.12">Documentação Técnica Profissional</a><br>
    1.13. <a href="#item1.13">Projeto Final</a><br> -->

---

### Objective:
Implementar estratégias de defesa em profundidade e monitoramento contínuo de ambientes computacionais, por meio do fortalecimento de sistemas, configuração de firewalls e ACLs, análise de vulnerabilidades, gestão de logs com ferramentas como **Wazuh** e **ELK**, uso de IDS/IPS e aplicação de boas práticas em segurança em nuvem e resposta a incidentes.

### Folder Structure:
- [README.md](./README.md): Documento escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Este documento de README, escrito em **Markdown**, descrevendo todos os laboratórios realizados neste módulo.

### Development:
A configuração do ambiente foi realizada, assim como nos laboratórios do Módulo 1, utilizando o **Docker** em conjunto com o **WSL**. No entanto, foi adotada a plataforma **Play With Docker (PWD)**. Em situações em que os recursos disponíveis foram insuficientes, especialmente em laboratórios mais exigentes, foi utilizada uma instância do **Amazon Elastic Compute Cloud (EC2)**, na nuvem da **Amazon Web Services (AWS)**, como alternativa de execução.

A criação da instância EC2 foi automatizada por meio do script [`ec2Instance.ps1`](../../environment/ec2Instance.ps1), desenvolvido em **PowerShell** utilizando comandos da **AWS Command Line Interface (CLI)**. O script está localizado na pasta [`environment`](../../environment/) deste bootcamp. A instância foi provisionada com a imagem `ami-020cba7c55df1f615`, baseada no sistema operacional **Ubuntu Linux**, associada a um volume **Amazon Elastic Block Store (EBS)** de `8 GB`, do tipo `gp` (General Purpose). O tipo de instância utilizado foi o `t3.medium`, com 2 vCPUs e 4 GB de memória. Para acesso, foi utilizado o par de chaves `keyPairUniversal`, previamente existente na conta da **AWS**, e o grupo de segurança atribuído foi o `default` da zona de disponibilidade `us-east-1a` (Norte da Virgínia). Um script de *user data* também foi utilizado para automatizar a instalação do **Git** e do **Docker** durante o processo de inicialização.

O acesso à instância podia ser feito tanto pelo console da **AWS** quanto por meio de conexão SSH utilizando o **OpenSSH** no **Windows PowerShell** da máquina local. Neste último caso, era necessário informar o caminho do arquivo `.pem`, o nome do usuário do sistema e o IP ou DNS público da instância. Um exemplo de comando seria: `ssh -i "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/universal/keyPairUniversal.pem" ubuntu@54.160.249.118`. Além disso, o Security Group associado à instância precisava conter uma regra de entrada liberando a porta `22` para o IP público da máquina física, a fim de permitir o estabelecimento da conexão SSH.

As máquinas virtuais do **Play With Docker (PWD)** também foram acessadas via SSH. Nesse caso, o próprio ambiente fornecia o comando necessário para a conexão, que podia ser executado diretamente no **Windows PowerShell**, sem necessidade de autenticação com chave privada ou senha.

Com o ambiente **Docker** em execução, cada laboratório era iniciado separadamente a partir de arquivos `docker-compose.yml` e `Dockerfile`, fornecidos pelo instrutor do curso. O arquivo de **Docker Compose** era responsável por definir os serviços, volumes e redes necessários para o laboratório em questão. Para executar esses arquivos, o processo era basicamente o mesmo, o que mudava era o caminho para o arquivo correto. Dessa forma, a sequência era:
- Clonagem do repositório do bootcamp: `git clone https://github.com/Kensei-CyberSec-Lab/formacao-cybersec.git`.
- Alteração do diretório corrente para o diretório do arquivo: `cd formacao-cybersec/modulo2-defesa-monitoramento/lab_1`. Aqui era só trocar a última pasta do path para a aula correta.
- Execução do ambiente com **Docker Compose**: `docker compose up -d`. Este comando tinha que ser sempre executado na pasta onde o arquivo `docker-compose.yml` estava.
- Verificação dos containers ativos: `docker ps`.
- Comando para acessar os containers existentes: `docker exec -it kali /bin/bash`. Aqui era só trocar o nome do container que desejava-se acessar.
- Encerramento do ambiente: `docker compose down`. Este comando deveria ser sempre executado na pasta onde o arquivo `docker-compose.yml` estava.

<a name="item1.1"><h4>1.1 Arquitetura em Camadas</h4></a>[Back to summary](#item1)   
[Material do Lab](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/tree/main/modulo2-defesa-monitoramento/lab_1)

O primeiro laboratório executado neste módulo consistiu em um ambiente composto pelos seguintes containers: a aplicação web vulnerável **OWASP Juice Shop**, que simula um site de vendas de sucos (`juice_shop`); uma máquina **Ubuntu**, configurada como servidor **Linux** para aplicação de hardening (`ubuntu_host`); e uma máquina com sistema **Kali Linux**, equipada com ferramentas para ataque (`kali_host`). Neste estágio, os sistemas ainda não contava com nenhuma camada de proteção ou hardening, que foram sendo adicionadas gradualmente nos laboratórios seguintes.

Como a primeira aula abordava o tema de arquitetura em camadas, o propósito deste laboratório foi introduzir o conceito de defesa em profundidade, observando como cada camada poderia contribuir para a segurança do sistema. Assim, o foco foi analisar os sistemas intencionalmente vulneráveis, representado pelo servidor web Juice Shop e pelo servidor **Ubuntu**, antes da aplicação de qualquer mecanismo de defesa — com o objetivo de identificar riscos e compreender a perspectiva de um atacante. 

Para isso, os dois sistemas de defesa — a aplicação web e o servidor **Ubuntu** — foram acessados. O primeiro, por meio do navegador da máquina física, foi utilizado para a exploração das páginas da aplicação. O segundo foi acessado diretamente pelo container, com o objetivo de listar e identificar os serviços ativos. O container de ataque, que correspondia ao **Kali Linux**, foi utilizado posteriormente para realizar varreduras nos dois sistemas de defesa, com o intuito de identificar possíveis vulnerabilidades.

Este laboratório foi executado no **Play With Docker (PWD)**, utilizando apenas um node. Após a conexão via SSH com a instância, realizada por meio do **Windows PowerShell** da máquina física utilizando o **OpenSSH**, o ambiente de containers foi construído, conforme mostrado na imagem 01. Note que o container `juice_shop` apresentava um mapeamento de portas: a porta `3000`, onde a aplicação web estava em execução dentro do container, foi mapeada para a porta `3001` da instância. Assim, ao solicitar ao PWD que abrisse a porta `3001`, a aplicação vulnerável **OWASP Juice Shop** pôde ser acessada, como ilustrado na imagem 02.

<div align="center"><figure>
    <img src="../0-aux/md2-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="../0-aux/md2-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

Logo ao acessar a aplicação, uma mensagem de boas-vindas era exibida, informando que o **OWASP Juice Shop** é uma aplicação web com um vasto número de vulnerabilidades de segurança intencionais. Essa aplicação é amplamente utilizada para testes e práticas de identificação de vulnerabilidades. Dentre as funcionalidades disponíveis, havia a opção de login, permitindo que o usuário acesse uma conta existente ou realize um novo cadastro. Para fins de teste, foi criado um cadastro fictício com o e-mail aleatório `teste@gmail.com` e a senha `Testes1@`. Após o login, já era possível adicionar produtos ao carrinho, simulando o funcionamento típico de um site de e-commerce. A imagem 03 ilustra um exemplo de carrinho montado na seção `Your Basket`.

<div align="center"><figure>
    <img src="../0-aux/md2-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Ao acessar a área da conta do usuário (`Account`), diversas funcionalidades adicionais tornaram-se disponíveis. Entre elas, destacou-se a opção `Orders & Payment`, que incluía: `Order History`, `Recycle`, `My saved addresses`, `My Payment Options` e `Digital Wallet`. Outra seção relevante era `Privacy & Security`, que disponibilizava opções como: `Privacy Policy`, `Request Data Export`, `Request Data Erasure`, `Change Password`, `2FA Configuration` e `Last Login IP`. Também era possível realizar o logout por meio da opção `Logout`. Fora da área `Account`, era permitido alterar o idioma do site, além de acessar outras funcionalidades voltadas ao desenvolvimento da aplicação, localizadas no menu lateral esquerdo.

Após a análise do primeiro sistema, foi acessado o segundo, correspondente ao servidor **Ubuntu**, por meio do comando `docker exec -it ubuntu_host /bin/bash`. Dentro do container, foi executado o comando `ps aux` com o objetivo de listar todos os processos em execução. A saída retornou apenas três processos: um relacionado à execução do próprio `ps aux`, outro referente ao processo `/bin/bash`, iniciado pelo comando **Docker** para interação via shell, e o processo `sleep infinity`, responsável por manter o container ativo. Em seguida, foi utilizado o comando `netstat -tulnp` para verificar as conexões de rede em modo de escuta. A saída indicou duas conexões locais: uma utilizando o protocolo TCP na porta `46830` do IP `127.0.0.11`, e outra via protocolo UDP na porta `56529`, também no mesmo IP. Essas conexões estavam associadas ao sistema de DNS interno do **Docker** e não representam serviços de rede típicos, como servidores HTTP ou SSH. Isso indicava que não havia serviços expostos ou em execução em portas padrão. Esse segundo sistema consistia em um servidor **Ubuntu** básico, que seria utilizado nos próximos exercícios para aplicação e teste de técnicas de hardening. A imagem 04 apresenta a saída dos comandos descritos.

<div align="center"><figure>
    <img src="../0-aux/md2-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

Com a análise dos sistemas de defesa concluída, o próximo passo foi utilizar o container de ataque, o **Kali Linux**, para realizar varreduras nos dois alvos em busca de vulnerabilidades. Para isso, a conexão com o container anterior foi encerrada, e o acesso ao Kali foi feito com o comando `docker exec -it kali_host /bin/bash`. Já dentro do Kali, foi necessário identificar as interfaces de rede disponíveis. Como o comando `ip` não estava presente por padrão, a ferramenta **iproute2** precisou ser instalada com `apt update && apt install iproute2 -y`. Em seguida, o comando `ip a` revelou uma única interface Ethernet, a `eth0`, com o endereço IP `172.20.0.3/16`. A partir desse CIDR, foi possível deduzir que a rede local seguia o padrão `172.20.0.0/24`. Utilizando o comando `nmap -sn 172.20.0.0/24`, foi realizada uma varredura para identificar os hosts ativos na rede. O resultado indicou quatro dispositivos: o próprio Kali (`172.20.0.3`), o IP `172.20.0.1`, provavelmente o gateway da rede, e os IPs `172.20.0.2` e `172.20.0.4`, correspondentes respectivamente aos containers `juice_shop.lab_1_cyberlab_net` e `ubuntu_host.lab_1_cyberlab_net`. A imagem 05 exibe essa descoberta.

<div align="center"><figure>
    <img src="../0-aux/md2-img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Agora que os IPs de cada sistema foram identificados, o próximo passo foi escanear individualmente cada um deles para descobrir quais portas estavam abertas e quais serviços estavam em execução. Para isso, foram utilizados os comandos `nmap -sS -sV 172.20.0.2` e `nmap -sS -sV 172.20.0.4`, evidenciados nas imagens 06 e 07.

<div align="center"><figure>
    <img src="../0-aux/md2-img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="../0-aux/md2-img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

A análise do resultado do primeiro comando indicava que a porta `3000` estava aberta e escutando conexões TCP, embora o serviço não tenha sido corretamente identificado pelo **nmap**. No entanto, a resposta HTTP recebida indicava claramente que se tratava da aplicação **OWASP Juice Shop**, confirmando o funcionamento esperado. Já o escaneamento realizado no IP `172.20.0.4`, correspondente ao servidor **Ubuntu**, não revelou portas abertas, pois todas as 1000 portas TCP padrão escaneadas estavam fechadas. Isso indicava que, naquele momento, o servidor **Ubuntu** não possuía serviços de rede expostos, reforçando que ele estava em uma configuração inicial sem aplicações escutando em portas acessíveis pela rede.

<a name="item1.2"><h4>1.2 Hardening</h4></a>[Back to summary](#item1)   
[Material do Lab](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/tree/main/modulo2-defesa-monitoramento/lab_2)

No laboratório anterior, foi realizado o acesso e a exploração de sistemas inseguros — o servidor web e o servidor **Ubuntu** — ambos sem qualquer mecanismo de defesa implantado. Neste segundo laboratório, iniciou-se o processo de hardening, com a aplicação de técnicas básicas de segurança. A dinâmica consistia em acessar primeiro o container **Kali Linux**, utilizado para atacar o container de defesa (o servidor **Ubuntu**), evidenciando suas vulnerabilidades. Em seguida, era feito o acesso ao servidor **Ubuntu** para aplicar as técnicas de hardening correspondentes. Por fim, o ataque era repetido a partir do **Kali Linux** para verificar se a vulnerabilidade havia sido mitigada. As técnicas de hardening aplicadas foram:
- Criação de um usuário com privilégios de `sudo`;
- Ativação do login por chave pública;
- Desativação do login com o usuário `root`;
- Desativação da autenticação por senha;
- Ativação do firewall;
- Remoção de serviços desnecessários;
- Restrição de permissões inadequadas.






<a name="item1.3"><h4>1.3 Firewall</h4></a>[Back to summary](#item1)   
[Material do Lab](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/tree/main/modulo2-defesa-monitoramento/lab_3)








