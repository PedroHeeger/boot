# Formação Cybersecurity Specialist - Module 3   <img src="../0-aux/logo_boot.png" alt="boot_036" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_036 (Formação Cybersecurity Specialist)   <img src="../0-aux/logo_boot.png" alt="boot_036" width="auto" height="25"></a>
### Module: 3. Testes de Invasão e Busca Por Vulnerabilidades 

---

This folder refers to Module 3 **Testes de Invasão e Busca Por Vulnerabilidades** from bootcamp [**Formação Cybersecurity Specialist**](../).

### Theme:
- Cybersecurity

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
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

### Bootcamp Module 3 Structure
3. <a name="item3">Testes de Invasão e Busca Por Vulnerabilidades</a><br>
  3.1. <a href="#item3.1">Fundamentos de Testes de Invasão (Pentest)</a><br>
  3.2. <a href="#item3.2">Introdução à Coleta e Análise de Segurança Cibernética</a><br>
  3.3. <a href="#item3.3">Tópicos em Engenharia Social</a><br>
  3.4. <a href="#item3.4">Conceitos e Técnicas de Varredura de Rede</a><br>
  3.5. <a href="#item3.5">Princípios de Enumeração e Exploração de Vulnerabilidades</a><br>
  3.6. <a href="#item3.6">Desafio de projeto: Criação de um Phishing com o Kali Linux</a><br>
  3.5. Materiais Complementares: Fundamentos de Cibersegurança<br>

- Usar o OSINT Framework na Web
- Usar o Google Hacking na Web
- Usar o Exploit-db
- Usar o Maltego no PC
- Usar o FOCA no PC

- 3.4
  - Criar uma VM do Metasploit
  - Fazer varredura e enumeração com Nmap no Kali no Metasploit
- 3.5
  - Fazer enumeração com Nmap no Kali no Metasploit

---

### Objective:
O objetivo deste módulo do bootcamp foi introduzir conceitos fundamentais para melhor compreensão da Inteligência Articial. Conceitos como IA Geral, IA Restrita, Machine Learning (Aprendizado Profundo), Deep Learning, Redes Neurais, IAs Generativas, Processamento de Linguagem Natural, foram abordados. Também foi detalhado minuciosamente como são divididas as redes neurais e que a partir delas surgem as IAs Generativas.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo das atividades desse módulo.

### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em cinco cursos e um desafio de projeto. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item3.1"><h4>3.1 Fundamentos de Testes de Invasão (Pentest)</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>

🔐 Introdução ao Pentest   
Pentest (Penetration Test) é um ataque autorizado e controlado cuja finalidade é identificar e explorar vulnerabilidades em sistemas, redes ou aplicações para validar e melhorar mecanismos de defesa. É executado com regras claras previamente definidas entre a organização e o testador, considerando escopo, limites e responsabilidades legais.

🛡️ Red Team vs Blue Team   
O Red Team atua de forma ofensiva, simulando ataques reais para descobrir pontos fracos; o Blue Team trabalha na defesa, fazendo monitoramento, resposta a incidentes e análise de malware. Ambos atuam de forma complementar para elevar a postura de segurança.

🎯 Por que fazer um Pentest?   
- Identificar vulnerabilidades antes que sejam exploradas por criminosos.
- Validar a eficácia de controles e ferramentas de segurança.
- Avaliar conformidade com políticas e requisitos regulatórios.
- Priorizar correções com base em risco e impacto.

🧭 Tipos de Pentest (por alvo)   
- Aplicações (Web / Mobile): testar lógica, autenticação, APIs e exposição de dados.
- Redes e infraestrutura: varredura de portas, identificação de serviços vulneráveis e testes em equipamentos de rede.
- Físico: tentativa de acesso físico a instalações, equipamentos ou portas de rede.
- IoT / Dispositivos: avaliar firmware, interfaces de rede e controles embarcados.
- Engenharia social: testes contra pessoas — phishing, pretexting ou simulações presenciais.

