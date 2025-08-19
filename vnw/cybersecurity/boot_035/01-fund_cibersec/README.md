# Formação Cybersec - Módulo 1   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">vnw   <img src="https://github.com/PedroHeeger/my_tech_journey/blob/main/platforms/img/vnw.jpeg" alt="vnw" width="auto" height="25"></a>
### Software/Subject: <a href="../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_035 (Formação Cybersec)   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="25"></a>
### Module: 1. Fundamentos de Cibersegurança

#### <a href="./labs.md">Laboratórios</a>

---

Esta pasta refere-se ao módulo 1 **Fundamentos de Cibersegurança** do bootcamp [**Formação Cybersec**](../).

### Theme:
- Cybersecurity

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
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

### Bootcamp Module 1 Structure
1. <a name="item1">Módulo 1: Fundamentos de Cibersegurança<br>
    1.1. <a href="#item1.1">Setup e Preparação do Ambiente</a><br>
    1.2. <a href="#item1.2">Modelo CIA (Confidencialidade, Integridade, Disponibilidade)</a><br>
    1.3. <a href="#item1.3">Ameaças, ataques e vulnerabilidades</a><br>
    1.4. <a href="#item1.4">Reconhecimento & Footprinting</a><br>
    1.5. <a href="#item1.5">Infraestrutura de Rede - Conceitos e Componentes</a><br>
    1.6. <a href="#item1.6">Ferramentas: Kali Linux, Nmap, Wireshark</a><br>
    1.7. <a href="#item1.7">Endereçamento IP & Subnetting</a><br>
    1.8. <a href="#item1.8">Seu Dojo de Ataque no Kali Linux (CLI & GUI)</a><br>
    1.9. <a href="#item1.9">Ports/Portas</a><br>
    1.10. <a href="#item1.10">Desvendando SMB e SNMP: Os Pilares e as Fraquezas da Rede</a><br>
    1.11. <a href="#item1.11">Introdução a Scanners de Vulnerabilidade com OpenVAS/Greenbone</a><br>
    1.12. <a href="#item1.12">Documentação Técnica Profissional</a><br>
    1.13. <a href="#item1.13">Projeto Final</a><br>

---

### Objective:
Estabelecer uma base técnica sólida em redes, sistemas operacionais e nos princípios da segurança ofensiva e defensiva, com foco na aplicação prática de conceitos fundamentais de segurança, como o modelo CIA, Cyber Kill Chain e MITRE ATT&CK. O módulo também aborda técnicas essenciais de cibersegurança, incluindo análise de tráfego (**Wireshark**), reconhecimento e OSINT, escaneamento (**Nmap**) e enumeração de serviços.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Documento escrito em **Markdown**, descrevendo todos os laboratórios realizados neste módulo.

### Development:
Este módulo foi estruturado em aulas, cada uma dedicada a um tema específico. Na maioria delas, foram realizados laboratórios práticos relacionados ao conteúdo abordado. Este arquivo README contempla exclusivamente a parte teórica, enquanto o arquivo [labs.md](./labs.md), também em Markdown, apresenta a resolução de todos os laboratórios do módulo.

