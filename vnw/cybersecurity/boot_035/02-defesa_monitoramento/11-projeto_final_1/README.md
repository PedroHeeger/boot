# Formação Cybersec - Módulo 2 - Projeto Final 1   <img src="../../0-aux/logo_boot.png" alt="boot_035" width="auto" height="45">

### Repository: [boot](../../../../../)   
### Platform: <a href="../../../../">vnw   <img src="https://github.com/PedroHeeger/my_tech_journey/blob/main/platforms/img/vnw.jpeg" alt="vnw" width="auto" height="25"></a>
### Software/Subject: <a href="../../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../../">boot_035 (Formação Cybersec)   <img src="../../0-aux/logo_boot.png" alt="boot_035" width="auto" height="25"></a>
### Module: 2. Defesa & Monitoramento (Blue Team)

---

Esta pasta refere-se ao projeto final opção 1 do módulo 2 **Defesa & Monitoramento (Blue Team)** do bootcamp [**Formação Cybersec**](../../). O artefato entregável principal foi o relatório da análise técnica construído no arquivo [relatorio.md](./relatorio.md). Os demais artefáteis entregáveis fizeram parte do projeto e também estão disponíveis nessa pasta e anexados ao relatório.

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
- Observability:
  - Dozzle   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/dozzle.svg" alt="dozzle" width="auto" height="25">
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
  - Netdiscover   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/netdiscover.png" alt="netdiscover" width="auto" height="25">
  - Net-tools   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/net-tools.svg" alt="net-tools" width="auto" height="25">
  - Nmap   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/nmap.png" alt="nmap" width="auto" height="25">
  - OWASP ModSecurity Core Rule Set (OWASP ModSecurity CRS)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/owasp_modesecurity_crs.png" alt="owasp_modesecurity_crs" width="auto" height="25">
  - Ping   <img src="" alt="iputils" width="auto" height="25">
- Offensive Security:
  - Kali Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/kali_linux.png" alt="kali_linux" width="auto" height="25">

---

### Bootcamp Module 1 Final Project 1 Structure
1. <a name="item1">Opção 1 – Projeto Técnico: Lab de Segurança WAF + DVWA<br>
    1.0 <a href="#item1.0">Introdução</a><br>
    1.1 <a href="#item1.1">Configuração do DVWA</a><br>
    1.2 <a href="#item1.2">Reconhecimento (Nmap)</a><br>
    1.3 <a href="#item1.3">Teste no Modo Detecção</a><br>
    1.4 <a href="#item1.4">Teste no Modo Blocking</a><br>
    1.5 <a href="#item1.5">Monitoramento com Dozzle</a><br>
    1.6 <a href="#item1.6">Coleta de Evidências</a><br>
    1.7 <a href="#item1.7">Documentação Técnica</a><br>

---

### Objective
O objetivo deste projeto foi elaborar um relatório técnico completo para documentar a execução de um laboratório controlado em ambiente **Docker**. Esse relatório deveria conter: capa, sumário executivo (1 página), objetivo, escopo, metodologia, diagrama/arquitetura, evidências/diagnóstico, recomendações, plano de ação, conclusão e anexos. Os anexos incluíram prints das ações executadas, arquivos de texto com outputs de comandos ou outros materiais que comprovassem a execução bem-sucedida do laboratório.  

No laboratório, o objetivo foi construir um ambiente defensivo utilizando a aplicação vulnerável **DVWA** protegida por um Web Application Firewall (WAF) **OWASP ModSecurity CRS**. Foram testados os modos de detecção e de bloqueio frente a ataques de SQL Injection (SQLi), Cross-Site Scripting (XSS), Command Injection e File Inclusion. Para o monitoramento, foi empregado o **Dozzle**, permitindo a visualização e análise dos logs do WAF em tempo real.  

### Folder Structure:
- Este documento de README, escrito em **Markdown**, descreve todo o desenvolvimento do projeto. Embora não seja um artefato entregável, complementa o projeto.
- [relatorio.md](./relatorio.md): Relatório de análise técnica da rede interna da empresa fictícia. É o principal artefato entregável.
- [softwares.md](./softwares.md): Documento em **Markdown** contendo informações relevantes sobre todos os softwares e ferramentas utilizados na análise técnica. É um anexo do relatório técnico.
- [cmds.md](./cmds.md): Documento em **Markdown** com os comandos executados durante a análise técnica. É um anexo do relatório técnico.
- [diagrama.png](./diagrama.png): Arquivo em **PNG** com o diagrama da topologia de rede, construído no **Draw.io**. É um anexo do relatório técnico.
- [outputs](./outputs): Pasta contendo arquivos em **TXT** com os outputs dos comandos executados. É um anexo do relatório técnico.
- [img](./img): Pasta com imagens (prints) dos outputs dos comandos executados. É um anexo do relatório técnico e utilizado neste arquivo de README.

### Development:
Em cibersegurança, é prática comum e recomendada realizar laboratórios em ambientes controlados e seguros. Por isso, ferramentas como **Docker** ou máquinas virtuais são utilizadas para simular ambientes reais, protegendo a infraestrutura local, uma vez que o uso de ferramentas de ataque ou alterações em configurações de rede podem comprometer a integridade do sistema. O ambiente de laboratório é estruturado em duas partes: a primeira envolve a instalação dos softwares que virtualização um ambiente, como **WSL2**, **Docker** ou **VM VirtualBox**, além de ferramentas de suporte essenciais, como editores de código (**Visual Studio Code (VS Code)**) e sistemas de versionamento (**Git**).  

Neste curso, a virtualização do ambiente foi realizada principalmente com **Docker** em conjunto com **WSL**. No entanto, para a maioria dos labs utilizei o **Docker** em instâncias do **Amazon Elastic Compute Cloud (EC2)**, na nuvem da **Amazon Web Services (AWS)**, como alternativa de execução. Em pequenos casos, para realizar testes, a plataforma **Play With Docker (PWD)** também foi utilizada.