🔍 Fluxo típico de um Pentest   
1. Proposta e contrato / Kickoff: definição de escopo, limites, cronograma e responsabilidades.
2. Coleta de informações (reconhecimento / OSINT): levantar dados públicos e expostos sobre o alvo.
3. Modelagem de ameaças: mapear ativos críticos e possíveis vetores de ataque.
4. Análise de vulnerabilidades: varredura e validação das falhas encontradas.
5. Exploração: comprovar impacto explorando vulnerabilidades validadas.
6. Pós-exploração: coleta de evidências, manutenção de acesso controlado (quando aplicável).
7. Relatório e entrega: documentação técnica e versão gerencial com recomendações.
8. Reteste: validar correções aplicadas (quando combinado).

🎭 Classificação por nível de conhecimento   
- Black Box (caixa preta): o testador recebe nenhuma informação interna; simula um invasor externo real. É realista, mas pode demandar mais tempo e ainda assim não alcançar todas as falhas.
- Grey Box (caixa cinza): o testador recebe acesso parcial (ex.: credenciais limitadas ou documentação); equilíbrio entre profundidade e custo, com boa eficiência.
- White Box (caixa branca): o testador recebe acesso completo (ex.: código-fonte, arquitetura); permite análise profunda e rápida identificação de problemas, mas exige maior exposição de informações sensíveis.

🧾 Relatórios e comunicação   
- Relatório técnico: detalhes técnicos completos — evidências, passos de exploração, risco técnico e recomendações específicas para correção.
- Relatório gerencial: resumo executivo — impacto, postura de risco atual e recomendações priorizadas para decisão da liderança. A linguagem e o nível de detalhe devem ser adaptados ao público-alvo.

⚠️ Boas práticas e cuidados legais   
- Definir escopo e limites por escrito antes de começar.
- Garantir backups e procedimentos de rollback para minimizar impacto.
- Proteger as evidências coletadas e garantir confidencialidade.
- Planejar janela de testes e comunicação de emergência para eventuais indisponibilidades.

<a name="item3.2"><h4>3.2 Introdução à Coleta e Análise de Segurança Cibernética</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>

🔎 Introdução ao OSINT   
OSINT (Open Source Intelligence) é o conjunto de métodos e ferramentas para coletar e analisar informações públicas disponíveis na internet e em fontes abertas. O objetivo é reunir dados relevantes sobre um alvo (empresa, infraestrutura, indivíduo ou tema) usando somente fontes acessíveis sem intrusão técnica.

🗂️ Fontes e usos do OSINT   
As fontes incluem blogs, fóruns, redes sociais, mídias tradicionais, registros públicos e bases governamentais. O OSINT é aplicado em diversos cenários: mapear a presença digital de uma organização, investigar atividades relacionadas a criptomoedas, detectar campanhas de phishing, apoiar investigações de fraude, realizar due diligence e alimentar análises de risco em cibersegurança ou operações.

🎯 Benefícios e limitações do OSINT   
- Benefícios: adiciona uma camada de inteligência com custo relativamente baixo, fornece dados atualizados e pode acelerar decisões ao consolidar informações públicas.
- Limitações: grande volume de dados irrelevantes, necessidade de filtrar e validar informações manualmente e dependência de ferramentas e processos para ganhar eficiência.

🛠️ Técnicas e abordagem (passiva x ativa)   
O trabalho de OSINT exige técnica e método: definir fontes, montar palavras-chave relevantes, escolher ferramentas e validar resultados. Métodos passivos extraem informações sem contato direto com o alvo (uso de registros públicos, caches e dumps); são discretos e têm baixo risco de detecção. Métodos ativos envolvem interações (sondagens, verificações em serviços), fornecem dados em tempo real, mas aumentam a chance de serem notados.

Fluxo básico: definir tema → selecionar fontes → coletar dados → refinar com palavras-chave → analisar e validar → documentar achados.