<a name="item1.1"><h4>1.1 Setup e Preparação do Ambiente</h4></a>[Back to summary](#item1)   
[Lab01](labs.md#item1.1)

A primeira aula deste módulo teve como objetivo a configuração do ambiente de laboratório que foi utilizado ao longo do curso. Nesse ambiente foram realizadas simulações práticas de segurança, de forma segura, utilizando containers **Docker**. A prática *hands-on* é indispensável para consolidar os conceitos de segurança, e por isso o primeiro passo foi preparar todas as ferramentas necessárias para execução dos laboratórios. Abaixo são apresentadas as ferramentas utilizadas:
- **Docker**: plataforma de criação e gerenciamento de containers que serviu como base de todos os laboratórios.
- **Git**: sistema de controle de versão utilizado para obter o material do curso.
- **Visual Studio Code (VSCode)**: editor de código com suporte a múltiplas linguagens e extensões.
- **WSL2**: subsistema Linux para Windows, necessário para usuários **Windows Home**, já que o **Docker Desktop** é nativo apenas nas edições **Windows Pro/Enterprise**.

Para quem utilizava **Windows**, foi preciso instalar o **WSL2** com uma distribuição **Linux** (preferencialmente **Ubuntu**) e, dentro dela, instalar **Docker** e **Git**. O **VSCode** pôde ser instalado diretamente no sistema operacional. Usuários **Linux** instalaram as três ferramentas diretamente no sistema. No meu caso, para evitar instalações na minha máquina física (**Windows**), optei por utilizar o **Play With Docker (PWD)**, uma plataforma online de testes para o **Docker**. Em alguns momentos, devido a limitações de memória, foi necessário utilizar uma instância da **Amazon Elastic Compute Cloud (EC2)** da **Amazon Web Services (AWS)** para realizar determinados laboratórios.

Praticamente, cada aula contou com um laboratório prático. Para cada um deles, o instrutor disponibilizou, no repositório oficial do curso no **GitHub** da **Vai na Web (VNW)**, uma pasta com os arquivos de construção do ambiente. O arquivo central era o `docker-compose.yml`, responsável por orquestrar os containers, serviços e redes simuladas. Em alguns laboratórios havia também um ou mais `Dockerfile`, utilizados para a criação das imagens específicas necessárias no **Docker Compose**. Outros arquivos complementares podiam estar presentes com informações ou scripts auxiliares.

A sequência geral para execução de um laboratório foi a seguinte:
- Clonagem do repositório do curso: `git clone https://github.com/Kensei-CyberSec-Lab/formacao-cybersec.git`.
- Navegação até a pasta do laboratório específico: `cd formacao-cybersec/modulo1-fundamentos/lab_1`. As pastas de módulo e laboratório variam conforme a aula correspondente.
- Inicialização dos containers: `docker-compose up -d`.
- Verificação dos containers ativos: `docker ps`.
- Verificação das redes existentes: `docker network ls`.
- Acesso a um container específico: `docker exec -it kali /bin/bash`. Aqui era só trocar o nome do container, no caso `kali`, pelo nome do container desejado.
- Encerramento do ambiente: `docker compose down`.

Importante ressaltar que os comandos **Docker Compose** deveriam ser executados somente quando a pasta atual contivesse o arquivo `docker-compose.yml`. Caso contrário, seria preciso fornecer o caminho completo do arquivo com a flag `-f`. 

🐳 Docker
O **Docker** é uma plataforma de containerização que permite empacotar aplicações e todas as suas dependências em ambientes isolados e reproduzíveis. Dessa forma, elimina o problema “funciona na minha máquina”, pois garante que o ambiente será o mesmo para todos os usuários. Ele também facilita a simulação de infraestruturas mais complexas e permite a execução simultânea de múltiplos ambientes. No contexto do curso, o **Docker** foi utilizado para simular ambientes vulneráveis de maneira segura e controlada.

Alguns outros comandos básicos do **Docker** que podiam ser utilizados são listados abaixo:
- `docker stop`: Finaliza a execução de um container;
- `docker start`: Inicializa um container parado;
- `docker rm`: Remove um container;
- `docker logs`: Exibe os logs de um container;
- `docker exec`: Executa comandos dentro de um container.

<a name="item1.2"><h4>1.2 Modelo CIA (Confidencialidade, Integridade, Disponibilidade)</h4></a>[Back to summary](#item1)
[Lab02](labs.md#item1.2)

A segunda aula abordou o modelo *CIA* (Confidencialidade, Integridade e Disponibilidade), com o objetivo de aprofundar o conhecimento sobre esses três princípios essenciais da segurança da informação.

🔐 Modelo CIA   
O *Modelo CIA* é um alicerce fundamental na cibersegurança, servindo como referência para proteger sistemas, informações e dados críticos. Ele é composto por três pilares essenciais: Confidencialidade, Integridade e Disponibilidade. Cada pilar define objetivos claros para garantir que os dados estejam acessíveis apenas a pessoas autorizadas, sejam precisos e completos, e permaneçam disponíveis sempre que necessário. Aplicar o Modelo CIA ajuda a orientar políticas, controles e práticas de segurança, formando a base para auditorias, avaliações de risco e estratégias de proteção de TI.

🕵️ Confidencialidade (Confidentiality)   
O pilar de confidencialidade garante que apenas usuários ou sistemas autorizados tenham acesso às informações. Ele protege a privacidade e evita que dados sensíveis sejam expostos ou interceptados, seja por erro humano ou ação maliciosa. Entre os mecanismos comuns para assegurar a confidencialidade estão:
- Criptografia de dados em trânsito e em repouso;
- Políticas de acesso baseadas em funções (RBAC);
- Autenticação forte e multifator (MFA);
- Segmentação de redes e isolamento de informações sensíveis.

🛡️ Integridade (Integrity)   
O pilar da integridade assegura que os dados permaneçam completos, corretos e não sofram alterações não autorizadas. Ele garante que a informação se mantenha em seu estado original ou autorizado, desde a criação até o consumo, independentemente do sistema ou meio de armazenamento. Alterações indevidas, seja por falha, erro ou ataque, devem ser detectáveis. Para proteger a integridade, utilizam-se medidas como:
- Assinaturas digitais;
- Algoritmos de hash (como SHA-256);
- Controle de versões;
- Logs de auditoria;
- Validação de entradas e verificação da integridade em bancos de dados.

⚡ Disponibilidade (Availability)   
A disponibilidade garante que sistemas, serviços e informações estejam acessíveis sempre que necessários, dentro dos níveis esperados. Este pilar foca na continuidade operacional e resiliência, mesmo diante de falhas técnicas, incidentes ou ataques. Os controles típicos incluem:
- Infraestrutura redundante (RAID, clusters, failover);
- Políticas de backup e planos de recuperação de desastres (DRP);
- Sistemas de balanceamento de carga e alta disponibilidade;
- Proteções contra ataques DDoS e gerenciamento de capacidade.

📌 Exemplos   
Para exemplificar, o vazamento de dados da plataforma **Steam**, que expôs informações pessoais de milhões de usuários, evidencia uma violação de confidencialidade. Alterações não autorizadas em boletos ou transações via Pix demonstram problemas de integridade, já que dados legítimos foram modificados indevidamente. Já ataques DDoS que tornaram a plataforma **gov.br** inacessível mostram falhas na disponibilidade, impedindo o acesso a serviços essenciais.

A tríade *CIA* evidencia que os controles de segurança precisam equilibrar os três pilares. Focar somente na confidencialidade pode proteger dados sensíveis, mas sem disponibilidade o serviço fica inacessível. Garantir integridade sem controle de acesso pode permitir que informações corretas sejam visualizadas ou modificadas por pessoas não autorizadas. O equilíbrio entre confidencialidade, integridade e disponibilidade é, portanto, essencial para uma estratégia de segurança eficaz.

<a name="item1.3"><h4>1.3 Ameaças, ataques e vulnerabilidades</h4></a>[Back to summary](#item1)
[Lab03](labs.md#item1.3)

A compreensão de como ataques cibernéticos acontecem é fundamental para a cibersegurança, pois permite analisar de forma estruturada as etapas que um invasor percorre, desde o planejamento inicial até a execução de suas ações maliciosas. Estudar essas etapas ajuda a identificar vetores de ataque, pontos críticos de vulnerabilidade e medidas de proteção adequadas para mitigar riscos e fortalecer sistemas.

💀 Cyber Kill Chain   
O modelo *Cyber Kill Chain*, criado pela Lockheed Martin em 2011, descreve o ciclo de um ataque cibernético em sete etapas, inspirado em processos militares. Cada fase apresenta características específicas e tipos de ameaças associados:
  1. **Reconnaissance (Reconhecimento)**: consiste na coleta de informações sobre o alvo, incluindo endereços IP, sistemas em uso, dados de pessoas ou organizações, utilizando técnicas como OSINT, varredura de rede, fingerprinting, busca por endpoints públicos e análise de metadados.
  2. **Weaponization (Armamento)**: envolve a preparação da ameaça, criando malware, trojans, ransomware ou exploits customizados (como zero-days) que exploram vulnerabilidades identificadas na fase anterior.
  3. **Delivery (Entrega)**: refere-se ao envio do vetor de ataque ao alvo, podendo ocorrer por phishing, spear-phishing, engenharia social, links maliciosos ou dispositivos físicos, como USBs infectados.
  4. **Exploitation (Exploração)**: é o momento em que a vulnerabilidade é explorada para ganhar acesso ao sistema, utilizando técnicas como injeção de SQL (SQLi), cross-site scripting (XSS), buffer overflow ou execução de malware.
  5. **Installation (Instalação)**: consiste na implementação de backdoors, trojans ou malware persistente, garantindo acesso contínuo ao sistema comprometido.
  6. **Command & Control (Comando e Controle)**: permite ao atacante controlar remotamente o sistema afetado, utilizando bots, canais de comando ocultos (C2) e comunicação discreta para gerenciar os sistemas infectados.
  7. **Actions on Objectives (Ações em Objetivo)**: representa a execução final do ataque, que pode incluir exfiltração de dados, instalação de ransomware, criptografia de arquivos ou ataques de DDoS como distração.

O *Cyber Kill Chain* é amplamente utilizado para estruturar defesas no perímetro e identificar ataques à medida que avançam pelas etapas da cadeia, permitindo a implementação de controles e monitoramento de forma sequencial. No entanto, o modelo apresenta limitações, sendo menos eficaz contra ameaças internas, ataques sofisticados e não lineares, além de cenários modernos em que as ações do atacante não seguem uma sequência previsível.

🗺️ MITRE ATT&CK   
O *MITRE ATT&CK*, desenvolvido a partir de 2013, é uma base de conhecimento aberta que documenta táticas, técnicas e procedimentos (TTPs) utilizados por atacantes no mundo real, com foco especial em comportamentos pós-comprometimento. Cada tática representa um objetivo específico dentro de um ataque, como Initial Access (acesso inicial), Privilege Escalation (elevação de privilégios), Defense Evasion (evasão de defesas) e Exfiltration (exfiltração de dados). 

As técnicas e sub-técnicas descrevem de forma detalhada os métodos utilizados para cumprir cada tática, incluindo ações como spear-phishing, execução de scripts e logons remotos. A estrutura do MITRE ATT&CK organiza essas informações de maneira granular, atualmente abrangendo até 14 táticas, cerca de 191 técnicas e centenas de sub-técnicas, permitindo uma visão detalhada do comportamento de atacantes em múltiplos ambientes, como redes corporativas, nuvem, dispositivos móveis e sistemas industriais (ICS).  

Essa base é especialmente útil para modelagem de ameaças, investigação de incidentes (threat hunting) e compreensão prática de como ataques realmente ocorrem, oferecendo uma visão mais detalhada e realista do que o modelo *Cyber Kill Chain*. Diferentemente da Kill Chain, o MITRE ATT&CK não segue uma sequência linear de etapas, permitindo analisar comportamentos simultâneos ou não ordenados, com maior granularidade e aplicabilidade em diferentes plataformas.

📊 Análise Comparativa   
Uma análise comparativa entre *Cyber Kill Chain* e *MITRE ATT&CK* evidencia diferenças importantes em termos de origem, abordagem e aplicação. O *Cyber Kill Chain*, criado em 2011 pela Lockheed Martin, apresenta uma sequência linear de sete fases e foca na defesa perimetral, buscando interromper o ataque em etapas específicas. Sua granularidade é mais ampla, oferecendo uma visão geral do ciclo de ataque, aplicável de forma genérica a diversos sistemas.

Por outro lado, o *MITRE ATT&CK*, desenvolvido a partir de 2013, é uma base detalhada de táticas, técnicas e procedimentos (TTPs) que reflete o comportamento real de atacantes após o comprometimento inicial. Sua abordagem é não linear e comportamental, com alto nível de detalhamento, permitindo mapear ações específicas em múltiplas plataformas, incluindo redes corporativas, nuvem, dispositivos móveis e sistemas industriais (ICS). Enquanto a Kill Chain fornece uma visão macro e sequencial, o MITRE ATT&CK oferece informações granulares para análise de ameaças, investigação de incidentes e planejamento de respostas mais precisas.

<a name="item1.4"><h4>1.4 Reconhecimento & Footprinting</h4></a>[Back to summary](#item1)
[Lab04](labs.md#item1.4)

O objetivo deste aula foi apresentar o conceito de *OSINT (Open-Source Intelligence)* e como ele é aplicado na segurança da informação. Foram exploradas as diferenças entre *Reconhecimento Passivo*, que coleta informações sem interagir diretamente com o alvo, e *Footprinting Ativo*, que envolve sondagens e verificações de sistemas. O ciclo de inteligência, desde a coleta até a análise dos dados, foi abordado, assim como as principais fontes, técnicas e ferramentas de OSINT. Além disso, foram apresentadas práticas que permitiram reduzir a exposição de informações sensíveis por meio de medidas de mitigação e monitoramento.

🔎 OSINT   
O conceito de *OSINT (Open-Source Intelligence)* refere-se à coleta de informações a partir de fontes abertas, públicas e disponíveis, embora nem sempre de forma gratuita, já que o acesso e o processamento podem demandar esforço ou custos adicionais. A inteligência gerada a partir desses dados depende da correlação e do contexto das informações coletadas, permitindo extrair valor real além de simples dados isolados. As fontes de OSINT abrangem diferentes camadas da web, incluindo a *Surface Web*, a *Deep Web* e, em alguns casos, a *Dark Web*. Aspectos legais e éticos foram considerados, destacando-se legislações como *LGPD* e *GDPR*, bem como princípios de privacidade e proporcionalidade na coleta de informações.

O ciclo de inteligência em OSINT é composto por várias etapas. Inicialmente, ocorre o Planejamento e Direcionamento, em que se definem os objetivos e perguntas de segurança. Em seguida, a Coleta extrai dados de fontes abertas, que são processados na fase de Processamento, eliminando redundâncias e normalizando as informações. A fase de Análise transforma os dados em insights acionáveis, enquanto a Disseminação compartilha os resultados com os responsáveis pela tomada de decisão. Por fim, a Retroalimentação garante que o ciclo seja contínuo, permitindo ajustes e melhorias nas próximas iterações.

As principais fontes de OSINT podem ser categorizadas de acordo com o tipo de informação que fornecem:
- Ferramentas de Busca: Motores de busca avançados permitem pesquisas específicas e detalhadas. Técnicas como *Google Dorks* possibilitam encontrar arquivos ou informações sensíveis, enquanto alternativas como **DuckDuckGo** permitem buscas sem rastreamento.  
- Infraestrutura Digital: Serviços que mapeiam dispositivos e redes conectadas à Internet, como **Shodan** e **Censys**, ajudam a identificar servidores, câmeras e outros dispositivos. Consultas a certificados SSL/TLS históricos, como via **CRT.sh**, permitem rastrear domínios e subdomínios ativos.  
- Presença Social: Redes sociais oferecem informações sobre pessoas e organizações. **LinkedIn** permite mapear estruturas corporativas, **Twitter/X** revela comunicações públicas e tendências, e plataformas como **TikTok** podem indicar comportamento de indivíduos, lembrando que pessoas funcionam como endpoints vulneráveis.  
- Web Não-indexada: Informações podem ser obtidas em camadas da web não indexadas por motores de busca tradicionais, incluindo *Deep Web* e *Dark Web*, acessíveis por redes como **Tor** ou **I2P**, com atenção às questões legais e jurisdicionais.
- Registros e Documentação Pública: Bases de dados oficiais e registros públicos, como **WHOIS**, **RIRs**, documentos da **SEC** ou publicações em Diários Oficiais, fornecem informações sobre propriedade de domínios, organizações e ativos legais.
- Código-fonte: Repositórios públicos de código, como **GitHub**, **GitLab** e **Gists**, podem conter credenciais ou segredos acidentalmente expostos, sendo uma fonte relevante de inteligência sobre práticas de desenvolvimento e configurações de sistemas.  
- Dados Comprometidos: Vazamentos e incidentes de segurança fornecem dados sobre credenciais expostas e informações sensíveis. Serviços de consulta a vazamentos, como **leak-lookups**, e fóruns de monitoramento de incidentes, como **BreachForums**, permitem identificar riscos atuais e potenciais vulnerabilidades.

As técnicas e boas práticas de OSINT envolvem métodos para buscar, organizar e validar informações de forma eficiente:
- Busca Avançada: Utilizar estratégias de pesquisa detalhadas, como *Google Hacking*, permite localizar arquivos ou informações específicas em sites, por exemplo, usando consultas que filtram por tipo de arquivo ou conteúdo sensível.  
- Análise de Metadados: A extração de metadados de arquivos digitais (*Metadata Mining*) possibilita descobrir informações escondidas, como endereços de e-mail, impressoras usadas, caminhos de rede e outros dados contextuais relevantes para a investigação.  
- Correlação de Informações: Combinar e relacionar diferentes dados aumenta a qualidade da inteligência. O *pivoting* conecta elementos, como nome de usuário, e-mail, domínio e ASN, enquanto o *enriquecimento* utiliza múltiplas fontes para validar e contextualizar informações, garantindo maior confiabilidade.  
- Ferramentas de Escala: Automação por meio de scripts, geralmente em **Python** integrados a APIs de serviços como **Shodan** ou **Censys**, permite processar grandes volumes de dados, aumentando a eficiência da coleta e reduzindo o trabalho manual.

As ferramentas de OSINT permitem coletar, organizar e visualizar informações de forma prática e eficiente:
- Reconhecimento de Hosts: O **Shodan** possibilita consultar informações sobre dispositivos conectados à internet, serviços ativos e vulnerabilidades associadas. Exemplo de comando: `shodan host <IP>`.  
- Coleta de E-mails: O **theHarvester** permite buscar endereços de e-mail e subdomínios associados a um domínio, utilizando diferentes fontes de dados. Exemplo: `theHarvester -d corp.com -b all`.  
- Mapeamento Visual de Relações: O **Maltego CE** oferece uma interface gráfica para identificar e relacionar entidades como domínios, pessoas, redes e organizações, facilitando a análise visual de conexões.  
- Enumeração de DNS: O **Sublist3r** permite descobrir subdomínios de um domínio específico, ajudando a identificar ativos e superfícies de ataque não documentadas. Comando: `sublist3r -d corp.com`.  
- Framework Completo: O **SpiderFoot** combina múltiplas fontes e técnicas de coleta, oferecendo uma interface web para realizar varreduras detalhadas e gerar relatórios completos sobre o domínio ou alvo analisado.  
- Dica Avançada: Para maximizar a eficiência, é possível criar pipelines de ferramentas, onde a saída de uma ferramenta serve como entrada para outra, permitindo enriquecer os dados e obter inteligência mais precisa de forma automatizada.

👀 Reconhecimento Passivo   
O *Reconhecimento Passivo* consiste em coletar informações sobre um alvo sem interagir diretamente com seus sistemas, minimizando o risco de detecção. Algumas práticas comuns incluem:
- Busca de Documentos Sensíveis: Utilização de consultas avançadas em motores de busca, como **Google Dorks**, para localizar arquivos que possam conter credenciais ou informações confidenciais. Por exemplo: `site:corp.com filetype:xlsx password` pode revelar planilhas com senhas expostas.  
- Reconhecimento de Infraestrutura: Análise de registros públicos, como **WHOIS** e **RDAP**, para mapear Sistemas Autônomos (ASN) e blocos de IP, ajudando a compreender a topologia da rede do alvo e possíveis pontos de exposição.  
- Mapeamento de Subdomínios: Enumeração detalhada de subdomínios de um domínio-alvo usando ferramentas como **Sublist3r** e **DNS Dumpster**, permitindo identificar ativos não documentados e expandir a superfície de ataque potencial.  
- Verificação de Certificados: Consulta a bancos de dados de transparência de certificados SSL/TLS, como `https://crt.sh`, para descobrir subdomínios históricos ou esquecidos que ainda podem estar ativos.  
- Investigação de Vazamentos: Pesquisa em repositórios e bases de dados de credenciais expostas, como **Leak-Lookup** e **DeHashed**, para identificar informações que possam ser exploradas em ataques, como tentativas de password spraying.

📝 Footprinting Ativo   
O *Footprinting Ativo* envolve sondagens diretas ao alvo para coletar informações detalhadas sobre sua infraestrutura, antes de qualquer ataque. As práticas principais incluem:
- Análise de Conectividade: Utilização de comandos como `ping` e `traceroute` para medir a latência e identificar o caminho até os sistemas do alvo, ajudando a mapear a topologia de rede.  
- Enumeração DNS: Consultas a registros DNS utilizando ferramentas como **whois** e **dig**, verificando entradas MX, TXT, SPF e DMARC, para entender a configuração de e-mails e políticas de autenticação do domínio.  
- Escaneamento de Rede: Varredura de portas e detecção de serviços e sistemas operacionais com ferramentas como **Nmap**, permitindo identificar portas abertas, versões de serviços e potenciais vulnerabilidades.  
- Análise de Vulnerabilidades: Execução de scripts NSE do **Nmap** (por exemplo, `nmap --script vuln <IP>`) para detectar falhas conhecidas em sistemas e serviços, fornecendo uma visão inicial do risco associado ao alvo.

✅ Checklist de Mitigação   
O Checklist de Mitigação reúne práticas essenciais para reduzir a exposição de sistemas e informações sensíveis, com foco em defesa proativa:
- Inventário de Ativos: Manter uma lista constantemente atualizada de todos os ativos expostos à Internet, evitando que recursos desconhecidos se tornem pontos de ataque.  
- Limpeza de Metadados: Implementar processos automáticos, por exemplo em pipelines de CI/CD, para remover metadados de documentos antes da publicação, prevenindo vazamentos de informações confidenciais.  
- Monitoramento de DNS: Acompanhar alterações em registros WHOIS, DNS e transparência de certificados SSL/TLS, permitindo identificar atividades suspeitas ou mudanças não autorizadas.  
- Gestão de Secrets: Adotar políticas rigorosas de gerenciamento de credenciais e tokens, garantindo que não fiquem armazenados em código-fonte ou acessíveis publicamente.  
- Detecção de Intrusão: Configurar sistemas de proteção, como WAF e NIDS, para detectar e bloquear tentativas de reconhecimento e varreduras incomuns, reforçando a segurança do perímetro.

<a name="item1.5"><h4>1.5 Infraestrutura de Rede - Conceitos e Componentes</h4></a>[Back to summary](#item1)
[Lab05](labs.md#item1.5)

A quinta aula teve como objetivo apresentar os fundamentos de redes, permitindo compreender como ocorre a comunicação digital de forma prática e detalhada, conectando o que é observado na superfície com os processos que acontecem nos bastidores. Foram destacados os componentes-chave de uma rede, incluindo cabos, roteadores, firewalls e balanceadores de carga, mostrando seu papel na infraestrutura e na segurança. Também foi abordado o Modelo *OSI/TCP-IP*, detalhando como os dados transitam pelas diferentes camadas e o que acontece em cada uma durante a comunicação. Por fim, o conteúdo relacionou a infraestrutura de rede com estratégias de defesa.

🖧 Elementos de Redes   
Os principais termos e componentes de redes, essenciais para compreender a infraestrutura e suas implicações em segurança, incluem:
- Endereço IP: Identificador numérico único de cada dispositivo em uma rede, público ou privado. É fundamental para varreduras, regras de firewall e rastreamento de tráfego malicioso.
- Porta: Endpoint de comunicação dentro de um IP, permitindo que múltiplos serviços funcionem simultaneamente (ex.: HTTP na porta 80, SSH na 22). Representa possíveis pontos de entrada para ataques.
- Protocolo: Conjunto de regras que governam a comunicação entre dispositivos (TCP, UDP, HTTP, DNS). Compreender protocolos ajuda a identificar abusos e anomalias de tráfego.
- Roteador: Dispositivo que encaminha pacotes entre redes, servindo como ponto de controle para segmentação, filtros de acesso e roteamento seguro.
- Switch: Conecta múltiplos dispositivos dentro de uma rede local (LAN), possibilitando segmentação (VLANs), controle de acesso na camada 2 e hardening de portas.
- Firewall: Sistema que monitora e regula o tráfego de rede, permitindo ou bloqueando pacotes com base em regras. Atua como primeira linha de defesa contra acessos não autorizados.
- Servidor DNS: Traduz nomes de domínio em endereços IP. Pode ser alvo de ataques (cache poisoning, DDoS) e fonte de informações em processos de reconhecimento.
- DHCP: Protocolo que atribui automaticamente endereços IP e configurações de rede aos dispositivos. Pode ser explorado em ataques como DHCP starvation ou rogue DHCP.
- Topologia de Rede: Arranjo físico ou lógico dos elementos da rede. Auxilia no mapeamento da superfície de ataque e no planejamento de defesas em profundidade.
- Modelo OSI: Estrutura conceitual de 7 camadas que descreve o funcionamento das redes. Permite diagnosticar problemas, entender pontos de ataque e aplicar controles de segurança específicos por camada.

A infraestrutura de rede é comparável ao sistema circulatório de uma organização, permitindo que os dados fluam de forma organizada. Compreender seus componentes é essencial para manter a segurança e a eficiência da comunicação digital.
- Cabos e Mídia: Incluem cabos Ethernet (cobre), fibra óptica e conexões Wi-Fi (wireless), responsáveis pela transmissão física ou sem fio dos dados.
- Dispositivos de Conectividade: Hubs (tecnologia legada), switches e roteadores que conectam os dispositivos, controlam o fluxo de pacotes e direcionam o tráfego entre redes.
- Dispositivos de Segurança: Firewalls e sistemas de detecção e prevenção de intrusão (IDS/IPS), que monitoram e protegem o tráfego contra acessos não autorizados e ataques.
- Servidores: Componentes críticos que fornecem serviços como DNS, DHCP, web e armazenamento de arquivos, sendo alvos estratégicos e pontos de controle da rede.

Os componentes de rede não apenas permitem a comunicação de dados, mas também apresentam pontos de vulnerabilidade que precisam ser gerenciados para garantir a segurança.
- Infraestrutura Física: Cabos danificados podem causar indisponibilidade de serviços, enquanto redes Wi-Fi mal configuradas permitem que atacantes não autorizados acessem a rede com facilidade.
- Segmentação e Controle: VLANs são fundamentais para isolar sistemas críticos, e switches gerenciáveis possibilitam políticas de controle de acesso por porta (Port Security), limitando o risco de movimentação lateral dentro da rede.
- Perímetro de Defesa: Roteadores atuam como o primeiro ponto de controle do tráfego entre a rede interna e a Internet, enquanto firewalls filtram pacotes maliciosos e aplicam políticas de acesso, protegendo recursos sensíveis.
- Monitoramento e Proteção: IDS e IPS detectam tentativas de exploração, varreduras e padrões de comportamento suspeitos. Servidores, frequentemente alvos de ataques, exigem hardening, aplicação de patches e monitoramento contínuo.

🗂️ Modelos Conceituais   
Para compreender como os dados circulam em uma rede, é útil recorrer a modelos conceituais que mapeiam a comunicação entre dispositivos. Os principais são o *Modelo OSI* e o *Modelo TCP/IP*, que ajudam a visualizar onde ocorrem processos, falhas ou ataques. O Modelo OSI é um modelo Conceitual, dividido em sete camadas, cada uma com funções específicas que permitem analisar problemas e vulnerabilidades.
- Camada 7 - Aplicação:  
  - Função: Interação com softwares de rede e serviços de aplicação.  
  - Exemplos: HTTP, FTP, SMTP, SSH, DNS. 
  - Vulnerabilidades comuns: Malware, phishing, SQLi, XSS, ataques a servidores DNS.
- Camada 6 - Apresentação:  
  - Função: Tradução, compressão e criptografia de dados.  
  - Exemplos: JPEG, MPEG, SSL/TLS (parcial).
  - Vulnerabilidades comuns: Quebra de criptografia, falhas de formatação de dados.
- Camada 5 - Sessão:
  - Função: Gerenciamento de sessões de comunicação entre aplicações.  
  - Exemplos: NetBIOS, RPC.
  - Vulnerabilidades comuns: Sequestro de sessão, negação de serviço na camada de sessão.
- Camada 4 - Transporte:
  - Função: Garantir entrega fim-a-fim dos dados.  
  - Exemplos: TCP (confiável), UDP (não confiável).
  - Vulnerabilidades comuns: DoS por TCP SYN Flood, exploração de falta de conexão do UDP, port scanning.
- Camada 3 - Rede:
  - Função: Roteamento de pacotes entre redes.  
  - Exemplos: IP, ICMP. 
  - Vulnerabilidades comuns: IP spoofing, ataques de roteamento, ICMP floods, varreduras de rede.
- Camada 2 - Enlace de Dados:
  - Função: Endereçamento físico (MAC) e detecção de erros em um link.  
  - Exemplos: Ethernet, ARP.
  - Vulnerabilidades comuns: ARP poisoning, MAC flooding, spoofing de MAC, VLAN hopping.
- Camada 1 - Física:
  - Função: Transmissão de bits brutos pela mídia física.  
  - Exemplos: Cabos de par trançado, fibra óptica, sinais elétricos ou ópticos, Wi-Fi.
  - Vulnerabilidades comuns: Wiretapping, cortes de cabo (DoS físico), jamming em redes sem fio.

O Modelo TCP/IP é dividido em quatro camadas, é mais prático e amplamente aplicado em redes reais. Ele combina algumas camadas do OSI para simplificar a comunicação.
- Camada de Aplicação:
    - Correlata às camadas OSI: Aplicação, Apresentação e Sessão.
    - Função: Gerencia a interação com o usuário e comunicação de dados de alto nível entre sistemas.  
    - Protocolos comuns: HTTP, FTP, SMTP, DNS, SSH, Telnet.
- Camada de Transporte:
    - Correlata à camada OSI: Transporte.
    - Função: Comunicação fim-a-fim, garantindo controle de fluxo e correção de erros no TCP, ou transmissão sem conexão via UDP.  
    - Protocolos comuns: TCP, UDP.
- Camada de Internet:
    - Correlata à camada OSI: Rede.
    - Função: Endereçamento lógico e roteamento de pacotes entre redes, determinando como os dados chegam ao destino.  
    - Protocolos comuns: IP, ICMP, ARP.
- Camada de Acesso à Rede:
    - Correlata às camadas OSI: Enlace de Dados e Física.
    - Função: Transmissão de dados pela mídia física e endereçamento em nível de hardware (MAC).  
    - Protocolos comuns: Ethernet, Wi-Fi.

A relação entre rede e segurança é essencial para proteger sistemas e dados, pois permite implementar estratégias que combinam práticas listadas abaixo:
- Defesa em Profundidade: Compreender cada camada e componente da rede permite implementar múltiplas camadas de proteção, evitando depender de uma única barreira de defesa.
- Visibilidade: Monitorar o tráfego em diferentes pontos da rede é essencial para identificar anomalias, padrões suspeitos e possíveis ataques.
- Segmentação: Dividir a rede em sub-redes ou VLANs limita a movimentação lateral de atacantes caso um segmento seja comprometido.
- Hardening: Reforçar a segurança de cada dispositivo de rede, desativando serviços desnecessários, aplicando senhas fortes e mantendo patches atualizados.
- Resposta a Incidentes: Conhecer a infraestrutura facilita a contenção de sistemas comprometidos e a restauração rápida da operação normal.

<a name="item1.6"><h4>1.6 Ferramentas: Kali Linux, Nmap, Wireshark</h4></a>[Back to summary](#item1)
[Lab06](labs.md#item1.6)

O propósito desta aula foi apresentar os fundamentos da análise de tráfego de rede com foco em cibersegurança. Abordou-se a importância de compreender como os dados transitam pelas redes e como ferramentas como o **Wireshark** podem ser utilizadas para detectar ameaças e realizar troubleshooting. Também foram explorados conceitos teóricos sobre o handshake TCP/IP e o fluxo HTTP, além da identificação de padrões normais e anomalias no tráfego de rede, destacando como a análise detalhada de pacotes contribui para a segurança e monitoramento das redes.

🕵️‍♂️ Wireshark   
O **Wireshark** é uma ferramenta gratuita e de código aberto para análise de protocolos de rede, que permite observar com detalhes o tráfego que circula em uma rede, quase como um microscópio digital para pacotes de dados. Na cibersegurança, ele se torna indispensável por diversas razões:
- Detecção de intrusões: possibilita identificar varreduras, tentativas de exploração e comunicação com servidores de comando e controle (C2).  
- Análise forense: auxilia na investigação de incidentes, permitindo reconstruir a sequência de eventos.  
- Resolução de problemas (troubleshooting): ajuda a diagnosticar falhas de conectividade ou lentidão na rede.  
- Engenharia reversa: facilita o entendimento de como protocolos e aplicações se comunicam.  
- Testes de segurança: permite validar o envio de payloads e monitorar as respostas de sistemas alvo em ambientes controlados.

🌐 TCP/IP   
TCP/IP constitui a base da comunicação em redes de computadores, unindo dois protocolos que se complementam para garantir que os dados cheguem corretamente aos seus destinos. O TCP (Transmission Control Protocol) é orientado à conexão e assegura a entrega confiável, ordenada e com verificação de erros dos dados, funcionando como um serviço de correio que confirma a entrega das cartas e mantém a ordem correta. O IP (Internet Protocol), por sua vez, é um protocolo sem conexão, responsável por endereçar e encaminhar os pacotes de dados, semelhante ao endereço em uma carta que garante que ela seja direcionada ao destino certo, mas sem assegurar a entrega ou a ordem. Combinados, TCP e IP formam a espinha dorsal da internet, permitindo que as aplicações se comuniquem de forma organizada e confiável.

📡 Protocolos   
Protocolos são conjuntos de regras padronizadas que permitem a comunicação entre dispositivos e sistemas em rede. Sua função principal é garantir que diferentes tecnologias consigam "conversar" de maneira estruturada e previsível. Eles são organizados em camadas, como no modelo OSI, em que cada camada é responsável por funções específicas na transmissão de dados. Na prática, exemplos de protocolos incluem:
- Camada de Aplicação: HTTP, FTP, DNS e SMTP;
- Camada de Internet: IP, ICMP e ARP;
- Camada de Transporte, TCP e UDP;
- Camada de Enlace: Ethernet e Wi-Fi.

Para profissionais de segurança, compreender esses protocolos é essencial para identificar padrões anormais no tráfego de rede e detectar possíveis invasões.

🤝 Handshake TCP   
O *Handshake TCP*, conhecido como *Three-Way Handshake*, é o processo pelo qual uma conexão TCP é estabelecida de forma confiável entre cliente e servidor. Primeiro, o cliente envia um pacote SYN (Synchronize) ao servidor, sinalizando o desejo de iniciar a conexão. Em seguida, o servidor responde com um pacote SYN-ACK (Synchronize-Acknowledge), confirmando que recebeu o pedido e está pronto para se comunicar. Por fim, o cliente envia um pacote ACK (Acknowledge), finalizando a negociação e estabelecendo a conexão. No **Wireshark**, essa sequência de três pacotes aparece no início de qualquer comunicação TCP, como HTTP ou SSH, indicando que a conexão foi formada corretamente.

📥 Fluxo HTTP   
Após o handshake TCP, a comunicação HTTP ocorre por meio de um fluxo de requisição e resposta entre cliente e servidor. Inicialmente, o cliente, como um navegador, envia uma requisição HTTP ao servidor solicitando um recurso, por exemplo, a página principal do site. O servidor processa essa requisição e responde com um código de status HTTP, geralmente `200 OK` para indicar sucesso, seguido pelo conteúdo solicitado, como HTML, CSS e imagens. No **Wireshark**, é possível visualizar a requisição GET enviada pelo cliente e a resposta `200 OK` do servidor, repetindo-se para cada recurso adicional que o navegador solicitar.

⚠️ Ataques   
O three-way handshake do TCP, embora seja um processo confiável para estabelecer conexões entre dispositivos, apresenta pontos que podem ser explorados por atacantes, tornando essencial compreender esses vetores para fortalecer a defesa. Um dos ataques mais conhecidos é o *SYN Flood*, em que o invasor envia um grande volume de pacotes SYN a um servidor sem responder aos pacotes SYN-ACK subsequentes. Isso força o servidor a manter múltiplas conexões "meio-abertas" em estado SYN-RECEIVED, consumindo memória e recursos de processamento, o que pode levar à indisponibilidade do serviço e gerar um cenário de Negação de Serviço (DoS).  

Outro vetor importante é o *TCP Session Hijacking*, que ocorre após o handshake ser concluído. Nesse caso, o atacante assume o controle de uma sessão TCP legítima, injetando pacotes com números de sequência válidos para enganar o cliente ou servidor. Técnicas comuns incluem *ARP Poisoning* ou *predição de números de sequência*, permitindo que o invasor execute comandos, altere dados ou capture informações confidenciais dentro da sessão ativa, sem necessidade de autenticação.  

Além disso, há os ataques de redefinição (*TCP Reset / RST Attack*), nos quais pacotes TCP com o flag `RST` ativado são enviados para uma ou ambas as extremidades da conexão, forçando seu encerramento imediato. Esses ataques podem interromper comunicações legítimas, gerar negação de serviço pontual e impactar mecanismos de segurança que dependem de sessões TCP persistentes, como firewalls stateful ou sistemas de detecção e prevenção de intrusões (IDS/IPS). 

O ataque *TCP Christmas Tree* consiste no envio de pacotes TCP com múltiplas flags ativadas simultaneamente, lembrando as luzes de uma árvore de Natal. Normalmente, o invasor utiliza as flags `FIN`, `URG` e `PSH` ao mesmo tempo, uma combinação rara no tráfego legítimo. O principal objetivo desse ataque é realizar varreduras de portas de forma furtiva, explorando respostas específicas do sistema alvo para identificar características do sistema operacional, técnica conhecida como *OS fingerprinting*. Embora não cause interrupção direta dos serviços, o ataque permite mapear informações sensíveis sobre o host, servindo como etapa preparatória para ataques mais avançados. Pacotes desse tipo podem ser detectados em análises de tráfego com ferramentas como **Wireshark**, através da observação de combinações incomuns de flags TCP.

Compreender esses ataques é fundamental para implementar medidas defensivas adequadas, como filtros de pacotes, limitação de conexões por IP, monitoramento de tráfego anômalo e técnicas de hardening em servidores e dispositivos de rede, garantindo maior resiliência contra exploração do handshake TCP.

📊 Análise de Tráfego   
A análise de pacotes é onde se observa detalhadamente o tráfego de rede e se extraem informações críticas sobre a comunicação entre sistemas. No **Wireshark**, essa análise ocorre em três painéis principais: o Painel de Lista de Pacotes exibe todos os pacotes capturados em ordem cronológica, mostrando informações básicas como número sequencial, timestamp, endereços de origem e destino, protocolo e resumo do conteúdo; o Painel de Detalhes do Pacote permite explorar a estrutura hierárquica do pacote selecionado, expandindo cada camada para visualizar cabeçalhos como Ethernet, IP, TCP/UDP, HTTP e outros protocolos; e o Painel de Bytes do Pacote mostra o conteúdo bruto em formato hexadecimal e ASCII, permitindo inspeção detalhada dos dados em sua forma mais primitiva.

Para tornar a análise viável em grandes volumes de pacotes, filtros são essenciais. É possível filtrar por protocolo, como digitar `http` para exibir apenas pacotes HTTP; por endereço IP, usando `ip.addr == [IP_DO_SERVIDOR]` para focar em tráfego de um host específico; ou por porta, como `tcp.port == 80` para capturar tráfego HTTP. Filtros podem ser combinados com operadores lógicos ("and", "or", "not") para criar consultas mais sofisticadas, por exemplo, `http and ip.addr == 172.18.0.3`, permitindo isolar exatamente os pacotes de interesse em cenários complexos.

A análise de tráfego com ferramentas como o **Wireshark** é uma competência essencial para profissionais de cibersegurança, pois transforma a rede, que muitas vezes é percebida como uma "caixa preta", em algo visível e compreensível. Essa visibilidade permite realizar diagnósticos precisos e conduzir investigações detalhadas. Dominar o **Wireshark** oferece um verdadeiro diferencial, proporcionando a capacidade de monitorar o tráfego em profundidade, identificar ameaças e vulnerabilidades e agir de forma proativa antes que ocorram danos significativos.

<a name="item1.7"><h4>1.7 Endereçamento IP & Subnetting</h4></a>[Back to summary](#item1)
[Lab07](labs.md#item1.7)





<a name="item1.8"><h4>1.8 Seu Dojo de Ataque no Kali Linux (CLI & GUI)</h4></a>[Back to summary](#item1)
[Lab08](labs.md#item1.8)



<a name="item1.9"><h4>1.9 Ports/Portas</h4></a>[Back to summary](#item1)
[Lab09](labs.md#item1.9)




<a name="item1.10"><h4>1.10 Desvendando SMB e SNMP: Os Pilares e as Fraquezas da Rede</h4></a>[Back to summary](#item1)
[Lab10](labs.md#item1.10)




<a name="item1.11"><h4>1.11 Introdução a Scanners de Vulnerabilidade com OpenVAS/Greenbone</h4></a>[Back to summary](#item1)






<a name="item1.12"><h4>1.12 Documentação Técnica Profissional</h4></a>[Back to summary](#item1)




<a name="item1.13"><h4>1.13 Projeto Final</h4></a>[Back to summary](#item1)

O objetivo deste projeto foi consolidar os conhecimentos adquiridos ao longo deste módulo, aplicando na prática os conceitos de reconhecimento, mapeamento de rede e segurança da informação. A proposta visou desenvolver o pensamento estratégico e analítico, estimular a documentação técnica com clareza e profissionalismo, além de entregar soluções com foco em impacto real. Seja por meio da análise de uma rede simulada em ambiente **Docker** ou da criação de uma proposta técnica para um cliente fictício, este projeto representou o primeiro passo concreto na atuação como analista de segurança.

Para a realização deste projeto final, foi possível escolher entre duas abordagens distintas:
- [Opção 1 – Projeto Técnico:](./13-projeto_final_1/) Consistiu na análise prática de uma rede simulada em um ambiente **Docker**. O desafio envolveu identificar ativos e sub-redes, mapear a infraestrutura, detectar exposições e elaborar um relatório técnico completo com recomendações e plano de ação.
- [Opção 2 – Projeto Conceitual:](./13-projeto_final_2/) Envolveu a elaboração de uma proposta técnica para um cliente fictício, focando na criação de uma arquitetura lógica de rede segura e segmentada, com justificativas técnicas e comunicação executiva adequada ao cenário corporativo.

Ambas as opções seguem a mesma estrutura de documentação e podiam ser entregues em formato `.md` ou `.pdf`.