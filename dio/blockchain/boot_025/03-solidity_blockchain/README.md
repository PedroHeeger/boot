# Formação Blockchain Specialist - Module 3   <img src="../0-aux/logo_boot.png" alt="boot_025" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">blockchain   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/blockchain.jpg" alt="blockchain" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_025 (Formação Blockchain Specialist)   <img src="./0-aux/logo_boot.png" alt="boot_025" width="auto" height="25"></a>
### Module: 3. Desenvolvimento com Solidity para Blockchain 

---

This folder refers to Module 3 **Desenvolvimento com Solidity para Blockchain** from bootcamp [**Formação Blockchain Specialist**](../).

### Theme:
- Blockchain

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - AWS   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - JavaScript   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" alt="javascript" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
  - Solidity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/solidity.svg" alt="solidity" width="auto" height="25">
- Runtime Environment:
  - Ethereum Virtual Machine (EVM)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/evm.png" alt="evm" width="auto" height="25">
  - Node.js   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original.svg" alt="nodejs" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

### Bootcamp Module 3 Structure
3. <a name="item1">Desenvolvimento com Solidity para Blockchain</a><br>
  3.1. <a href="#item3.1">Introdução à Linguagem Solidity para Blockchain</a><br>
  3.2. <a href="#item3.2">Desenvolvimento de Smart Contracts para Blockchain</a><br>
  3.3. <a href="#item3.3">Desafio de Projeto: Criando a Sua Primeira Criptomoeda da Rede Ethereum</a><br>
  3.4. <a href="#item3.4">O Mercado de Blockchain e Criptomoedas</a><br>
  3.5. <a href="#item3.5">Desafio de Projeto: Crie o seu NFT de Pokémon com Blockchain</a><br>
  3.6. <a href="#item3.6">Desafio de código: Desafios intermediários Javascript III - Formação Blockchain</a><br>
  3.4. Materiais Complementares - Crypto com Blockchain<br>

---

### Objective:
O objetivo deste módulo do bootcamp foi introduzir conceitos fundamentais para melhor compreensão da Inteligência Articial. Conceitos como IA Geral, IA Restrita, Machine Learning (Aprendizado Profundo), Deep Learning, Redes Neurais, IAs Generativas, Processamento de Linguagem Natural, foram abordados. Também foi detalhado minuciosamente como são divididas as redes neurais e que a partir delas surgem as IAs Generativas.

### Structure:
A estrutura das pastas obedeceu a estruturação do bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibido a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md1-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em três cursos, dois desafios de projeto e um desafio de código. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item3.1"><h4>3.1 Introdução à Linguagem Solidity para Blockchain</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-09)_AWS_Official_Content-Introducao...AWS_PH_DIO.pdf">Certificate</a>






instalar o Ganache CLI
  - precisa do node.js e o npm

instalar o truffle
  - criar a pasta: mkdir solidity-truffle-test
    - entrar na pasta e dar o truffle init
    - abrir com vs code e criar os dois arquivos da pasta (contracts)
    - executar o comando `ganache` para verificar a porta utilizada pelo Ganache.
    - ir no arquivo truffle-config.js e descomentar a parte que tem host, porta e network_id
    - alterar a porta para a indicada.
    - executar o truffle migrate no terminal

instalar o hardhat
  - criar uma pasta para ele: mkdir HardHatTest
    - executar o comando npx hardhat e criar o projeto JS
      - indicar a raiz do projeto, no caso essa pasta
      - não criar o .gitignore
      - instalar as dependências necessárias pelo comando fornecido
      - abrir com o vs code
      - executar o comando `npx hardhat compile` para compilar o contrato
      - executar o comando `npx hardhat test` para testar o contrato
      - executar o comando `npx hardhat run scripts/deploy.js` para implantar o contrato.
      - executar o comando `npx hardhat node`
      - executar o comando `npx hardhat run scripts/deploy.js --network localhost`





criar um smart contract utilizando a linguagem Solidity
  - criar um contrato de votação, onde teremos uma lista de candidatos, funções para registrar e consultar votos.
  - Para criar o nosso contrato, vamos acessar a IDE Remix online
  - Testar as funções do contrato