💻 Google Hacking (Dorking)   
Pesquisa avançada no Google usa operadores para filtrar resultados específicos — por exemplo, site:, intitle:, inurl:, intext: e filetype:. Combinando esses operadores (os chamados “dorks”) é possível localizar páginas, arquivos expostos ou painéis administrativos que não aparecem em buscas simples. Existem repositórios públicos de dorks e plataformas (ex.: Exploit-DB) que centralizam consultas úteis para reconhecimento.

🔎 Shodan   
Shodan é um motor de busca para dispositivos na internet: servidores, câmeras, roteadores e muitos outros serviços expostos. Permite filtrar por porta, software, versão e localização, oferecendo visão rápida da superfície de ataque de uma rede. É especialmente útil para identificar equipamentos mal configurados ou serviços desatualizados.

🕸️ Maltego   
Maltego é um framework com interface gráfica para levantar e conectar entidades (pessoas, domínios, IPs, redes sociais). Automatiza pesquisas em múltiplas fontes e apresenta grafos que facilitam entender relações e caminhos de investigação. Há versões gratuitas (limitadas) e comerciais com recursos avançados; é valioso na fase de mapeamento e correlação de evidências.

📎 FOCA   
FOCA automatiza busca, download e análise de documentos públicos para extrair metadados (usuários, caminhos de arquivos, versões de software, servidores etc.). Arquivos Office, PDFs e outros costumam conter informações úteis para levantar footprint e identificar tecnologias ou responsáveis, por isso a análise de metadados é etapa importante do reconhecimento.

✅ Boas práticas ao utilizar OSINT   
- Definir escopo e objetivo antes de coletar dados.
- Validar fontes e cruzar informações para reduzir falsos positivos.
- Registrar metodologia e evidências para rastreabilidade.
- Respeitar legislação e limites éticos (não invadir, não se passar por terceiro).
- Automatizar onde fizer sentido, mas manter revisão humana dos resultados.

<a name="item3.3"><h4>3.3 Tópicos em Engenharia Social</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>

🧠 Introdução à Engenharia Social   
A engenharia social é a prática de manipular pessoas para que realizem ações ou revelem informações sem perceberem a verdadeira intenção por trás do pedido. Em vez de atacar diretamente sistemas tecnológicos, o atacante explora o comportamento humano — que costuma ser o elo mais fraco da segurança.

🎭 Fases de um ataque de Engenharia Social   
O processo segue geralmente uma sequência estruturada:
- Investigação (Investigation): levantamento de informações sobre a vítima ou organização para preparar o terreno.
- Aproximação (Hook): o invasor cria uma interação convincente — contando uma história, fingindo autoridade ou oferecendo ajuda.
- Execução (Play): coleta de dados ou aplicação do golpe ao longo do tempo, ganhando cada vez mais confiança.
- Encerramento (Exit): o contato é finalizado sem levantar suspeitas; quando há malware envolvido, os vestígios são removidos.

🛠️ Como atacantes exploram informações públicas   
É comum que criminosos pesquisem endereços de e-mail de colaboradores de uma empresa em sites públicos. Com essa lista em mãos, lançam campanhas de phishing em massa esperando que pelo menos uma pessoa caia no golpe. Grande parte dos ataques cibernéticos incorpora algum nível de engenharia social — mesmo os mais técnicos.

⚠️ Formas comuns de Engenharia Social   
Entre os principais métodos utilizados estão:
- Phishing (e variações como spear phishing e smishing)
- Pretexting (criar uma história falsa para convencer a vítima)
- Scareware (alertas falsos para induzir ao medo)
- Ataques físicos ou violações de acesso
- DNS spoofing, watering hole e quid pro quo
- Roubo de credenciais e abuso de confiança

