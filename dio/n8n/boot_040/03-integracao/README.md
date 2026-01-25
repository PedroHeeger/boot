# Bootcamp Santander 2025 - Automação com N8N - Module 3   <img src="../0-aux/logo_boot.png" alt="boot_040" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">n8n   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/n8n.png" alt="n8n" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_040 (Bootcamp Santander 2025 - Automação com N8N)   <img src="../0-aux/logo_boot.png" alt="boot_040" width="auto" height="25"></a>
### Module: 3. Boas Práticas e Integrações 

#### <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/bootcamps/soft_engineering/n8n/mod/260125_Mod...Praticas...Integracoes_PH_DIO.pdf">Certificate</a>

---

This folder refers to Module 2 **Boas Práticas e Integrações** from bootcamp [**Bootcamp Santander 2025 - Automação com N8N**](../).

### Theme:
- Software Engineering

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11 <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution:
  - Amazon Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/amazon_linux.png" alt="amazon_linux" width="auto" height="25">
  - Ubuntu   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ubuntu/ubuntu-plain.svg" alt="ubuntu" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Containerization: 
  - Docker   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" alt="docker" width="auto" height="25">
  - Docker Compose   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/docker_compose.png" alt="docker_compose" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - VS Code   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Software Engineering:
  - N8N   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/n8n.png" alt="n8n" width="auto" height="25">
  - N8N Cloud   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/n8n.png" alt="n8n_cloud" width="auto" height="25">

---

### Bootcamp Module 3 Structure
3. <a name="item3">Boas Práticas e Integrações</a><br>
  3.1. <a href="#item3.1">Manipulação de Dados e Variáveis no N8N</a><br>
  3.2. <a href="#item3.2">Uso de Webhooks e APIs no N8N</a><br>
  3.3. <a href="#item3.3">Desafio de Código: Associando Conceitos Iniciais do N8N</a><br>

---

### Objective:
O objetivo deste módulo do bootcamp consistiu 

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo das aulas desse módulo.


### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em dois cursos e um desafio de código. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item3.1"><h4>3.1 Manipulação de Dados e Variáveis no N8N</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/soft_engineering/n8n/260125...Dados...Variaveis...N8N_PH_DIO.pdf">Certificate</a>

📊 Variáveis e Modelos de Arquitetura   
A utilização de variáveis é um elemento indispensável para a criação de fluxos de trabalho dinâmicos e personalizados. Estas estruturas permitem que a automação se adapte a diferentes cenários e entradas de dados, garantindo flexibilidade operacional. No contexto de infraestrutura e gestão desses dados, destacam-se dois modelos principais de organização:
- Single Tenant: Refere-se a uma arquitetura onde uma única instância do software e sua infraestrutura atendem exclusivamente a um único cliente ou organização, garantindo isolamento físico dos recursos.
- Multi Tenant: Consiste em um modelo onde múltiplos usuários compartilham a mesma instância do software e os mesmos recursos de hardware, mantendo, no entanto, o isolamento lógico e a privacidade das informações de cada conta.

🔄 Escopo de Variáveis: Locais vs. Globais   
A visibilidade e a persistência dos dados dentro do sistema de automação são determinadas pelo tipo de variável empregada. A distinção entre variáveis locais e globais é fundamental para a organização da lógica e para a segurança da informação:
- Variáveis Locais: Caracterizam-se por possuírem um ciclo de vida restrito a um bloco de processamento específico ou a um único workflow. Nota-se que esses dados não podem ser acessados ou reaproveitados por outros fluxos de trabalho externos, o que garante que a informação permaneça confinada ao contexto onde foi criada.
- Variáveis Globais: São definidas para estarem disponíveis em toda a extensão do ambiente de automação. Diferente das locais, estas variáveis podem ser consultadas e manipuladas a partir de qualquer parte do programa ou por diferentes workflows simultaneamente. Este recurso é amplamente utilizado para armazenar informações que devem ser padronizadas e acessíveis em todo o ecossistema do usuário.

##### Parte Prática




<a name="item3.2"><h4>3.2 Uso de Webhooks e APIs no N8N</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/my_tech_journey/blob/main/credentials/certificates/online_courses/soft_engineering/n8n/260125...Webhooks...APIs...N8N_PH_DIO.pdf">Certificate</a>

🔗 Webhooks e Integrações via API   
O Webhook consiste em uma chamada de API disparada automaticamente a partir de um evento específico. Diferente de consultas manuais, o Webhook opera de forma passiva, aguardando que uma ação ocorra para enviar os dados de forma imediata à plataforma de destino. No ecossistema do n8n, a arquitetura de dados segue um fluxo padrão: a entrada de informações ocorre via Webhook, o processamento é realizado dentro do workflow e a saída de dados é efetuada por meio de chamadas de API externas.