A criação da instância EC2 foi automatizada por meio do script [`ec2Instance.ps1`](../environment/ec2Instance.ps1), desenvolvido em **Windows PowerShell** utilizando comandos da **AWS Command Line Interface (CLI)**. O script está localizado na pasta [`environment`](../environment/) deste curso, pois foi o mesmo para todos os módulos. A instância foi provisionada com a imagem `ami-020cba7c55df1f615`, baseada no sistema operacional **Linux Ubuntu**, associada a um volume do **Amazon Elastic Block Store (EBS)** de `8 GB`, do tipo `gp` (General Purpose). O tipo de instância utilizado foi o `t3.medium`, com 2 vCPUs e 4 GB de memória. Para acesso, foi utilizado o par de chaves `keyPairUniversal`, previamente existente na conta da **AWS**, e o grupo de segurança atribuído à instância foi o `default` da zona de disponibilidade `us-east-1a` (Norte da Virgínia). Um script de *user data* foi utilizado para automatizar a instalação do **Git** e do **Docker** durante o processo de inicialização.

O acesso à instância podia ser feito tanto pelo console da **AWS** quanto por meio de conexão SSH utilizando o **OpenSSH** no **Windows PowerShell** da máquina local. Neste último caso, era necessário informar o caminho do arquivo de chave privada, o nome do usuário do sistema e o IP ou DNS público da instância. Um exemplo de comando seria: `ssh -i "G:/Meu Drive/4_PROJ/scripts/aws/.default/secrets/awsKeyPair/universal/keyPairUniversal.pem" ubuntu@54.160.249.118`. Além disso, o Security Group associado à instância precisava conter uma regra de entrada liberando a porta `22` para o IP público da máquina física, a fim de permitir o estabelecimento da conexão SSH. As máquinas virtuais do **Play With Docker (PWD)** também foram acessadas via SSH. Nesse caso, o próprio ambiente fornecia o comando necessário para a conexão, que podia ser executado diretamente no **Windows PowerShell**, sem necessidade de autenticação com chave privada ou senha.

A segunda parte do ambiente de laboratório consiste na construção do ambiente simulado propriamente dito. No caso do **Docker**, isso envolve a criação de containers, redes e volumes, realizada por meio de dois tipos principais de arquivos. O primeiro é o `docker-compose.yml`, que define de forma serial toda a estrutura a ser criada: quais e quantos containers, suas configurações, as imagens que irão utilizar e os volumes e redes que serão estabelecidos. O segundo tipo de arquivo, que pode existir mais de um por laboratório, são os `Dockerfile`, responsáveis por criar imagens específicas para cada container. Essas imagens podem ser enviadas a repositórios de imagens **Docker**, como o **DockerHub**, ou referenciadas diretamente no arquivo do **Docker Compose**.

Todos esses arquivos eram preparados pelo instrutor do curso e disponibilizados no [repositório](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/) do curso no perfil da plataforma **Vai na Web** no **GitHub**. O repositório era organizado pelos três módulos do curso, com pastas correspondentes a cada laboratório. Geralmente, o número do laboratório coincidia com o número da aula, embora nem todos os labs seguissem essa sequência e nem todas as aulas tivessem laboratórios. Em cada pasta de laboratório, além dos arquivos `docker-compose.yml` e `Dockerfile`, podiam existir arquivos complementares, como scripts, textos ou documentos **Markdown**, contendo informações relevantes ou conteúdos necessários para a execução do lab. Durante a realização de cada lab, além de executar os exercícios, foi feita uma explicação detalhada sobre a construção dos arquivos de **Docker Compose**,  **Docker** e as dependências utilizadas, evidenciando como o ambiente foi estruturado.

Para executar os arquivos e iniciar o ambiente de laboratório, a sequência de comandos utilizada era a seguinte:
- `git clone https://github.com/Kensei-CyberSec-Lab/formacao-cybersec.git`: Clonagem do repositório do bootcamp para o ambiente local, seja no **WSL**, em máquinas virtuais ou, como no meu caso, em instâncias **Amazon EC2**.
- `cd formacao-cybersec/modulo2-defesa-monitoramento/lab_1`: Navegação até o diretório do laboratório a ser executado. Para outros labs, bastava alterar as duas últimas pastas do caminho para o módulo e lab correspondentes.
- `docker compose up -d`: Inicialização do ambiente com **Docker Compose**. Este comando deve ser executado na pasta onde o arquivo `docker-compose.yml` está localizado.
- `docker ps` e `docker network ls`: Verificação dos containers ativos e das redes existentes no ambiente.
- `docker exec -it kali /bin/bash`: Acesso a um container em execução. Basta substituir `kali` pelo nome do container que se deseja acessar.
- `docker compose down`: Encerramento do ambiente. Assim como na inicialização, este comando deve ser executado na pasta onde se encontra o arquivo `docker-compose.yml`.
- `docker system prune -f`: Remoção containers parados, redes não usadas, imagens dangling (imagens sem tags) e caches de build.
- `docker system prune -a`: Remoção containers parados, redes não usadas, imagens dangling (imagens sem tags) e caches de build, além de remoção de todas as imagens não usadas por containers.

Os laboratórios de cibersegurança são organizados com máquinas de ataque, geralmente uma **Kali Linux**, e máquinas alvo ou de defesa, que são os sistemas onde os ataques são realizados. Pode haver múltiplas máquinas de cada tipo, sendo comum que algumas máquinas de defesa sejam propositalmente vulneráveis, incluindo aplicações web criadas para testes. Como o ambiente é simulado via **Docker**, termos como servidor, máquina, container ou host frequentemente se referem aos containers que representam as máquinas simuladas. Além disso, é importante ter em mente que existem outras duas camadas no ambiente: a máquina física, no caso meu computador pessoal **Windows**, e a máquina virtual fornecida pela **AWS** ou pelo **Play With Docker (PWD)**, que hospeda e executa os containers do **Docker**.