🎯 Foco especial: Phishing   
Phishing é o golpe em que o invasor se passa por uma entidade confiável — por e-mail, telefone ou mensagem — tentando induzir a vítima a clicar em um link malicioso ou fornecer dados. O ciclo costuma seguir este padrão: Entidade falsa → Envio em massa → Uma parte das vítimas clica → Site falso coleta dados → Criminoso utiliza ou vende as informações.

Os dados mais visados são:
- Informações pessoais (nome, e-mail, documentos)
- Dados financeiros (cartões, contas bancárias)
- Credenciais de acesso (e-mails, redes sociais, portais corporativos)

Meios mais usados para propagação:
- E-mail
- Redes sociais
- Mensagens SMS/MMS
- Ligações telefônicas
- Arquivos infectados por malware

🚨 Como identificar sinais de golpe   
- Comunicação estranha vinda de alguém conhecido
- Pedidos urgentes ou ameaçadores
- Emoções forçadas (medo, pressa, recompensa)
- Ofertas boas demais para serem verdade
- Ajuda não solicitada
- Falta de comprovação de identidade do remetente

🛡️ Como reagir e se proteger   
- Ao receber um e-mail suspeito:
  - Não responder
  - Não clicar em links nem baixar anexos
  - Marcar como phishing e excluir
- Medidas preventivas essenciais:
  - Evitar abrir mensagens de remetentes desconhecidos
  - Utilizar autenticação de múltiplos fatores
  - Manter antivírus e sistemas atualizados
  - Desconfiar de promessas exageradas ou premiações inesperadas

<a name="item3.4"><h4>3.4 Conceitos e Técnicas de Varredura de Rede</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>

🔎 Varredura de Rede (Network Scanning)   
Varredura de rede é a técnica usada para descobrir dispositivos ativos, portas abertas e serviços expostos em uma rede. O objetivo pode ser defensivo (mapeamento e auditoria) ou ofensivo (reconhecimento antes de um ataque), por isso envolve riscos legais e operacionais se realizada sem autorização.

A varredura costuma identificar três tipos de informação principais: hosts (quais máquinas estão online), portas/serviços (quais portas estão aceitando conexões e que software responde nelas) e vulnerabilidades conhecidas associadas a esses serviços. Em seguida, a etapa de enumeração aprofunda esses achados, extraindo detalhes de configuração, contas, shares e serviços específicos.

🧭 Técnicas comuns de varredura   
- ARP (Address Resolution Protocol): usado em redes locais para mapear quais dispositivos respondem no mesmo segmento — rápido e confiável dentro da sub-rede.
- ICMP (ping): verifica disponibilidade de hosts em redes maiores; pode ser bloqueado por firewalls.
- TCP: varreduras de portas TCP (SYN/CONNECT/FIN/NULL) permitem identificar serviços e tipos de resposta do servidor.
- UDP: varreduras UDP buscam serviços sem conexão (DNS, SNMP, etc.), mas são mais lentas e suscetíveis a falsos negativos.

⚠️ Diferença entre varredura e enumeração   
- Varredura: processo mais amplo e automático que identifica presença de hosts, portas e possíveis vulnerabilidades — fornece visão inicial da superfície de ataque.
- Enumeração: fase subsequente e mais detalhada — interage com serviços descobertos para recuperar usuários, shares, versões de software e outras informações exploráveis.

🛠️ Nmap   
O Nmap é uma ferramenta livre e amplamente usada para varredura, mapeamento de rede e identificação de serviços e vulnerabilidades. Funciona tanto em linha de comando (CLI) quanto por interface gráfica (Zenmap). O Nmap permite especificar alvos, tipos de varredura, scripts de detecção (NSE) e opções de performance, sendo útil para inventário de ativos, auditoria de segurança e reconhecimento controlado.