criar uma carteira MetaMask
 - adicionar a extensão no chrome
 - criar uma carteira nova
  - criar uma senha
  - guardar a frase de recuperação (seed)
  - confirmar a chave

- abrir o ganache
  - criar uma nova workspace; ProjectWorkspace
  - pegar a chave privada da primeira conta do ganache e salvar
  - importar a conta no metamask informando a chave privada
  - configurar a network na MetaMask
    - Name: DIO
    - New RPC URL: Copiar do Ganache
    - Chain ID: 1337
    - Currency Simbol: DIO

conectar o metamesk ao remix
  - criar um novo arquivo Solidity no Remix (HelloContract.sol)
  - alterar o environment para o MetaMask e a conta que adiconamos lá
  - fazer o deploy e executar o contrato
  - confirmar a transação pelo MetaMask
  - analisar as transações no ganache

começar a trabalha com o web3.js
  - Executar o comando npm install web3 --save para instalar a lib
  - acessar o node com o comando node
  - executar o comando: const Web3 = require('web3')
  - executar o comando: const web3 = new Web3('http://127.0.0.1:7545')







<a name="item3.2"><h4>3.2 Desenvolvimento de Smart Contracts para Blockchain</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-09)_AWS_Official_Content-Introducao...AWS_PH_DIO.pdf">Certificate</a>



















<a name="item3.3"><h4>3.3 Desafio de Projeto: Criando a Sua Primeira Criptomoeda da Rede Ethereum</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Introducao...Conceito...Cloud_PH_DIO.pdf">Certificate</a>














<div align="Center"><figure>
    <img src="../0-aux/md1-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>


<a name="item3.4"><h4>3.4 O Mercado de Blockchain e Criptomoedas</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Introducao...Conceito...Cloud_PH_DIO.pdf">Certificate</a>
























<a name="item3.5"><h4>3.5 Desafio de Projeto: Crie o seu NFT de Pokémon com Blockchain</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Introducao...Conceito...Cloud_PH_DIO.pdf">Certificate</a>



















<a name="item3.6"><h4>3.6 Desafio de código: Desafios intermediários Javascript III - Formação Blockchain</h4></a>[Back to summary](#item2) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Introducao...Conceito...Cloud_PH_DIO.pdf">Certificate</a>

Neste trio de desafios de código, o desafio inicial, de nome [tempo_dobby.js](./06-dc/tempo_dobby.js), foi verificar se a soma do tempo para confecção de dois presentes era maior ou menor que o tempo restante para o fim do expediente. Caso fosse maior, a confecção do presente era deixado para o dia seguinte. Qualquer outro resultado, os presentes eram confeccionados no dia corrente.

No segundo desafio, intitulado [conversao_tempo.js](./06-dc/conversao_tempo.js), o objetivo foi a partir de uma entrada que representava em segundos, converter esse valor em um formato de horas, minutos e segundos, e posteriormente imprimí-lo. O cálculo das horas foi realizado dividindo o número de entrada por 3600. O cálculo dos minutos foi desenvolvido transformando o valor obtido de horas em segundos, subtraindo do total e dividindo por 60 para converter o valor para minutos. Já os segundos foi calculado subtraindo do total, o valor de minutos transformando para segundos ao multiplicar por 60, e o valor de horas transformando para segundos ao multiplicar por 3600.

O último desafio dessa trinca de desafios foi nomeado de [cavalos_carruagens.js](./06-dc/cavalos_carruagens.js) e seu propósito foi determinar quais veículos poderiam circular em determinados dias da semana a partir do último dígito da placa. A entrada de dados consistiu em um número representando a quantidade de testes que seriam feitos e a outra entrada foi uma cadeia de caracteres representando várias placas para verificação. Essa cadeia foi percorrida com base no número que representava a quantidade de testes. Em seguida, cada placa era obtida e através de uma expressão Regex era verificada se era uma placa válida. Sendo válida, o dígito final era obtido e com ele era determinado o dia que essa placa poderia circular. O processo de loop continuava até que todas as placas fossem verificadas, se não fosse uma placa válida, uma mensagem de falha era exibida.