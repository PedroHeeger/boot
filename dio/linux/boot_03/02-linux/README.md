# Linux do Zero - Módulo 2   <img src="../0-aux/logo_boot.png" alt="boot_03" width="auto" height="45">

### Repository: [course](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_03 (Linux do Zero)   <img src="../0-aux/logo_boot.png" alt="boot_03" width="auto" height="25"></a>
### Module: 2. Primeiros Passos com o Sistema Operacional Linux

---

This folder refers to Module 2 **Primeiros Passos com o Sistema Operacional Linux** from Bootcamp **Linux do Zero**.

### Theme:
- Operating System (OS)

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
- Linux Distribution: 
  - Ubuntu <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg" alt="ubuntu" width="auto" height="25">
- Environment: 
  - VM VirtualBox <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/vm_virtualbox.png" alt="vm_virtualbox" width="auto" height="25">
  - AWS <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original.svg" alt="aws" width="auto" height="25">
  - WSL <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/wsl.svg" alt="wsl" width="auto" height="25">
- Cloud:
  - Amazon EC2   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/aws_ec2.png" alt="amazon_ec2" width="auto" height="25">
- Integrated Development Environment (IDE):
  - VS Code   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Command Line Interpreter (CLI):
  - cmd <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/cmd_prompt.png" alt="cmd" width="auto" height="25">
  - bash <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="bash" width="auto" height="25">
- Others:
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" width="auto" height="25">
  - PuTTY <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/putty/putty-original.svg" alt="putty" width="auto" height="25">
  - PuTTYgen <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/puttygen.png" alt="puttygen" width="auto" height="25">
  - OpenSSH <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/openssh.png" alt="openssh" width="auto" height="25">
  - Draw.io <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/sites/draw.io.png" alt="draw.io" width="auto" height="25">

---

### Bootcamp Module 2 Structure
2. <a name="item2">Primeiros Passos com o Sistema Operacional Linux</a><br> 
  2.1. <a href="#item2.1">Introdução ao Sistema Operacional Linux</a><br>
  2.2. <a href="#item2.2">Instalando o Linux</a><br>
  2.3. <a href="#item2.3">Acesso Remoto a Máquinas Linux</a><br>
  2.4. <a href="#item2.4">Manipulando Arquivos no Linux</a><br>
  2.5. <a href="#item2.5">Gerenciando Usuários no Linux</a><br>
  2.6. <a href="#item2.6">Gerenciamento de Pacotes Linux</a><br>
  2.7. <a href="#item2.7">Gerenciamento de Discos Linux</a><br>
  2.8. <a href="#item2.8">Copiando Arquivos e Manipulando Processos</a><br>
  2.9. <a href="#item2.9">Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões</a><br>

---

### Objective:
- O objetivo deste módulo do Bootcamp é dar os primeiros passos com o sistema operacional Linux.