Outra parte importante dos laboratórios foram os *Capture The Flag (CTF)*, desafios técnicos amplamente utilizados na área de cibersegurança para desenvolver e validar conhecimento prático. Cada desafio apresenta um cenário específico — como exploração de vulnerabilidades, análise de tráfego, OSINT ou engenharia reversa — e exige que o participante realize uma ação ou resolva um problema para obter a flag. A flag não se limita a uma string ou código a ser encontrado, ela representa a prova de que o objetivo do desafio foi cumprido com sucesso. Ao longo dos laboratórios do curso, diversos CTFs foram incorporados ao ambiente simulado, servindo como etapas práticas de validação do conteúdo e permitindo aplicar, de forma objetiva, os conceitos aprendidos. Dessa forma, os laboratórios não apenas simularam cenários reais de ataque e defesa, como também proporcionaram desafios progressivos que reforçaram o raciocínio lógico, a análise técnica e a consolidação do conhecimento.

<a name="item1.0"><h4>1.0 Introdução</h4></a> [Back to summary](#item1)

O desafio de projeto 1 deste módulo consistiu na execução de um laboratório específico, seguido da elaboração de um relatório técnico contendo as devidas comprovações. Para facilitar a compreensão, o ambiente do laboratório foi detalhado a seguir. Observa-se que quatro containers foram construídos em uma mesma rede **Docker**, sendo eles: a máquina de ataque (`kali_lab35`), a aplicação web vulnerável **Damn Vulnerable Web Application (DVWA)** (`dvwa`), o Web Application Firewall (WAF) **OWASP ModSecurity Core Rule Set (OWASP ModSecurity CRS)** (`waf_modsec`) e o container do **Dozzle** (`dozzle`).

<details><summary><strong>Ambiente de Laboratório</strong></summary>
  <ul>
    <li><details><summary><strong>Docker Compose</strong></summary>
      <ul>
        <li><details><summary><strong>kali_lab35</strong></summary>
          <ul>
            <li><strong>build:</strong> Define que a imagem do container será construída a partir do diretório atual (`.`) utilizando o arquivo <code>Dockerfile.kali</code> como receita de construção.</li>
            <li><strong>container_name:</strong> Define o nome do container de forma explícita como <code>kali_lab35</code>.</li>
            <li><code>tty: true</code>: Permite alocar um terminal interativo, facilitando o acesso ao container via <code>docker exec -it</code> e mantendo-o ativo.</li>
            <li><strong>volumes:</strong> <code>./scripts:/scripts</code> — Monta scripts locais dentro do container.</li>
            <li><strong>networks:</strong> Conecta o container à rede <code>labnet35</code> e define o IP estático <code>192.168.35.11</code> dentro dessa rede.</li>
          </ul>
        </details></li>
        <li><details><summary><strong>waf_modsec</strong></summary>
          <ul>
            <li><strong>image:</strong> owasp/modsecurity-crs:nginx-alpine — Container WAF com regras do OWASP ModSecurity Core Rule Set.</li>
            <li><strong>container_name:</strong> Define o nome do container de forma explícita como <code>waf_modsec</code>.</li>
            <li><strong>environment:</strong>
              <ul>
                <li><code>BACKEND=http://dvwa:80</code> — Proxy_pass para aplicação DVWA, todas as requisições que chegam ao WAF serão enviadas para o container DVWA na porta 80.</li>
                <li><code>SERVER_NAME=localhost</code> — Define o hostname do WAF.</li>
                <li><code>MODSEC_RULE_ENGINE=On</code> — Habilita bloqueio de ataques.</li>
                <li><code>MODSEC_RULE_ENGINE=DetectionOnly</code> — Habilita apenas a detecção de ataques.</li>
                <li><code>BLOCKING_PARANOIA=1</code> — Define o nível de paranoia para bloqueio de ataques.</li>
                <li><code>DETECTION_PARANOIA=1</code> — Define o nível de paranoia para detecção de ataques.</li>
              </ul>
            </li>
            <li><strong>depends_on:</strong> <code>dvwa</code> — Aguarda a aplicação DVWA estar disponível antes de iniciar o WAF.</li>
            <li><strong>ports:</strong> <code>8080:8080</code> — Mapeia a porta 8080 do host para o container, permitindo acesso externo ao WAF.</li>
            <li><strong>networks:</strong> Conecta o container à rede <code>labnet35</code> com IP estático <code>192.168.35.30</code>.</li>
          </ul>
        </details></li>
        <li><details><summary><strong>dvwa</strong></summary>
          <ul>
            <li><strong>image:</strong> vulnerables/web-dvwa — Container da aplicação DVWA para testes de segurança.</li>
            <li><strong>container_name:</strong> Define o nome do container de forma explícita como <code>dvwa</code>.</li>
            <li><strong>networks:</strong> Conecta o container à rede <code>labnet35</code> com IP estático <code>192.168.35.40</code>.</li>
          </ul>
        </details></li>
        <li><details><summary><strong>dozzle</strong></summary>
          <ul>
            <li><strong>image:</strong> amir20/dozzle:latest — Visualizador de logs em tempo real para containers Docker via interface web.</li>
            <li><strong>container_name:</strong> Define o nome do container de forma explícita como <code>dozzle</code>.</li>
            <li><strong>ports:</strong> <code>9999:8080</code> — Mapeia a porta 8080 do container para 9999 do host.</li>
            <li><strong>environment:</strong>
              <ul>
                <li><code>DOZZLE_USERNAME=admin</code> — Usuário de login do Dozzle.</li>
                <li><code>DOZZLE_PASSWORD=admin</code> — Senha de login do Dozzle.</li>
              </ul>
            </li>
            <li><strong>volumes:</strong> <code>/var/run/docker.sock:/var/run/docker.sock:ro</code> — Permite leitura dos logs de todos os containers do host.</li>
            <li><strong>networks:</strong> Conecta o container à rede <code>labnet35</code> com IP estático <code>192.168.35.50</code>.</li>
          </ul>
        </details></li>
        <li><details><summary><strong>labnet35</strong></summary>
          <ul>
            <li><code>driver: bridge</code> — Rede do tipo bridge, conectando containers isoladamente dentro do host.</li>
            <li><strong>ipam:</strong>
              <ul>
                <li><strong>config:</strong>
                  <ul>
                    <li><code>subnet: 192.168.35.0/24</code> — Define o intervalo de IPs disponíveis na rede, permitindo atribuição de IPs estáticos.</li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
        </details></li>
      </ul>
    </details></li>
    <li><details><summary><strong>Dockerfile</strong></summary>
      <ul>
        <li><details><summary><strong>Dockerfile.kali</strong></summary>
          <ul>
            <li><code>FROM kalilinux/kali-rolling</code> — Imagem base do Kali Linux rolling release.</li>
            <li><code>RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nmap gobuster sqlmap tcpdump iputils-ping curl wget && rm -rf /var/lib/apt/lists/*</code> — Instala ferramentas essenciais de pentest e limpa cache.</li>
            <li><code>CMD ["/bin/bash"]</code> — Mantém o container ativo com shell interativo.</li>
          </ul>
        </details></li>
      </ul>
    </details></li>
  </ul>
</details>

Neste laboratório, quatro tipos de ataques — SQL Injection (SQLi), Cross-Site Scripting (XSS), Command Injection e File Inclusion — foram executados na aplicação web vulnerável **DVWA** para avaliar o comportamento do WAF, que atuava como camada de proteção. O WAF foi testado em dois modos: modo de detecção, que apenas identificava os ataques sem bloqueá-los, e modo de bloqueio, que além de detectar, também impedia a execução do ataque. É importante destacar que o **OWASP ModSecurity Core Rule Set (OWASP ModSecurity CRS)** não é, por si só, um WAF, mas sim um conjunto de regras de segurança pré-configuradas para o **ModSecurity**, que é o verdadeiro firewall de aplicações web (WAF). Esse conjunto de regras auxilia na proteção de aplicações contra ataques comuns, como injeção de SQL, XSS e execução remota de código.

Paralelamente, o software **Dozzle** foi utilizado para monitoramento, já que o container possuía um mapeamento de volume que direcionava todos os logs do **Docker** do host (instância **Amazon EC2**) para o container (`/var/run/docker.sock:/var/run/docker.sock:ro`). O **Dozzle** oferece uma interface web leve para visualização em tempo real dos logs dos containers **Docker**, permitindo o monitoramento de múltiplos containers de maneira simples, sem a necessidade de acessar diretamente o terminal.

A imagem 01 abaixo mostra todos os containers em execução na instância do **Amazon EC2**.

<div align="center"><figure>
    <img src="./img/img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<a name="item1.1"><h4>1.1 Configuração do DVWA</h4></a> [Back to summary](#item1)

O primeiro passo deste laboratório foi a configuração da aplicação web **DVWA**. Em vez de acessar o container diretamente, o mapeamento de portas (port forwarding) foi realizado no container WAF, que direcionava o tráfego para a aplicação, mantendo-a protegida. Observando o **Docker Compose**, nota-se que havia o port forwarding `"8080:8080"` no WAF, ou seja, a porta do container era mapeada para a porta correspondente no host (instância EC2). Dessa forma, o fluxo de comunicação era: container `dvwa` → container `waf_modsec` → instância EC2. Assim, ao criar uma regra no security group da instância, liberando a porta `8080` para o IP da máquina física **Windows**, era possível acessar a aplicação vulnerável **DVWA** pelo navegador da máquina física, como mostrado na imagem 02.

<div align="center"><figure>
    <img src="./img/img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

Na página inicial da aplicação, era solicitado o login, cujo padrão no **DVWA** era usuário `admin` e senha `password`. Após a autenticação, foi clicado em `Setup` no menu lateral e, em seguida, em `Create / Reset Database` para criar o banco de dados ou recriá-lo caso já existisse. Com a mensagem de sucesso, a página foi alterada para `DVWA Security`, permitindo confirmar que o nível de segurança estava definido como **Low** (Baixo), o qual era necessário para que o WAF pudesse atuar sobre a aplicação. A imagem 03 confirma que o nível de segurança estava configurado como **Low**.

<div align="center"><figure>
    <img src="./img/img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<a name="item1.2"><h4>1.2 Reconhecimento (Nmap)</h4></a> [Back to summary](#item1)

O navegador da máquina física permaneceu aberto na aplicação enquanto os próximos passos eram realizados. O container de ataque **Kali Linux** foi acessado com o comando `docker exec -it kali_lab35 /bin/bash` a partir da sessão remota estabelecida com a instância EC2 usando o **Windows PowerShell**. Em seguida, foi realizada uma varredura TCP SYN para descobrir portas abertas e identificar os serviços e suas versões no container `waf_modsec`, utilizando o comando `nmap -sS -sV waf_modsec`. A varredura revelou duas portas abertas: a porta `8080`, que executava o serviço **HTTP** com **Nginx**, e a porta `8443`, que executava **HTTPS** também com **Nginx** (conforme mostrado na imagem 04).

<div align="center"><figure>
    <img src="./img/img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

Após reconhecimento, o acesso ao container de ataque foi finalizado.

<a name="item1.3"><h4>1.3 Teste no Modo Detecção</h4></a>[Back to summary](#item1)

Na instância **Amazon EC2**, onde os containers estavam em execução, o arquivo `docker-compose.yml` precisou ser modificado. O container do firewall havia sido implantado com a configuração `MODSEC_RULE_ENGINE=On`, correspondente ao modo de bloqueio. Como o objetivo nesta etapa era testar o modo de detecção, essa configuração foi comentada e a configuração `MODSEC_RULE_ENGINE=DetectionOnly` foi descomentada. Para aplicar as alterações aos containers, foi executado o comando `docker compose up -d --force-recreate waf_modsec`, recriando todos os containers que foram modificados.

A partir deste ponto, iniciou-se a execução dos quatro ataques. Como eles seriam realizados a partir do container **Kali Linux**, foi necessário acessá-lo novamente com o comando `docker exec -it kali_lab35 /bin/bash`. Dentro do container, o primeiro ataque realizado foi o de injeção SQL, executado utilizando o **Curl**. O comando utilizado foi detalhado em suas partes a seguir:
- `curl`: Ferramenta de linha de comando para realizar requisições HTTP.  
- `-s`: Modo silencioso (silent), que suprime o progresso da requisição e mensagens de erro, deixando a saída limpa.  
- `"http://waf_modsec:8080/vulnerabilities/sqli/?id=1'+OR+'1'='1'--+-&Submit=Submit"`: URL alvo da requisição, contendo:
  - `waf_modsec:8080`: host e porta do container WAF que encaminha para a aplicação DVWA.  
  - `/vulnerabilities/sqli/`: endpoint da aplicação vulnerável à SQL Injection.  
  - `?id=1'+OR+'1'='1'--+-`: payload de injeção SQL que manipula o parâmetro `id` para sempre retornar verdadeiro. Cada parte do payload funciona da seguinte forma:  
    - `1'` (SQL: `1'`): fecha a aspa que delimita o valor do parâmetro `id` na query original da aplicação.  
    - `+OR+'1'='1'`(SQL: ` OR '1'='1'`): adiciona uma condição lógica que sempre é verdadeira, forçando a query a retornar todos os registros. O caractere `+` representa um espaço na URL.
    - `--+-` (SQL: `-- -`): inicia um comentário que ignora o restante da query original, garantindo que nenhuma outra cláusula interfira no ataque.  
  - `&Submit=Submit`: parâmetro enviado pelo formulário da aplicação simulando o clique no botão de envio.  
- `-H "Host: dvwa"`: Cabeçalho HTTP definindo o host como `dvwa`, necessário para o roteamento correto dentro do Docker.  
- `-H "Cookie: PHPSESSID=test; security=low"`: Cabeçalho HTTP com cookies da sessão, onde:
  - `PHPSESSID=test`: identifica a sessão da aplicação.  
  - `security=low`: define o nível de segurança da DVWA como baixo, permitindo que o ataque seja executado.  
- `-w "Status: %{http_code}\n"`: Formata a saída exibindo o código HTTP retornado pela requisição, permitindo verificar se o ataque foi processado com sucesso.

```bash
curl -s "http://waf_modsec:8080/vulnerabilities/sqli/?id=1'+OR+'1'='1'--+-&Submit=Submit" -H "Host: dvwa" -H "Cookie: PHPSESSID=test; security=low" -w "Status: %{http_code}\n"
```

Basicamente, este comando acessava o endpoint `/vulnerabilities/sqli/` da aplicação web vulnerável **DVWA** através do container do WAF, enviando o payload `?id=1'+OR+'1'='1'--+-` no formulário junto com o parâmetro `&Submit=Submit`, que simulava o envio do formulário na aplicação. O cabeçalho `-H "Host: dvwa"` indicava que o host alvo era o container **DVWA**, enquanto o cabeçalho `-H "Cookie: PHPSESSID=test; security=low"` fornecia a sessão da aplicação e definia o nível de segurança como baixo. O parâmetro `-w "Status: %{http_code}\n"` apenas formatava a saída do comando. O payload manipulava o parâmetro `id` com uma condição específica e adicionava uma segunda condição que sempre retornava verdadeira (`'1'='1'`), garantindo que todos os dados fossem exibidos, desprezando os filtros definidos. A imagem 05 evidencia que o ataque realizado foi detectado pelo WAF, retornando o status 302.

<div align="center"><figure>
    <img src="./img/img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Antes de prosseguir para o segundo ataque, o teste de SQL Injection foi realizado diretamente através da interface gráfica do **DVWA**, acessada pelo navegador da máquina física **Windows**. Como o container do **OWASP ModSecurity CRS** estava posicionado à frente da aplicação web **DVWA** e possuía mapeamento de portas na porta `8080`, era possível acessar o **DVWA** pelo IP ou DNS público da instância **Amazon EC2**, que já tinha a regra no grupo de segurança permitindo comunicação com o IP da máquina física. Dentro do **DVWA**, na seção `SQL Injection`, o payload `1'+OR+'1'='1'--+-` foi inserido no campo `User ID` e enviado ao clicar no botão `Submit`. A aplicação então retornou os nomes de todos os usuários do banco de dados, conforme ilustrado na imagem 06.

<div align="center"><figure>
    <img src="./img/img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

O segundo ataque realizado foi um Cross-Site Scripting (XSS) refletido, também executado via **Curl** para testar a detecção do WAF. O comando utilizado foi `curl -s "http://waf_modsec:8080/vulnerabilities/xss_r/?name=%3Cscript%3Ealert%28%22XSS%22%29%3C/script%3E" -H "Host: dvwa" -H "Cookie: security=low" -w "Status: %{http_code}\n"`. A seguir, o detalhamento de cada parte do comando:
- `curl`: Ferramenta de linha de comando para realizar requisições HTTP.  
- `-s`: Modo silencioso (silent), que suprime o progresso da requisição e mensagens de erro, deixando a saída limpa.  
- `"http://waf_modsec:8080/vulnerabilities/xss_r/?name=%3Cscript%3Ealert%28%22XSS%22%29%3C/script%3E"`: URL alvo da requisição, contendo:
  - `waf_modsec:8080`: host e porta do container WAF que encaminha para a aplicação DVWA.  
  - `/vulnerabilities/xss_r/`: endpoint da aplicação vulnerável a Cross-Site Scripting refletido.  
  - `?name=%3Cscript%3Ealert%28%22XSS%22%29%3C/script%3E`: parâmetro `name` com o payload URL-encoded. Ao ser decodificado pelo servidor, esse valor corresponde a `<script>alert("XSS")</script>`, ou seja:
    - `%3C` → `<` e `%3E` → `>`: delimitadores de tag HTML.  
    - `alert%28%22XSS%22%29` → `alert("XSS")`: chamada JavaScript.  
    - Se a aplicação reflete esse valor no HTML sem escape, o `<script>` é interpretado pelo navegador e o JavaScript é executado.
- `-H "Host: dvwa"`: Cabeçalho HTTP definindo o host como `dvwa`, necessário para o roteamento correto dentro do ambiente Docker.  
- `-H "Cookie: security=low"`: Cabeçalho HTTP com cookie que define o nível de segurança da DVWA como baixo, permitindo que o ataque seja executado.  
- `-w "Status: %{http_code}\n"`: Formata a saída exibindo o código HTTP retornado pela requisição, permitindo confirmar se a requisição foi processada com sucesso.  

A execução deste ataque foi semelhante ao anterior, pois ambos utilizavam requisições HTTP para explorar a aplicação web vulnerável **DVWA**. A diferença principal foi o endpoint alvo, que neste caso era `/vulnerabilities/xss_r/`, e o payload, que consistia em `?name=%3Cscript%3Ealert%28%22XSS%22%29%3C/script%3E`. Não houve necessidade de enviar dados via formulário, já que a requisição não era do tipo POST. No cabeçalho HTTP, não foi preciso incluir a sessão da aplicação, sendo definido apenas o nível de segurança como `low`, requisito importante, pois níveis mais altos da **DVWA** impediriam a execução do ataque mesmo sem intervenção do WAF. O payload inserido no campo `name` continha o código **JavaScript** `<script>alert("XSS")</script>`, utilizado apenas para testar se a página refletia o input do usuário sem escape, confirmando a vulnerabilidade e permitindo a execução de comandos. A imagem 07 demonstra que o WAF detectou o ataque, retornando o código de status 302.

<div align="center"><figure>
    <img src="./img/img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

Esse mesmo ataque também foi realizado através da interface gráfica, acessando a sessão `XSS (Reflected)` da aplicação. No único campo do formulário foi inserido o payload `<script>alert("XSS")</script>` e, ao clicar no botão `Submit`, o código foi executado no navegador da máquina física, exibindo a mensagem de alerta, conforme evidenciado na imagem 08.

<div align="center"><figure>
    <img src="./img/img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>

O terceiro ataque foi o de Command Injection, que também foi executado com o **Curl** no container de ataque através do comando `curl -s "http://waf_modsec:8080/vulnerabilities/command/?ip=127.0.0.1;ls" -H "Host: dvwa" -H "Cookie: security=low" -w "Status: %{http_code}\n"`. A explicação detalhada do comando é listada abaixo:
- `curl`: Ferramenta de linha de comando para enviar requisições HTTP.  
- `-s`: Modo silencioso (silent), que suprime o progresso da requisição e mensagens de erro, mantendo a saída limpa.  
- `"http://waf_modsec:8080/vulnerabilities/command/?ip=127.0.0.1;ls"`: URL alvo da requisição, contendo:  
  - `waf_modsec:8080`: host e porta do container WAF que encaminha para a aplicação DVWA.  
  - `/vulnerabilities/command/`: endpoint da aplicação vulnerável a Command Injection.  
  - `?ip=127.0.0.1;ls`: payload de injeção de comando que manipula o parâmetro `ip` para executar comandos arbitrários. Cada parte funciona da seguinte forma:  
    - `127.0.0.1`: valor legítimo do parâmetro, representando o host a ser pingado.  
    - `;ls`: comando injetado, separado por `;`, que lista arquivos do servidor.  
- `-H "Host: dvwa"`: Cabeçalho HTTP definindo o host como `dvwa`, necessário para o roteamento correto dentro do Docker.  
- `-H "Cookie: security=low"`: Cabeçalho HTTP definindo o nível de segurança da DVWA como baixo, permitindo que o ataque seja executado.  
- `-w "Status: %{http_code}\n"`: Formata a saída exibindo o código HTTP retornado pela requisição, permitindo verificar se o ataque foi processado com sucesso.

Assim como os dois ataques anteriores, este também foi realizado por meio de uma requisição HTTP, alterando apenas o endpoint para a seção apropriada do site (`/vulnerabilities/command/`) e o payload para `?ip=127.0.0.1;ls`. Esse payload preenchia o campo de IP com o endereço `127.0.0.1`, que correspondia ao localhost do container `dvwa`, e incluía um comando adicional. O valor do campo era utilizado como alvo em uma execução do comando `ping` no servidor, mas devido ao comando injetado `ls`, após o ping o servidor também listava os arquivos presentes no diretório da aplicação web vulnerável. A imagem 09 mostra o status 302 (redirecionamento), indicando que o ataque foi detectado, mas não bloqueado.

<div align="center"><figure>
    <img src="./img/img09.png" alt="img09"><br>
    <figcaption>Imagem 09.</figcaption>
</figure></div><br>

Na interface gráfica, o mesmo ataque foi realizado acessando a seção `Command Injection` do **DVWA** pelo navegador da máquina física. No campo disponível, foi inserido o mesmo payload `127.0.0.1;ls`, obtendo o mesmo resultado observado pelo **Curl**. A imagem 10 mostra o output do comando executado diretamente pela interface gráfica.

<div align="center"><figure>
    <img src="./img/img10.png" alt="img10"><br>
    <figcaption>Imagem 10.</figcaption>
</figure></div><br>

O quarto ataque foi o de File Inclusion, realizado com **Curl** no container de ataque através do comando: `curl -s "http://waf_modsec:8080/vulnerabilities/fi/?page=../../../../etc/passwd" -H "Host: dvwa" -H "Cookie: security=low" -w "Status: %{http_code}\n"`. A explicação detalhada do comando é listada abaixo:
- `curl`: Ferramenta de linha de comando para enviar requisições HTTP.  
- `-s`: Modo silencioso (silent), que suprime o progresso da requisição e mensagens de erro, mantendo a saída limpa.  
- `"http://waf_modsec:8080/vulnerabilities/fi/?page=../../../../etc/passwd"`: URL alvo da requisição, contendo:  
  - `waf_modsec:8080`: host e porta do container WAF que encaminha para a aplicação DVWA.  
  - `/vulnerabilities/fi/`: endpoint da aplicação vulnerável a File Inclusion.  
  - `?page=../../../../etc/passwd`: payload de inclusão de arquivo que manipula o parâmetro `page` para tentar ler arquivos arbitrários no servidor.  
- `-H "Host: dvwa"`: Cabeçalho HTTP definindo o host como `dvwa`, necessário para o roteamento correto dentro do Docker.  
- `-H "Cookie: security=low"`: Cabeçalho HTTP definindo o nível de segurança da DVWA como baixo, permitindo que o ataque seja executado.  
- `-w "Status: %{http_code}\n"`: Formata a saída exibindo o código HTTP retornado pela requisição, permitindo verificar se o ataque foi processado com sucesso.

Para este ataque, o processo foi o mesmo, alterando apenas o endpoint para `/vulnerabilities/fi/` e o payload para `?page=../../../../etc/passwd`. O objetivo desse payload era tentar ler o arquivo `/etc/passwd` no servidor da aplicação web vulnerável **DVWA**. A imagem 11 exibe o status 302 de redirecionamento, confirmando que o ataque foi detectado pelo container do WAF, mas não bloqueado.

<div align="center"><figure>
    <img src="./img/img11.png" alt="img11"><br>
    <figcaption>Imagem 11.</figcaption>
</figure></div><br>

Pela interface gráfica acessada no navegador, a seção no **DVWA** foi alternada para `File Inclusion` ... A imagem 12 evidencia o ataque pela GUI.

<div align="center"><figure>
    <img src="./img/img12.png" alt="img12"><br>
    <figcaption>Imagem 12.</figcaption>
</figure></div><br>

<a name="item1.4"><h4>1.4 Teste no Modo Blocking</h4></a>[Back to summary](#item1)

Após testar o modo de detecção no container do **OWASP ModSecurity CRS**, o passo seguinte foi alternar para o modo de bloqueio. Para isso foi necessário acessar o host que executava os containers — a instância **Amazon EC2** — e editar o arquivo `docker-compose.yml`. Na edição, a variável `MODSEC_RULE_ENGINE=DetectionOnly` foi comentada e `MODSEC_RULE_ENGINE=On` foi ativada. Em seguida, para aplicar a alteração apenas ao container do WAF, foi executado o comando `docker compose up -d --force-recreate waf_modsec`, recriando o container `waf_modsec` com as novas configurações.

De volta a máquina de ataque **Kali Linux**, cada um dos quatro ataques foi novamente realizado com o **Curl**. Os comandos foram executados nessa ordem:
- SQLi: `curl -s "http://waf_modsec:8080/vulnerabilities/sqli/?id=1'+OR+'1'='1'--+-&Submit=Submit" -H "Host: dvwa" -H "Cookie: PHPSESSID=test; security=low" -w "Status: %{http_code}\n"`;
- XSS: `curl -s "http://waf_modsec:8080/vulnerabilities/xss_r/?name=%3Cscript%3Ealert%28%22XSS%22%29%3C/script%3E`;
- Command Injection: `curl -s "http://waf_modsec:8080/vulnerabilities/command/?ip=127.0.0.1;ls" -H "Host: dvwa" -H "Cookie: security=low" -w "Status: %{http_code}\n"`;
- File Inclusion: `curl -s "http://waf_modsec:8080/vulnerabilities/fi/?page=../../../../etc/passwd" -H "Host: dvwa" -H "Cookie: security=low" -w "Status: %{http_code}\n"`;

A imagem 13 mostra que o output de cada comando retornou o código de status **403 (Forbidden)**, indicando que o WAF bloqueou os ataques com sucesso.

<div align="center"><figure>
    <img src="./img/img13.png" alt="img13"><br>
    <figcaption>Imagem 13.</figcaption>
</figure></div><br>

Os ataques também foram executados via interface gráfica do **DVWA**, seguindo o mesmo procedimento utilizado quando o WAF estava em modo de detecção. Caso a GUI não estivesse aberta, bastava acessar o IP ou DNS público da instância EC2 na porta `8080` — que estava mapeada para o container `waf_modsec`, o qual encaminhava o tráfego ao container `dvwa`. O grupo de segurança da instância já permitia o acesso na porta `8080` a partir do IP da máquina física **Windows**. Cada ataque foi realizado na sua respectiva seção do **DVWA**:
- SQLi: `1'+OR+'1'='1'--+-`  
- XSS (Reflected): `<script>alert("XSS")</script>`  
- Command Injection: `127.0.0.1;ls`  
- File Inclusion: `?page=../../../../etc/passwd`

As quatro imagens seguintes (14, 15, 16 e 17) evidenciam as tentativas de ataque realizadas pela interface gráfica, que foram bloqueadas pelo container WAF.

<div align="center"><figure>
    <img src="./img/img14.png" alt="img14"><br>
    <figcaption>Imagem 14.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img15.png" alt="img15"><br>
    <figcaption>Imagem 15.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img16.png" alt="img16"><br>
    <figcaption>Imagem 16.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img17.png" alt="img17"><br>
    <figcaption>Imagem 17.</figcaption>
</figure></div><br>

<a name="item1.5"><h4>1.5 Monitoramento com Dozzle</h4></a>[Back to summary](#item1)

Com a finalização dos testes do firewall de aplicação web **OWASP ModSecurity CRS** em ambos os modos (detecção e bloqueio), o passo seguinte foi a análise dos logs. Para isso, utilizou-se o **Dozzle**, uma interface web leve que permite visualizar, em tempo real, os logs de contêineres **Docker**. Na configuração do container `dozzle` no **Docker Compose**, foi definido um mapeamento de volume, onde o arquivo de logs de todos os containers do host (instância EC2), localizado em `/var/run/docker.sock`, era compartilhado com o diretório equivalente no container `/var/run/docker.sock`. Dessa forma, o container **Dozzle** tinha acesso centralizado aos logs de todos os containers da instância.

No container `dozzle` também foi configurado um port forwarding, mapeando a porta `9999` do host para a porta `8080` do container, onde o serviço estava em execução. Com isso, era possível acessar a interface gráfica do **Dozzle** externamente pelo navegador da máquina física, utilizando o IP ou DNS público da instância na porta `9999`. As credenciais de autenticação definidas foram `admin` para usuário e `admin` para senha. Entretanto, foi necessário acrescentar uma nova regra ao security group da instância, liberando a porta `9999` para o IP público da máquina física **Windows**. A imagem 18 exibe o acesso autenticado a interface do **Dozzle**.

<div align="center"><figure>
    <img src="./img/img18.png" alt="img18"><br>
    <figcaption>Imagem 18.</figcaption>
</figure></div><br>

Dentro do **Dozzle**, foi selecionado o container `waf_modsec` para análise dos logs. Foram aplicados dois filtros principais:  
- `"secrules_engine":"DetectionOnly"`: exibia os quatro ataques detectados pelo WAF quando apenas o modo de detecção estava ativo, sem bloqueio.  
- `"secrules_engine":"Enabled"`: mostrava os mesmos ataques, mas desta vez tanto detectados quanto bloqueados pelo WAF.  

<div align="center"><figure>
    <img src="./img/img19.png" alt="img19"><br>
    <figcaption>Imagem 19.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img20.png" alt="img20"><br>
    <figcaption>Imagem 20.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img21.png" alt="img21"><br>
    <figcaption>Imagem 21.</figcaption>
</figure></div><br>

<div align="center"><figure>
    <img src="./img/img22.png" alt="img22"><br>
    <figcaption>Imagem 22.</figcaption>
</figure></div><br>

<a name="item1.6"><h4>1.6 Coleta de Evidências</h4></a>[Back to summary](#item1)

Na etapa de coleta de evidências, foram utilizadas as mesmas imagens capturadas para esse arquivo README. Em cada execução do laboratório, um print foi registrado para comprovar a execução, servindo como evidência a ser anexada ao relatório técnico. Todo o processo foi documentado, desde o reconhecimento com **Nmap**, passando pelos testes dos quatro tipos de ataques em modo de detecção e, posteriormente, em modo de bloqueio, até a análise dos logs desses ataques no **Dozzle**.  

Além disso, foi realizada uma coleta adicional de evidências: a criação de um arquivo contendo os logs do container do WAF. Essa ação foi feita diretamente no host com o comando: `docker logs waf_modsec --tail 50 > logs_waf_evidencias.txt`. A imagem 23 exibe essa coleta sendo realizada.

<div align="center"><figure>
    <img src="./img/img23.png" alt="img23"><br>
    <figcaption>Imagem 23.</figcaption>
</figure></div><br>

<a name="item1.7"><h4>1.7 Documentação Técnica</h4></a>[Back to summary](#item1)

Após a conclusão do laboratório, iniciou-se a construção da documentação técnica. Este arquivo de README utilizado é o padrão que mantenho em todos os projetos no GitHub, servindo para narrar detalhadamente como cada atividade (bootcamp, curso, aula, laboratório, desafio ou projeto) foi desenvolvida.  

A documentação técnica do projeto, por sua vez, constitui o artefato principal a ser entregue, incluindo seus anexos. Esse artefato foi o relatório técnico de nome [relatorio_tecnico.md](./relatorio_tecnico.md), que registrou de forma estruturada e detalhada todo o laboratório realizado, permitindo que outros documentos ou evidências relevantes fossem vinculados como anexos. 

Um relatório técnico de segurança é elaborado para documentar, analisar e comunicar informações sobre a proteção de sistemas, redes ou aplicações. A estrutura recomendada garante clareza, rastreabilidade e utilidade tanto para profissionais técnicos quanto para gestores. A seguir, uma descrição detalhada dos elementos mais comuns:
1. **Capa:** A capa identifica o relatório, contendo o título, autor(es), data e organização responsável. Serve para formalizar o documento e indicar sua autoria.
2. **Sumário Executivo:** O sumário executivo é um resumo conciso do relatório, geralmente limitado a uma página. Destina-se a apresentar os principais achados, impactos e recomendações de forma rápida e acessível para tomadores de decisão, sem necessidade de leitura detalhada do documento.
3. **Objetivo:** Aqui se descreve o propósito do relatório, explicando o que foi analisado, testado ou documentado. Define a intenção do trabalho e ajuda a contextualizar os resultados.
4. **Escopo:** O escopo delimita o que está incluído e excluído do estudo ou teste. Exemplos: sistemas, redes, aplicações, períodos de análise, tipo de ataques simulados ou segmentos de infraestrutura.
5. **Metodologia:** A metodologia detalha os procedimentos, frameworks e ferramentas utilizados. Exemplos: frameworks de resposta a incidentes como NIST IR, técnicas de ataque simuladas, ferramentas de monitoramento, logs analisados. Permite que outros profissionais reproduzam ou verifiquem o trabalho.
6. **Diagrama / Arquitetura:** Diagramas ou representações visuais do ambiente analisado ajudam a compreender a infraestrutura, relações entre sistemas, fluxos de dados e pontos de vulnerabilidade.  
7. **Execução:** A seção de execução descreve as ações realizadas durante o laboratório ou teste, detalhando passo a passo como os procedimentos planejados foram aplicados. Inclui a sequência de operações, o uso de ferramentas, a realização de ataques simulados, a interação com os sistemas-alvo e a aplicação de medidas de defesa. O objetivo é mostrar de forma clara e objetiva o que foi feito na prática, permitindo que outro profissional compreenda e, se necessário, reproduza o experimento.
8. **Evidências:** A seção de evidências apresenta os materiais que suportam as informações do relatório. Inclui arquivos, prints de tela, logs, resultados de testes, outputs de comandos e qualquer documentação que comprove ou registre o trabalho realizado. O objetivo é fornecer base concreta para a análise e permitir verificação independente.
9. **Análise e Diagnóstico:** Esta seção interpreta e avalia as informações coletadas nas evidências. Deve apresentar uma análise crítica, apontando problemas, falhas ou comportamentos observados, relacionando-os com os objetivos do relatório. O diagnóstico permite tirar conclusões fundamentadas e identificar recomendações ou ajustes necessários.
10. **Resposta a Incidente (NIST IR) (Opcional)**: Se aplicável, esta seção descreve como um incidente seria tratado seguindo um framework formal, como o NIST SP 800-61r2. Organiza as ações em etapas: Detecção, Contenção, Erradicação, Recuperação e Lições Aprendidas. O objetivo é demonstrar a aplicação de boas práticas de resposta a incidentes e a forma estruturada de lidar com problemas identificados.
11. **Recomendações:** Sugestões para corrigir vulnerabilidades e melhorar a segurança, priorizando ações críticas ou de maior impacto. Deve ser prática e aplicável.
12. **Plano de Ação (80/20):** Indica como implementar as recomendações, com ações detalhadas, responsáveis, prazos e prioridades, facilitando a execução e acompanhamento das melhorias.
13. **Conclusão:** Síntese dos resultados do relatório, reforçando o estado final do ambiente, os principais aprendizados e eventuais limitações do estudo.
14. **Anexos:** Materiais complementares, como configurações completas, scripts, logs extensos, outputs detalhados ou qualquer arquivo que comprove as atividades executadas. Garantem rastreabilidade e permitem verificação detalhada.