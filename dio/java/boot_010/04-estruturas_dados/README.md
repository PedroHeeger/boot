# Formação Java Developer - Módulo 4   <img src="../0-aux/logo_boot.png" alt="boot_010" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">java   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" alt="java" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_010 (Formação Java Developer)   <img src="../0-aux/logo_boot.png" alt="boot_010" width="auto" height="25"></a>
### Module: 4. Estruturas de Dados e API de Streams em Java 

---

This folder refers to Module 4 **Estruturas de Dados e API de Streams em Java** from Bootcamp [**Formação Java Developer**](../).

### Theme:
- Programming

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11 <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution: 
  - Ubuntu <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg" alt="ubuntu" width="auto" height="25">
- Virtualization: 
  - VM VirtualBox <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/vm_virtualbox.png" alt="vm_virtualbox" width="auto" height="25">
  - Docker <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="docker" width="auto" height="25">
- Language:
  - Java <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" alt="java" width="auto" height="25"></a>>
- Integrated Development Environment (IDE):
  - VS Code   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Command Line Interpreter (CLI):
  - Bash <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" alt="bash" width="auto" height="25">
  - ZShell <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/zshell.png" alt="zshell" width="auto" height="25">
  - Oh My ZShell <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/oh_my_zshell.png" alt="oh_my_zshell" width="auto" height="25">
- Linux Tools:
  - Nano <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/nano.png" alt="nano" width="auto" height="25">
- Others:
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">

---

### Bootcamp Module 1 Structure
4. <a name="item4">Estruturas de Dados e API de Streams em Java</a><br>
  4.1. <a href="#item4.1">Estruturas de Dados em Java: Introdução</a><br>
  4.2. <a href="#item4.2">Estruturas de Dados em Java: Pilhas e Filas</a><br>
  4.3. <a href="#item4.3">Estruturas de Dados em Java: Listas</a><br>
  4.4. <a href="#item4.4">Estruturas de Dados em Java: Árvores</a><br>
  4.5. <a href="#item4.5">Estruturas de Dados em Java: Principais Implementações</a><br>
  4.6. <a href="#item4.6">Trabalhando com Collections Java</a><br>
  4.7. <a href="#item4.7">Abstraindo um Bootcamp Usando Orientação a Objetos em Java</a><br>
  4.8. Materiais Complementares - Programação orientada a objetos em Java  

---

### Objective:
O objetivo deste módulo do Bootcamp foi apresentar as estruturas de controle (condicionais, iterações e excepcionais) de fluxo da linguagem de programação **Java** e como utilizá-las.

### Structure:
A estrutura das pastas obedeceu a estruturação do Bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibida a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md2-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do Bootcamp foi dividido em 6 cursos e um desafio de projeto. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item4.1"><h4>4.1 Estruturas de Dados em Java: Introdução</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-17)%20Introdu%C3%A7%C3%A3o%20e%20Laborat%C3%B3rio%20Virtual%20PH%20DIO.pdf">Certificate</a>

O curso iniciou coma explição do conceito de memória e armazenamento, de como as variáveis e objetos, quando atribuídas, são armazenadas na memória do computador. Na primeira atividade do curso, foi mostrado a diferença de atribuição entre tipos primitivos e objetos. Na linguagem **Java** quando é utilizado o tipo primitivo, ou seja, usando apenas variáveis, o **Java** não copia a referência, copia exatamente o valor na memória de uma variável para outra, dessa forma, quando essa variável é alterada, a outra variável continua com o valor anterior a modificação. Já em um cenário de objetos, o **Java** consegue copiar a referência de um objeto para outro, logo, o segundo objeto tem seu valor alterado igualmente o primeiro objeto. Para melhor entedimento foi criado um projeto, armazenado na pasta [projatribuicao](./04.1-introducao/projatribuicao/), contendo os dois arquivos para execução da atividade. O primeiro arquivo foi a criação da classe principal [Main](04.1-introducao/projatribuicao/src/com/projatribuicao/Main.java), onde foi realizada a execução e o resultado pode ser visualizado na imagem 02 a seguir. Enquanto o outro arquivo foi para criação da classe [MeuObj](./04.1-introducao/projatribuicao/src/com/projatribuicao/MeuObj.java).

<div align="Center"><figure>
    <img src="../0-aux/md2-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

A segunda atividade realizada foi um pequeno projeto, armazenado na pasta [projno](./04.1-introducao/projno/), para explicar o conceito de encadeamento de nó. Dois arquivos foram criados, um com a classe principal [Main](./04.1-introducao/projno/src/com/projno/Main.java) e outro com a classe [No](./04.1-introducao/projno/src/com/projno/No.java). O output do script da classe principal é exbido abaixo (imagem 03).

<div align="Center"><figure>
    <img src="../0-aux/md2-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Para finalizar este curso, foi feito a refatoração da classe [No](04.1-introducao/projno/src/com/projnogeneric/No.java) e [Main](04.1-introducao/projno/src/com/projnogeneric/Main.java) da atividade anterior. Mas com o objetivo de não subescrever os arquivos, foi criado um subpacote `projnogeneric` com os mesmos arquivos do subpacote `projno`, ambos no diretório `projno/src/com`. O objetivo foi adaptar as duas classes para utilziação de **Generics**, que é um recurso da linguagem de programação que permite criar classes, interfaces e métodos que podem operar com tipos de dados variados de forma segura e flexível. É uma maneira de parametrizar tipos, permitindo que definir classes ou métodos que possam ser usados com diferentes tipos de dados sem precisar duplicar o código. Para isso, foi utilizado a conveção `<T>` para determinar o tipo de dado.

<a name="item4.2"><h4>4.2 Estruturas de Dados em Java: Pilhas e Filas</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-18)%20Primeiros%20Passos%20com%20o%20Docker%20PH%20DIO.pdf">Certificate</a>

Na primeira etapa desse curso, foram apresentadas as estruturas de dados pilha e filas, e como criá-las. Também foi abordado os conceitos de **LIFO** e **FIFO**. Para a estrutura de pilha foi construído um projeto para representação no diretório `projpilha`, onde foi feito a criação do pacote `com/projpilha`. Neste pacote, foi elaborado três arquivos em **Java** para construção das classes [Main](04.2-pilhas/projpilha/src/com/projpilha/Main.java), [No](04.2-pilhas/projpilha/src/com/projpilha/No.java) e [Pilha](./04.2-pilhas/projpilha/src/com/projpilha/Pilha.java). O objetivo foi construir esse tipo de estrutura de dados e manipulá-los com quatro métodos principais (`push`, `pop`, `top` e `isEmpty`). Toda a manipulação e execução foi realizada na classe principal `Main` e o resultado é ilustrado na imagem 04.

<div align="Center"><figure>
    <img src="../0-aux/md2-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>





<a name="item4.3"><h4>4.3 Estruturas de Dados em Java: Listas</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-18)%20Armazenamento%20de%20Dados%20com%20Docker%20PH%20DIO.pdf">Certificate</a>





<a name="item4.4"><h4>4.4 Estruturas de Dados em Java: Árvores</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>








<div align="Center"><figure>
    <img src="../0-aux/md2-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>




<a name="item4.5"><h4>4.5 Estruturas de Dados em Java: Principais Implementações</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>






<a name="item4.6"><h4>4.6 Trabalhando com Collections Java</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>




<a name="item4.7"><h4>4.7 Abstraindo um Bootcamp Usando Orientação a Objetos em Java</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>


<div align="Center"><figure>
    <img src="../0-aux/md2-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>