📡 Métodos de Requisição: GET vs. POST   
As interações via HTTP são regidas por métodos que definem a intenção da comunicação entre os sistemas:
- GET: Utilizado estritamente para a recuperação ou obtenção de informações de um servidor. É um método de leitura que não altera o estado dos dados no destino.
- POST: Empregado para o envio de dados ao servidor com o objetivo de criar, registrar ou processar uma nova informação.

🧪 Webhooks de Teste vs. Produção   
O n8n diferencia as instâncias de Webhook para garantir a segurança no desenvolvimento:
- Webhook de Teste: Destinado à fase de construção do fluxo. Ele permanece ativo apenas enquanto o desenvolvedor executa o nó manualmente na interface, sendo ideal para validar a estrutura dos dados recebidos.
- Webhook de Produção: Utilizado quando o fluxo é ativado e publicado. Esta URL está permanentemente disponível e pronta para receber chamadas a qualquer momento, independente da interface estar aberta.

🔐 Protocolos de Autenticação e Segurança   
Para garantir que apenas fontes autorizadas acessem os endpoints, utilizam-se diferentes métodos de autenticação:
- Basic Auth: Requer o envio de um nome de usuário e uma senha codificados no cabeçalho da requisição.
- Bearer Token: Utiliza uma chave de acesso (token) específica que deve ser incluída nas requisições para validar a identidade do remetente.
- OAuth 2.0: Protocolo avançado que utiliza fluxos de autorização complexos, permitindo que aplicações acessem recursos em nome do usuário sem expor credenciais diretas.

🛡️ Resiliência, Segurança e Resposta   
A robustez de uma integração depende da capacidade do sistema em lidar com falhas e restringir acessos indevidos:
- Retry (Reexecução): Mecanismo que realiza novas tentativas de envio caso ocorra uma falha temporária na comunicação.
- Fallback: Plano de contingência executado quando o fluxo principal falha, garantindo que o erro seja tratado ou registrado.
- IP White List (Lista Branca): Técnica de segurança que limita o acesso ao Webhook apenas a endereços de IP específicos e confiáveis.
- Códigos de Resposta: O servidor utiliza códigos numéricos para indicar o status da requisição (ex: 200 para sucesso, 404 para não encontrado, 500 para erro interno).

##### Parte Prática



<div align="Center"><figure>
    <img src="../0-aux/md3-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md3-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md3-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md3-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md3-img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md3-img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>


<a name="item3.3"><h4>3.3 Desafio de Código: Associando Conceitos Iniciais do N8N</h4></a>[Back to summary](#item3) | <a href="">Certificate</a>

Nesta dupla de desafios de código, ambos em linguagem **Python** e armazenados na pasta [3.3-dc_conceitos_n8n](./3.3-dc_conceitos_n8n/), o objetivo consistiu em revisar os conceitos do N8N. Os dois desafios tiveram a proposta idêntica, apenas alterando os conceitos. O objetivo era com base em um conceito enviado em um input retornar o significado na saída. Isso foi realizado utilizando uma função e uma estrutura de condição que retornava o significado. A estrutura de condição possuía quatro condições. Um print imprimia a retorno da função. Os arquivos desses desafios são listados abaixo:
- [primeiros_passos_n8n](./3.3-dc_conceitos_n8n/primeiros_passos_n8n.py)
- [workflow_simples_n8n.py](./3.3-dc_conceitos_n8n/workflow_simples_n8n.py)

Nesta dupla de desafios de código, ambos desenvolvidos em **Python** e armazenados na pasta [3.3-dc_conceitos_n8n](./3.3-dc_conceitos_n8n/), o objetivo foi revisar e consolidar os principais conceitos do **n8n**. Os dois desafios possuíram a mesma proposta, diferenciando-se apenas pelos conceitos abordados. A ideia central consistiu em receber, por meio de um *input*, um conceito específico e retornar, na saída, o seu respectivo significado.

Para isso, foi implementada uma função combinada com uma estrutura condicional contendo quatro condições, responsável por identificar o conceito informado e retornar a definição correspondente. O resultado da função era exibido por meio de um comando `print`. Os arquivos referentes a esses desafios são listados a seguir:
- [primeiros_passos_n8n.py](./3.3-dc_conceitos_n8n/primeiros_passos_n8n.py)
- [workflow_simples_n8n.py](./3.3-dc_conceitos_n8n/workflow_simples_n8n.py)