⚖️ Cuidados e boas práticas   
- Executar varreduras apenas com autorização explícita; sem permissão, a ação pode ser considerada invasiva ou ilegal.
- Planejar janelas de teste e avisar responsáveis para evitar impacto em produção.
- Preferir modos menos agressivos em redes sensíveis (evitar scans que causem sobrecarga).
- Registrar evidências e resultados de forma organizada para auditoria e correção.
- Tratar os dados coletados com confidencialidade e usar os resultados para mitigar riscos (fechar portas desnecessárias, atualizar serviços, aplicar políticas).

<a name="item3.5"><h4>3.5 Princípios de Enumeração e Exploração de Vulnerabilidades</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>

🧾 Enumeração de Portas e Serviços   
A enumeração é a etapa do reconhecimento em que se estabelece comunicação ativa com sistemas-alvo para coletar detalhes operacionais que podem ser explorados. Diferente da varredura, que identifica hosts, portas e serviços de forma mais ampla, a enumeração aprofunda-se nesses serviços para extrair informações concretas — usuários, shares, banners, versões de software e configurações — que orientam ataques ou planos de mitigação.

🔎 Objetivo e fluxo típico   
O objetivo principal é transformar uma lista de alvos e portas descobertas em um inventário detalhado e verificável dos recursos expostos. Um fluxo comum é: identificação de alvos → varredura de portas → fingerprinting (impressão digital do sistema) → enumeração de serviços e componentes → coleta de evidências para análise de risco.

🛠️ Tipos de enumeração (por serviço/protocolo)   
- NetBIOS / SMB: mapeamento de recursos compartilhados, usuários e permissões em redes Windows.
- SNMP: leitura de informações de dispositivos de rede (quando comunidades públicas estão mal configuradas).
- LDAP: descoberta de usuários, grupos e políticas em diretórios corporativos.
- NTP / SMTP / DNS: enumeração de servidores e suas configurações públicas que podem vazar informações.
- Windows / Unix/Linux: extração de contas, serviços e configurações específicas de cada SO.

🔧 Técnicas comuns   
- Enumerar nomes de usuário via respostas públicas (e-mails, formulários, serviços).
- Consultar serviços com credenciais padrão para identificar exposição.
- Força bruta ou ataques dirigidos contra autenticações (ex.: Active Directory) quando autorizado.
- Uso de SNMP para coletar MIBs e informações de infraestrutura.
- Transferências DNS (AXFR) para obter zonas e registros expostos.
- Captura de banners para identificar versões de software e possíveis CVEs associados.

📚 Informações que normalmente são obtidas   
- Hosts e endereços de origem da rede.
- Listas de usuários e grupos.
- Tabelas de roteamento e informações de topologia.
- Serviços em execução, portas abertas e banners.
- Configurações de auditoria e políticas.
- Detalhes SNMP, registros DNS, shares e aplicações expostas.

🧰 Ferramentas relevantes   
- Nmap e Nmap Scripting Engine (NSE): varredura + scripts automatizados para coleta detalhada.
- NetCat: interação manual com serviços e testes de banner.
- NBTScan / SMBScanner / DumpSec: foco em NetBIOS/SMB e informações Windows.
- Outras ferramentas especializadas conforme o protocolo (ex.: ferramentas DNS, LDAP clients, snmpwalk).

⚖️ Considerações e boas práticas   
- Executar enumeração somente com autorização e dentro do escopo acordado; enumerações agressivas podem interromper serviços.
- Priorizar técnicas não disruptivas na investigação inicial, evoluindo para métodos mais intrusivos só se houver aprovação.
- Registrar e proteger todas as evidências coletadas, relacionando-as a riscos e recomendações de correção.
- Usar os resultados para direcionar remediações: fechar portas desnecessárias, corrigir versões vulneráveis e reforçar autenticação.

<a name="item3.6"><h4>3.6 Desafio de projeto: Criação de um Phishing com o Kali Linux</h4></a>[Back to summary](#item3) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cyber/.pdf">Certificate</a>





<div align="Center"><figure>
    <img src="../0-aux/md3-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>


<div align="Center"><figure>
    <img src="../0-aux/md3-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>
