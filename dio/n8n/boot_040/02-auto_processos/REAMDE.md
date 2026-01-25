# Bootcamp Santander 2025 - Automação com N8N - Module 2   <img src="../0-aux/logo_boot.png" alt="boot_040" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">n8n   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/n8n.png" alt="n8n" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_040 (Bootcamp Santander 2025 - Automação com N8N)   <img src="../0-aux/logo_boot.png" alt="boot_040" width="auto" height="25"></a>
### Module: 2. Automatização de Processos 

#### <a href="">Certificate</a>

---

This folder refers to Module 2 **Automatização de Processos** from bootcamp [**Bootcamp Santander 2025 - Automação com N8N**](../).

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

### Bootcamp Module 2 Structure
2. <a name="item2">Automatização de Processos</a><br>
  2.1. <a href="#item2.1">Utilizando Nós Padrão do N8N</a><br>
  2.2. <a href="#item2.2">Integração com Serviços Populares no N8N</a><br>
  2.3. <a href="#item2.3">Automatizando Processos com N8N</a><br>

---

### Objective:
O objetivo deste módulo do bootcamp consistiu 

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo das aulas desse módulo.


### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em três cursos. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.


<a name="item2.1"><h4>2.1 Utilizando Nós Padrão do N8N</h4></a>[Back to summary](#item2) | <a href="">Certificate</a>

🏗️ Arquitetura e Classificação de Workflows   
A estrutura fundamental de um fluxo de trabalho no n8n é constituída por uma sequência lógica de componentes denominados "nodes standard". Esta arquitetura divide-se em três estágios essenciais: o ponto de partida (trigger), as etapas de tratamento de informações (data/processing) e a execução final da tarefa (action).

🚀 Nós de Iniciação (Trigger)   
O estágio inicial de um fluxo é definido pelo nó de gatilho, sendo o Webhook um dos exemplos mais comuns para esta função de inicialização. Diferente de outros componentes do sistema, um nó de Webhook configurado como trigger não apresenta entrada (input), uma vez que ele próprio atua como a porta de entrada primária de dados para a automação. Sua função principal é recepcionar requisições externas para disparar a lógica subsequente do workflow.

⚙️ Nós de Processamento e Manipulação (Data)   
Esta categoria engloba ferramentas voltadas para a busca, filtragem ou modificação de informações antes da execução de uma tarefa final.
- HTTP Request: Este componente possui natureza híbrida. Quando operado no modo GET, é classificado como um nó de processamento, sendo utilizado para buscar dados em APIs ou serviços externos.
- Edit Field: Destinado à criação ou alteração de campos específicos dentro da carga de dados que transita pelo fluxo.
- If: Implementa uma lógica de desvio condicional simples, permitindo que o fluxo siga caminhos distintos baseados em critérios de verdadeiro ou falso.
- Switch: Utilizado para a criação de múltiplas ramificações lógicas, roteando as informações para diferentes saídas conforme regras pré-estabelecidas.

✅ Nós de Ação (Action)   
Os nós de ação representam a entrega do resultado ou a interação final com um serviço de destino após o processamento das informações.
- HTTP Request (Modo POST): Nesta configuração, o componente é considerado um nó de ação, pois é utilizado para enviar dados processados para servidores externos.
- Append Row in Sheet: Executa a tarefa de inserir novos registros ou linhas em uma planilha digital (como Google Sheets).
- Send Email: Realiza o disparo de mensagens eletrônicas para destinatários específicos como conclusão de um processo.

##### Parte Prática

2
- Node de Início:
  - Webhook:
    - Test URL
    - HTTP Method: POST
    - Path: nova_transacao
    - Authentication: None
    - Respond: Immediately

  - Acessar site reqbin (reqbin.com/post-online)
    - Name: URL
    - Body: {"moeda":"BRL"}


- Node de Processamento: 
  - HTTP Request:
    - Method: GET
    - URL: 

3
- Usar o AwesomeAPI (API de Cotações) -> https://docs.awesomeapi.com.br/api-de-moedas
- Webhook -> Região: Tecnologia (Vermelho) -> Monitora par-moedas
- HTTP Request -> Financeiro (Verde) -> Consultar cotação do par-moeda
  - URL: URL da API (https://economia.awesomeapi.com.br/json/last/USD-BRL)
  - URL: URL da API (https://economia.awesomeapi.com.br/json/last/{{$json.body['par-moeda']}})
  -

  - Acessar site reqbin (reqbin.com/post-online)
    - Name: URL
    - Body: {"par-moeda":"USD-BRL"}

4
- Node de Processamento:
  - Edit Fields: Conversão Dolar x Real
    - Mode: Manual Mapping
    - Fields to Set
      - valor_convertido (Number): U$DBRL.bid.toNumber().toFixed(2)
  - If: Dolar acima de R$ 5.25
    - Mode: Manual Mapping
    - valor_convertido >= 5.25
  - Switch: Cotação do Dólar (Saúde - Roxo) 
    - valor_convertido > 5.95: Não comprar
    - valor_convertido <= 5.95: Comprar pouco
    - valor_convertido <= 4.60: Comprar muito

6:
- Node de Ação para Não Comprar: Salva cotação na planilha
  - Google Sheets -> Append row in sheet:
    - Google Sheets Hugo
    - Sheet Within Document
    - Append Row
    - From list: Cotação Dólar
    - From list: Compra
    - Mapping Column Mode: Map Each Column Manually
      - Data-Hora: Expression -> {{$now.format{'dd/MM/yyyy HH:mm'}}}
      - Cotação: valor_convertido


- Criar uma planilha no Google Sheets:
  - Colunas: Data-Hora e Cotação (Negrito)
  - Aba: Compra

- Node de Ação para Comprar: Envia email de cotação
  - Send email:
    - From email: email
    - To email: email
    - Subject: Cotação Dólar
    - HTML: 
      Olá! O dólar está abaixo de R$ 5,95. 
      <br><br>Cotação Atual: R$ <strong>valor_convertido.toString().replace('.',',')</strong>
      <br><br>Compre Bastante!

7:
- Indústria (Cinza) em cima de Financeiro:
  - Tratamento de Erro, caso o JSON venha: {"par-moeda":"USD-XPTO"}

8: Automação 2 (Processo Seletivo):
- Planilha no Google Sheet:
  - Nome: Processo Seletivo
  - Aba: Candidatos:
  - Colunas: Email, Nome, Anos Experiência, Grau Escolaridade (Negrito)
  - Linhas de Dados: 5

- Trigger:
  - Schedule Trigger: Dispara no dia 14/10/25 as 9 Horas
    - Months
    - Months Between Triggers: 1
    - Trigger at Day of Month: 14
    - Trigger at Hour: 9am
    - Trigger at Minute: 0

- Process: Obtém Candidatos
  - Get row(s) in sheet:
    - Google Sheets Hugo
    - Sheet Within Document
    - Get Row(s)
    - From list: Processo Seletivo
    - Form list: Candidatos

- Process: 
  - If: Candidato Aprovado?
    - Anos Experiencia > 5
    - AND
    - Grau Escolaridade = Superior

- Action: 
  - Aprovados -> Loop Over Items: Para cada candidato
    - Batch Size: 1
    - Loop -> Send email: Envia email de aprovação
      - From Email: email
      - To Email: json.email
      - Html:
        Olá, json.Nome.split(' ')[0], tudo bem?
        Passando aqui para informar que você foi aprovado para a próxima fase do processo seletivo.
        Parabéns!
    - Wait: Aguardar 5s: -> Loop Over Items
      - Resume: After Time Interval
      - Wait Amount: 5,00
      - Wait Unit: Seconds

  - Reprovados -> Aggregate: Gera array de nomes 
    - Aggregate: Individual Fields
    - Fields To Aggregate: 
      - Input Field Name: Nome
    - Send email: Envia lista de candidatos reprovados
      - Credential to connect with: SMTP Autotic
      - From Email: email
      - To Email: json.email
      - Subject: Candidatos Reprovados
      - Email Format: Text
      - Html:
        Olá, colaborador Hugo! Segue a relação dos candidatos reprovados no processo seletivo
        json.Nome.join('\n')
        Atenciosamente,
        Equipe Autotic


<a name="item2.2"><h4>2.2 Integração com Serviços Populares no N8N</h4></a>[Back to summary](#item2) | <a href="">Certificate</a>














##### Parte Prática

3:
- Google Sheets -> Get row(s) in sheet:
  - Credential to connect with -> Create new credential:
    - Name: Google Sheets Hugo
    - Connection:
      - Connect Using: OAuth2 (recommend):
        - Client ID:
        - Client Secret: 

- Usar a Conta do Google para acessar o GCP e criar um projeto vazio.
  - Google Console:
    - APIs e serviços -> Tela de permissão OAuth:
      - Configurar o OAuth.
    - APIs e serviços -> Credenciais:
      - Criar credenciais -> ID do cliente OAuth
        - Tipo de aplicativo: Aplicativo da Web
        - Nome: dio_boot_040
        - URLs de redirecionamento autorizados: colocar a URL de callback gerada pelo N8N -> Criar
        - Copiar Client ID e Secret e usar no N8N
        - Fazer o Sign in com Google.
    - Ativar a API do Google Sheets e do Google Drive no Google Console

4:
- Telegram -> Send a text message
  - Credential to connect with -> Create new credential:
    - Name: Telegram account Autotic
    - Access Token:
    - Base URL: 

- No telegram procurar pelo contato BotFather e iniciar a conversa:
  - /newbot
   - Name: DIO Bot
   - Username: dio_boot_040_bot
   - Pegar o o Access Token e colar na credential
  - Criar um canal e adicionar o bot ao canal tornando-o admin.

5:
- WhatsApp: Acessar uzapi.com.br
  - Passar Nome, Email e Whatsapp.
  - Vai receber o token para acesso a API.
  - Configuração:
    - Endpoint:
    - Session: hugo
    - Session key: hugo
    - Token: 

- HTTP Request:
  - import cURL e pegar da documentação do UZAPI

6:



<div align="Center"><figure>
    <img src="../0-aux/md2-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>



<a name="item2.3"><h4>2.3 Automatizando Processos com N8N</h4></a>[Back to summary](#item2) | <a href="">Certificate</a>






<div align="Center"><figure>
    <img src="../0-aux/md2-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md2-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md2-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md2-img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md2-img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>