# Formação Java Developer - Módulo 4   <img src="../0-aux/logo_boot.png" alt="boot_010" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">java   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/java/java-original.svg" alt="java" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_010 (Formação Java Developer)   <img src="../0-aux/logo_boot.png" alt="boot_010" width="auto" height="25"></a>
### Module: 4. Estruturas de Dados e API de Streams em Java 

---

This folder refers to Module 4 **Estruturas de Dados e API de Streams em Java** from bootcamp [**Formação Java Developer**](../).

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
- Others:
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">

---

### Bootcamp Module 4 Structure
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
O objetivo deste módulo do bootcamp foi apresentar as estruturas de dados (pilhas, filas, listas, árvores, collections) da linguagem de programação **Java**, como construí-las implementando seus métodos.

### Structure:
A estrutura das pastas obedeceu a estruturação do bootcamp e conforme foi necessário sub-pastas foram criadas para as atividades específicas deste módulo. Na imagem 01 é exibida a estruturação das pastas deste módulo.

<div align="Center"><figure>
    <img src="../0-aux/md2-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do Bootcamp foi dividido em seis cursos e um desafio de projeto. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item4.1"><h4>4.1 Estruturas de Dados em Java: Introdução</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-17)%20Introdu%C3%A7%C3%A3o%20e%20Laborat%C3%B3rio%20Virtual%20PH%20DIO.pdf">Certificate</a>

O curso iniciou com a explição do conceito de memória e armazenamento, de como as variáveis e objetos, quando atribuídas, são armazenadas na memória do computador. Na primeira atividade do curso, foi mostrado a diferença de atribuição entre tipos primitivos e objetos. Na linguagem **Java**, as atribuições são por cópia de valor sempre, quando é utilizado o tipo primitivo e uma variável é atribuída a outra, a variável não copia a referência na memória, copia apenas o valor da outra variável. Dessa forma, quando essa variável é alterada, a outra variável não modifica seu valor, pois não possui a referência na memória da variável que modificou seu valor. Já em um cenário de objetos, é realizado a cópia da referência na memória de um objeto para outro, sem duplicar o objeto. Logo, o segundo objeto tem seu valor alterado igualmente o primeiro objeto. 

Para melhor entedimento foi criado um projeto, armazenado na pasta [projatribuicao](./04.1-introducao/projatribuicao/), contendo os dois arquivos para execução da atividade. O primeiro arquivo foi a criação da classe principal [Main](04.1-introducao/projatribuicao/src/com/projatribuicao/Main.java), onde foi realizada a execução e o resultado pode ser visualizado na imagem 02 a seguir. Enquanto o outro arquivo foi para criação da classe [MeuObj](./04.1-introducao/projatribuicao/src/com/projatribuicao/MeuObj.java).

<div align="Center"><figure>
    <img src="../0-aux/md4-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

A segunda atividade realizada foi um pequeno projeto, armazenado na pasta [projno](./04.1-introducao/projno/), para explicar o conceito de encadeamento de nó. Dois arquivos foram criados, um com a classe principal [Main](./04.1-introducao/projno/src/com/projno/Main.java) e outro com a classe [No](./04.1-introducao/projno/src/com/projno/No.java). O output do script da classe principal é exbido abaixo (imagem 03).

<div align="Center"><figure>
    <img src="../0-aux/md4-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Para finalizar este curso, foi feito a refatoração da classe [No](./04.1-introducao/projno/src/com/projnogeneric/No.java) e [Main](./04.1-introducao/projno/src/com/projnogeneric/Main.java) da atividade anterior. Mas com o objetivo de não subescrever os arquivos, foi criado um subpacote `projnogeneric` com os mesmos arquivos do subpacote `projno`, ambos no diretório `projno/src/com`. O objetivo foi adaptar as duas classes para utilziação de **Generics**, que é um recurso da linguagem de programação que permite criar classes, interfaces e métodos que podem operar com tipos de dados variados de forma segura e flexível. É uma maneira de parametrizar tipos, permitindo que definir classes ou métodos que possam ser usados com diferentes tipos de dados sem precisar duplicar o código. Para isso, foi utilizado a conveção `<T>` para determinar o tipo de dado.

<a name="item4.2"><h4>4.2 Estruturas de Dados em Java: Pilhas e Filas</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-18)%20Primeiros%20Passos%20com%20o%20Docker%20PH%20DIO.pdf">Certificate</a>