### Structure:
- A estrutura das pastas obedece a estruturação do Bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibido a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/img01.PNG" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do Bootcamp foi dividido em oito cursos e um desafio de projeto. Abaixo é explicado o que foi desenvolvido em cada um desses cursos.

  <a name="item2.1"><h4>2.1 Introdução ao Sistema Operacional Linux:</h4></a>[Back to summary](#item2)

  Apenas aulas teóricas sobre introdução ao sistema operacional Linux e maquinas virtuais.
  
  <a name="item2.2"><h4>2.2 Instalando o Linux</h4></a>[Back to summary](#item2)

  Neste curso foi realizado a instalação do sistema operacional Linux em três ambientes diferentes, sendo que em todos eles foi instalado a distribuição **Ubuntu**. O primeiro ambiente utilizado foi o software **VM Virtual Box**, onde através de uma imagem ISO do Ubuntu foi instanciado uma maquina virtual Linux voltada para servidor. Nesta maquina foi realizado uma configuração do adaptador de rede para que posteriormente fosse possível realizar o acesso remoto. O segundo ambiente foi na Cloud da **AWS**, através do serviço **Amazon EC2** foi instanciado uma maquina virtual do Linux Ubuntu. Já o terceiro ambiente foi através do **WSL**, que é um subsistema do Windows para Linux. Este último não foi realizado o processo de instalação, pois o mesmo já existe na maquina física e é o que é utilizado no dia a dia.

  Para o funcionamento do **VM Virtual Box** foi necessário desabilitar o recurso **hypervisorlaunchtype** através do Prompt de Comando do Windows (**cmd**). Já para o **WSL** foi necessário abilitar este recurso além de outros recursos como: **Plataforma de Maquina Virtual**, **Plataforma de Hipervisor do Windows** e **Subsistema do Windows para Linux**.

  <a name="item2.3"><h4>2.3 Acesso Remoto a Máquinas Linux</h4></a>[Back to summary](#item2)

  Neste curso foi realizado o acesso remoto da maquina virtual (Linux Ubuntu) pela maquina física (Linux e Windows) em diferentes ambientes (Virtual Box, Cloud AWS, WSL) através do protocolo de rede **SSH**. No Windows foi necessário baixar e instalar o software **PuTTY** e **PuTTYgen** para criar esse tipo de conexão. Já no Linux foi necessário apenas instalar o **openSSH** no shell. Em ambos os casos foi necessário descobrir o IP da maquina virtual para realizar o acesso remoto.
       
  Foi realizado o acesso remoto tanto de uma maquina física Linux (no caso, utilizei o WSL) na maquina virtual Linux em um ambiente de Cloud na AWS (Linux dentro de um Windows para Linux na Cloud), e também de uma maquina física Windows na maquina virtual Linux para os ambientes de Cloud na AWS e através do software de maquina virtual, o VM Virtual Box (Windows para Linux). O diagrama da imagem 02 a seguir, desenvolvido no site **Draw.io**, ilustra o desenvolvimento.

  <div align="Center"><figure>
    <img src="../0-aux/md2_img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
    </figure></div><br>
       
  No ambiente de Cloud, ao criar a instância da maquina virtual Ubuntu no serviço Amazon EC2 foi necessário criar um arquivo de credencial no formato **.pem** para que fosse utilizado no Linux. Já no Windows, precisou do software **PuTTYgen** para abrir este arquivo e salvá-lo como formato **.ppk**, sendo possível criar uma senha para acesso.

  <a name="item2.4"><h4>2.4 Manipulando Arquivos no Linux</h4></a>[Back to summary](#item2)

  Neste curso foi realizado os procedimentos básicos de manipulação de arquivos no sistema Linux utilizando a maquina virtual Linux Ubuntu criada no **VM Virtual Box**. Dentre os procedimentos foram feitos: navegação no sistema de arquivo (`cd` e `pwd`), filtragem e exibição de arquivos (`ls`), localização de arquivos (`find`), criação e exclusão de diretórios (`mkdir` e `rmdir`), criação de arquivos vazios (`touch`), utilização dos comandos de ajuda (`help` e `man`), execução de tarefas administrativas como root (`sudo`), acesso como usuário root (`su`), acesso remoto no Linux como usuário root pelo Windows através do **PuTTY**, exibição do conteúdo de um arquivo (`cat`), utilização de editores de textos (`vi` e `nano`), exibição do histórico de últimos comandos do usuário (`history`), localização de informação (`grep`), entre outros comandos básicos. Os comandos foram executados no interpretador de linha de comando (CLI) do Linux **Ubuntu** (**bash**) via acesso remoto pelo **PuTTY**.

  O acesso remoto como usuário root precisou realizar uma alteração no arquivo do Linux `/etc/ssh/sshd_config` modificando a linha `#PermitRootLogin prohibit-password` retirando o comentário e trocando o **prohibit-password** para **yes**. Em seguida, foi necessário reiniciar o serviço através do comando `systemctl restart sshd` para que a alteração fosse concretizada. Após isso, o procedimento foi o mesmo realizado com usuário criado através do **PuTTY**, a diferença foi trocar as credenciais de acesso para a do usuário root.

  <a name="item2.5"><h4>2.5 Gerenciando Usuários no Linux</h4></a>[Back to summary](#item2)

  TODO