Na primeira etapa desse curso, foram apresentadas as estruturas de dados pilha e filas, e como criá-las. Também foi abordado os conceitos de **LIFO (Last In First Out)** e **FIFO (First In First Out)**. Antes da construção das atividades, foi necessário entender que um objeto, quando criado, possui dois aspectos que são: o seu valor (dado que ele armazena) e sua referência (referência na memória onde o objeto é armazenado). É através da referência na memória que torna-se possível acessar e manipular os objetos. Quando um objeto não possui referência na memória, ele passa a ter um valor especial que indica ausência de valor válido que é o `null`. Já para as variáveis, quando elas são dos tipos primitivos, elas armazenam diretamente o valor do tipo primitivo sem armazenar referências na memória, porém quando elas apontam para um objeto, então passam a possuir referência na memória. Dessa forma, foi possível compreender que um nó que pode ser entendido como um container que armazena o objeto e a referência na memória deste objeto. Esta referência pode ser utilizada para realização do encadeamento de nó, onde a referência de um nó aponta para o próximo nó. Este processo é o que origina as estruturas de dados como pilhas, filas, listas, entre outras. Ao montar uma estrutura de dados, quando não há criação de nenhum nó, ou seja, não há nada armazenado na memória, é utilizado o valor especial `null` como referência da memória inicial até que o primeiro objeto seja criado. Neste curso foi abordado apenas sobre as estruturas de pilhas (vertical) e filas (horizontal).

Para a estrutura de pilha foi construído um projeto para representação do seu funcionamento no diretório [projpilha](./04.2-pilhas_filas/projpilha/), onde foi feito a criação do pacote `com/projpilha`. Neste pacote, foi elaborado três arquivos em **Java** para construção das classes [Main](./04.2-pilhas_filas/projpilha/src/com/projpilha/Main.java), [No](./04.2-pilhas_filas/projpilha/src/com/projpilha/No.java) e [Pilha](./04.2-pilhas_filas/projpilha/src/com/projpilha/Pilha.java). Para sua manipulação quatro métodos principais foram criados (`push`, `pop`, `top` e `isEmpty`). Em uma pilha, a regra atuante é o **LIFO**, ou seja, o último elemento que entra na fila é o primeiro que saí. Neste caso, a referência fica sempre no último nó apontando para o nó imediatamente inferior até chegar no primeiro nó. Toda a manipulação e execução foi realizada na classe principal `Main` e o resultado da manipulação dos métodos de uma pilha é ilustrado na imagem 04.

<div align="Center"><figure>
    <img src="../0-aux/md4-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

A segunda atividade foi referente a estrutura de dados fila, onde foi construído um projeto no diretório [projfila](./04.2-pilhas_filas/projfila/). Neste diretório, dentro da pasta `src` foi criado um pacote `com/projfila` com três arquivos de classes **Java**: [Main](./04.2-pilhas_filas/projfila/src/com/projfila/Main.java), [No](./04.2-pilhas_filas/projfila/src/com/projfila/No.java) e [Fila](./04.2-pilhas_filas/projfila/src/com/projfila/Fila.java). O objetivo foi construir esse tipo de estrutura de dados e manipulá-la com quatro métodos principais (`enqueue`, `dequeue`, `first` e `isEmpty`). Em uma fila, a regra atuante é o **FIFO**, ou seja, o primeiro elemento que entra na fila é o primeiro que saí. Diferentemente de uma pilha, na fila, a referência do nó fica no primeiro elemento que aponta para o nó imediatamente superior até chegar no último nó. As manipulações com os métodos dessa estrutura de dados podem ser visualizados na imagem 05 abaixo.

<div align="Center"><figure>
    <img src="../0-aux/md4-img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

Dando continuidade, foi realizado a refatoração deste último projeto para embutir a criação dos objetos Nó dentro da classe `Fila`. O resultado obtido foi o mesmo do anterior e os arquivos foram construídos no mesmo diretório em outro sub-pacote [projfilaembut](04.2-pilhas_filas/projfila/src/com/projfilaembut/). Em seguida, foi criado um terceiro pacote deste projeto ([projfilageneric](./04.2-pilhas_filas/projfila/src/com/projfilageneric/)) realizando uma segunda refatoração para utilizar o generics, ou seja, ao instanciar os objetos da classe `Fila` no arquivo principal `Main` teve que definir qual tipo de dado seria usado, pois os valores armazenados nos objetos só aceitariam o tipo escolhido. Para esse projeto foi criado um sub-pacote [projfilageneric](04.2-pilhas_filas/projfila/src/com/projfilageneric/) no mesmo diretório [projfila](./04.2-pilhas_filas/projfila/).

<a name="item4.3"><h4>4.3 Estruturas de Dados em Java: Listas</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-18)%20Armazenamento%20de%20Dados%20com%20Docker%20PH%20DIO.pdf">Certificate</a>

Neste curso foi apresentado a estrutura de dados de listas e como construí-las e manipulá-las. As listas são divididas em três tipos: listas encadeadas, listas duplamente encadeadas e listas circulares. Para cada tipo foi construído um pacote para desenvolvimento do projeto, sendo todos os pacotes armazenados no diretório [src/com](./04.3-listas/src/com/). O primeiro pacote criado foi o [projlistencad](./04.3-listas/src/com/projlistaencad/), seguindo a mesma lógica da realização do curso anterior sobre pilhas e filas. Sendo assim, a criação de três classes, uma classe principal [Main](04.3-listas/src/com/projlistaencad/Main.java) para execução do métodos da classe [ListaEncadeada](04.3-listas/src/com/projlistaencad/ListaEncadeada.java), cujo os métodos foram `add`, `get`, `remove`, `size` e `isEmpty`, além do método `toString` utilizado para impressão das informações e de dois métodos auxiliares que foram elaborados, e a última classe [No](./04.3-listas/src/com/projlistaencad/No.java) para criação dos nós na lista e manipulação. O resultado da utilização dos métodos da estrutura de lista encadeada é mostrado na imagem 06.

<div align="Center"><figure>
    <img src="../0-aux/md4-img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

O pacote para criação do projeto de lista duplamente encadeada foi o [projlistadupla](04.3-listas/src/com/projlistadupla/), foram criadas as mesmas três classes do projeto de lista encadeada, alterando a classe `ListaEncadeade` para [ListaDuplamenteEncadeada](./04.3-listas/src/com/projlistadupla/ListaDuplamenteEncadeada.java) e modificando seus métodos. Nesta classe, foram criados os métodos `add`, `add (index)`, `remove`, `get` e `isEmpty`, além dos métodos auxiliares e do método `toString`. Uma lista duplamente encadeada quer dizer que esta possuí dois nós de referência, um vinculado ao nó anterior e outro ao nó posterior. Como ficou um pouco mais complexo, a ilustração gráfica a seguir (imagem 07) exemplifica o funcionamento dos métodos dessa classe. Na classe [No](04.3-listas/src/com/projlistadupla/No.java) foi realizado algumas alterações, já que o nó agora, possuía duas referências. A imagem 08 mostra o resultado da execução dos métodos na classe `Main`.

<div align="Center"><figure>
    <img src="../0-aux/md4-img07.jpg" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md4-img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>

O terceiro pacote foi o [projlistacirc](04.3-listas/src/com/projlistacirc/) para desenvolvimento do projeto de listas circulares. Neste projeto, também foi utilizado as três classes, que neste caso foram a classe principal [Main](04.3-listas/src/com/projlistacirc/Main.java) para execução do métodos da classe [ListaCircular](04.3-listas/src/com/projlistacirc/ListaCircular.java), cujo os métodos foram `add`, `get`, `remove`, `size` e `isEmpty`, além do método `toString` utilizado para impressão das informações e de métodos auxiliares. Já a última classe [No](./04.3-listas/src/com/projlistaencad/No.java) para criação dos nós na estrutura de dados. O resultado da utilização dos métodos da estrutura de lista circular é mostrado na imagem 09.

<div align="Center"><figure>
    <img src="../0-aux/md4-img09.png" alt="img09"><br>
    <figcaption>Imagem 09.</figcaption>
</figure></div><br>



<a name="item4.4"><h4>4.4 Estruturas de Dados em Java: Árvores</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>












<a name="item4.5"><h4>4.5 Estruturas de Dados em Java: Principais Implementações</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>






<a name="item4.6"><h4>4.6 Trabalhando com Collections Java</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>




<a name="item4.7"><h4>4.7 Abstraindo um Bootcamp Usando Orientação a Objetos em Java</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/os/virtualization/docker/(23-08-19)%20Processamento%2C%20Logs%20e%20Rede%20com%20Docker%20PH%20DIO.pdf">Certificate</a>


