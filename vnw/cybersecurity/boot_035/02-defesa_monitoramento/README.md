# Formação Cybersec - Módulo 2   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">vnw   <img src="https://github.com/PedroHeeger/my_tech_journey/blob/main/platforms/img/vnw.jpeg" alt="vnw" width="auto" height="25"></a>
### Software/Subject: <a href="../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_035 (Formação Cybersec)   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="25"></a>
### Module: 2. Defesa & Monitoramento (Blue Team)

#### <a href="./labs.md">Laboratórios</a>

---

Esta pasta refere-se ao módulo 2 **Defesa & Monitoramento (Blue Team)** do bootcamp [**Formação Cybersec**](../).

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

### Bootcamp Module 2 Structure:
2. <a name="item1">Módulo 2: Defesa & Monitoramento (Blue Team)<br>
  2.1 <a href="#item2.1">Arquitetura em Camadas</a><br>
  2.2 <a href="#item2.2">Hardening de Servidores Linux</a><br>
  2.3 <a href="#item2.3">Firewall & ACL</a><br>
  2.4 <a href="#item2.4">IDS e IPS</a><br>
  2.5 <a href="#item2.5">Monitoramento de Logs</a><br>
  2.6 <a href="#item2.6">Patch Management</a><br>
  2.7 <a href="#item2.7">Cloud Security</a><br>
  2.8 <a href="#item2.8">IAM e Permissionamento</a><br>
  2.9 <a href="#item2.9">Container Security Docker Bench & Trivy</a><br>
  2.10 <a href="#item2.10">NIST & Resposta a Incidentes</a><br>
  2.11 <a href="#item2.11">Projeto Final</a><br>

---

### Objective:
Implementar estratégias de defesa em profundidade e monitoramento contínuo de ambientes computacionais, por meio do fortalecimento de sistemas, configuração de firewalls e ACLs, análise de vulnerabilidades, gestão de logs com ferramentas como **Wazuh** e **ELK**, uso de IDS/IPS e aplicação de boas práticas em segurança em nuvem e resposta a incidentes.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Documento escrito em **Markdown** descrevendo todos os laboratórios realizados neste módulo.

### Development:
Este módulo foi estruturado em aulas, cada uma dedicada a um tema específico. Na maioria delas, foram realizados laboratórios práticos relacionados ao conteúdo abordado. Este arquivo README contempla exclusivamente a parte teórica, enquanto o arquivo [labs.md](./labs.md), também em **Markdown**, apresenta a resolução de todos os laboratórios do módulo.

<a name="item2.1"><h4>2.1 Arquitetura em Camadas</h4></a>[Back to summary](#item2)   
[Lab01](labs.md#item2.1)

A primeira aula abordou a construção de arquiteturas resilientes com base no conceito de Defesa em Profundidade, destacando a importância da aplicação de múltiplos mecanismos de proteção distribuídos por diferentes camadas da infraestrutura. Também foram apresentados exemplos práticos de controles por camada, além de estudos de caso que ilustram falhas e estratégias bem-sucedidas de defesa.

🔐 Defesa em Profundidade   
A abordagem de Defesa em Profundidade consiste na implementação de diversos níveis de segurança, de forma que, se uma barreira for comprometida, as demais continuem exercendo controle sobre o avanço da ameaça. Essa metodologia, inspirada em estratégias militares, distribui os mecanismos de proteção ao longo da superfície de ataque, aumentando progressivamente a dificuldade de comprometimento à medida que se aproxima de ativos mais sensíveis. Esse modelo minimiza o risco de dependência de um único ponto de defesa, reforçando a postura de segurança com redundância e diversidade de controles. Cada camada pode atuar como elemento de detecção, retardo ou bloqueio do ataque.

Exemplos de mecanismos utilizados em conjunto para compor essas defesas incluem:
- **Firewall:** Filtragem e controle do tráfego de entrada e saída.
- **Segmentação de Rede:** Isolamento de zonas internas para limitar o movimento lateral.
- **EDR (Endpoint Detection and Response):** Monitoramento avançado de atividades suspeitas em dispositivos.
- **Antivírus:** Identificação e remoção de códigos maliciosos conhecidos.
- **Autenticação Forte:** Reforço na verificação de identidade com múltiplos fatores.
- **Monitoramento Contínuo:** Coleta e análise de eventos para identificar comportamentos anômalos.

🧱 Camadas de Segurança   
A arquitetura em camadas organiza os controles de segurança em sete níveis distintos, que atuam de forma coordenada:
- **Camada Física:** Proteção de acesso físico aos equipamentos (hardwares) e ambientes (DataCenters).
- **Camada Lógica:** Barreiras digitais como autenticação, criptografia e controle de acesso.
- **Camada Humana:** Capacitação e conscientização para evitar erros e exploração de engenharia social.
- **Camada de Rede:** Segmentação, firewalls e inspeção de tráfego com sistemas como de detecção de intrusão.
- **Camada de Aplicativo:** Validação de entradas, controle de sessões e proteção contra vulnerabilidades conhecidas.
- **Camada de Dados:** Proteção da integridade, confidencialidade e disponibilidade das informações.
- **Camada de Missão Crítica:** Garantia de continuidade para os ativos e serviços essenciais à operação da organização.

🔒 Modelo Zero Trust   
O *modelo Zero Trust* rompe com a ideia tradicional de confiança baseada na localização na rede. Em vez disso, assume que nenhuma entidade — interna ou externa — deve ser considerada confiável por padrão. A segurança é reforçada por meio da validação contínua de identidade, do contexto da solicitação e do estado do dispositivo. A máxima "Never Trust, Always Verify" define a lógica dessa abordagem, que exige autenticação constante, monitoração rigorosa e restrição de privilégios em todos os níveis.

💣 Ciclo de um Ataque Ransomware   
O ransomware segue uma sequência bem estruturada com o objetivo de causar máximo impacto operacional e psicológico. As fases incluem:
- **Acesso Inicial:** Realizado por meio de phishing (e-mails com links ou anexos maliciosos), exploração de falhas de segurança (exploits de vulnerabilidades em softwares) ou credenciais expostas (como em conexões RDP).
- **Movimentação Lateral e Persistência:** Após a invasão, o código malicioso se propaga e instala mecanismos para se manter ativo, sempre buscando sistemas e dados críticos.
- **Criptografia dos Dados:** Ativação da carga maliciosa que bloqueia o acesso aos dados por meio de criptografia, tornando-os ilegíveis sem a chave de descriptografia.
- **Extorsão:** Exibição da nota de resgate exigindo pagamento, geralmente em criptomoeda, com ameaças adicionais como vazamento de dados.

📉 Exemplo de Falha por Ausência de Camadas   
Um cenário crítico pode ser observado quando há ausência de controles distribuídos: um firewall mal configurado, ausência de segmentação de rede, senhas fracas e backups armazenados no mesmo ambiente. Em uma situação como essa, a entrada de um ransomware resultaria na criptografia completa dos dados, inclusive das cópias de segurança, comprometendo toda a estrutura sem chance de recuperação rápida. A falta de camadas torna a exposição total e o impacto devastador.

<a name="item2.2"><h4>2.2 Hardening de Servidores Linux</h4></a>[Back to summary](#item2)   
[Lab02](labs.md#item2.2)

Na segunda aula, o foco esteve na introdução ao conceito de *Hardening*, destacando sua relevância no fortalecimento da segurança de sistemas. Foram apresentados os principais objetivos dessa prática, como a redução da superfície de ataque, a aplicação de medidas básicas de proteção em um servidor **Ubuntu**, e a conexão entre essas ações e os pilares da segurança da informação: *Confidencialidade, Integridade e Disponibilidade (CIA)*.

🛡️ Hardening   
*Hardening* é o processo de reforço da segurança de um sistema operacional ou serviço por meio da eliminação de componentes desnecessários, da restrinção de acessos e da aplicação de boas práticas de configuração. Além disso, envolve a monitoração contínua do ambiente para identificar comportamentos suspeitos ou inadequados. Ao reduzir a quantidade de vetores exploráveis, também se reduz a superfície de ataque, tornando o sistema mais resiliente a ameaças externas.

A adoção de práticas de hardening é essencial para evitar riscos frequentemente associados a configurações inseguras. Sem esse cuidado, um servidor pode se tornar um alvo fácil. Alguns exemplos de riscos incluem:
- **Login direto como root:** concede controle total a qualquer invasor que obtenha acesso, ampliando drasticamente o impacto de um ataque.  
- **Serviços e portas abertas sem necessidade:** expandem a superfície de ataque, criando múltiplas oportunidades para exploração.  
- **Ausência ou má configuração de logs:** compromete a capacidade de detecção e resposta a incidentes, dificultando auditorias.  
- **Negligência com práticas básicas de segurança:** torna o sistema vulnerável a ameaças conhecidas, que podem ser exploradas de forma automatizada com pouco esforço técnico.

Várias ações podem ser aplicadas para fortalecer a segurança de um servidor, cada uma focada em uma área específica do sistema:
- **Acesso remoto via SSH:**  
  - Desabilitar o login como root.  
  - Evitar o uso de senhas, priorizando autenticação por chave.
- **Gerenciamento de usuários:**  
  - Restringir privilégios com o uso do `sudo`.  
  - Remover contas antigas ou desnecessárias.
- **Serviços em execução:**  
  - Analisar e desativar serviços não essenciais para reduzir pontos de exposição.
- **Firewall:**  
  - Limitar o tráfego apenas às portas realmente necessárias.
- **Controle de permissões:**  
  - Proteger arquivos sensíveis contra acessos indevidos.
- **Auditoria e logs:**  
  - Habilitar mecanismos de auditoria, como o **auditd**.  
  - Manter rotina de revisão dos logs para identificar atividades suspeitas e manter a integridade do sistema.

📘 Guias e Padrões de Hardening   
Diversos guias e padrões de hardening são utilizados como referência para reforçar a segurança de sistemas e atender a requisitos de conformidade:
- **CIS Benchmarks:**  
  - Oferece recomendações práticas para sistemas operacionais, aplicativos, nuvens e outros.  
  - Possui perfis de segurança ajustáveis (nível 1 e 2).
- **NIST SP 800-53:**  
  - Estrutura abrangente voltada a ambientes corporativos e regulados.  
  - Foca em controles organizacionais.
- **STIGs da DISA:**  
  - Padrões técnicos exigidos em ambientes militares dos EUA.  
  - Validação automatizada via ferramentas como o **STIG Viewer**.
- **Microsoft Baselines:**  
  - Prontos para **Windows** e outros produtos.  
  - Otimizados para uso com **Active Directory**.
- **Ferramentas de automação:**  
  - **Ansible**, **CIS-CAT** e **OpenSCAP** permitem automatizar verificação e aplicação dos padrões em larga escala.

<a name="item2.3"><h4>2.3 Firewall & ACL</h4></a>[Back to summary](#item2)   
[Lab03](labs.md#item2.3)

A terceira aula teve como objetivo compreender o conceito de firewall, seu funcionamento e as diferentes formas de implementação, diferenciando um firewall de host de um firewall de borda. Também foram abordadas as listas de controle de acesso (ACLs) e a aplicação prática de regras com **iptables** no **Ubuntu**, além da utilização do **pfSense** para simular um firewall de rede.

🧱 Firewall   
Um firewall pode ser entendido como um “porteiro digital”, posicionado entre redes distintas, por exemplo, entre a internet e a rede interna, responsável por decidir quais conexões são permitidas, bloqueadas ou redirecionadas. Essa decisão é tomada com base em regras que consideram endereços IP, portas e protocolos. Existem dois tipos principais de firewall:
- **Firewall de host:** atua em um único sistema operacional, controlando o tráfego daquele equipamento. É útil para proteger servidores e estações de trabalho, mesmo que já estejam atrás de um firewall de rede.  
- **Firewall de borda (ou de rede):** fica na fronteira entre redes diferentes e protege múltiplos dispositivos ao mesmo tempo, funcionando como primeira barreira de defesa.

📋 ACLs (Access Control Lists)   
As ACLs (Access Control Lists) funcionam como um conjunto de regras que determinam quem pode acessar determinados recursos, com base em parâmetros como IP, porta e protocolo. Elas são amplamente aplicadas não apenas em firewalls, mas também em switches e roteadores. Um exemplo prático seria permitir que apenas um endereço IP específico tenha acesso à porta 22 (SSH) de um servidor.

🚧 iptables   
No ambiente **Linux**, o **iptables** é a ferramenta nativa para configuração de regras de firewall. Ele opera com base em tabelas, cadeias (chains) e regras, permitindo desde políticas restritivas — como bloquear todo o tráfego por padrão — até permissões específicas para serviços essenciais. A ordem das regras é um ponto crítico, pois o sistema avalia de cima para baixo e aplica a primeira que corresponder ao pacote analisado.

🧱 pfSense   
Já o **pfSense**, baseado em **FreeBSD**, oferece uma solução de firewall de rede com interface gráfica, o que facilita a configuração e o gerenciamento das políticas de segurança. Entre seus recursos, destacam-se o suporte a NAT, segmentação de rede por VLANs, aplicação de regras específicas por interface e geração de logs detalhados para auditoria e diagnóstico.

⚖️ Comparação   
Enquanto o **iptables** é mais técnico e voltado para administração local via linha de comando, o **pfSense** fornece uma abordagem visual e centralizada para a proteção de redes inteiras. Em ambos os casos, o monitoramento por meio de logs e ferramentas de análise, como **tcpdump**, **nmap** e **Wireshark**, é fundamental para manter a visibilidade e o controle sobre o tráfego.

<a name="item2.4"><h4>2.4 IDS e IPS</h4></a>[Back to summary](#item2)   
[Lab04](labs.md#item2.4)

A quarta aula foi dedicada ao estudo dos IDS (Intrusion Detection System) e IPS (Intrusion Prevention System), abordando suas funções, diferenças, aplicações e exemplos reais de uso. A proposta foi compreender como essas tecnologias contribuem para a defesa de redes e sistemas, quando utilizar cada uma e de que forma podem ser combinadas para uma proteção mais completa.

👁️ Sentinelas da Rede   
Para entender melhor o papel do IDS e do IPS, é possível imaginar uma rede como uma fortaleza: existem várias entradas — portas, janelas e passagens escondidas — e o fluxo de pessoas é constante. No mundo digital, ataques podem ocorrer sem serem percebidos, e essas ferramentas funcionam como sentinelas: o IDS observa e alerta sobre movimentos suspeitos, enquanto o IPS intervém e impede a ação maliciosa.

🛡️ IDS – O Vigia da Rede   
O IDS tem como objetivo identificar tráfego suspeito ou malicioso, mas não interfere diretamente na comunicação. Atua como um vigia que observa e reporta incidentes. Pode ser classificado em:  
- NIDS (Network IDS): monitora toda a rede;  
- HIDS (Host IDS): acompanha a atividade de um único sistema.  

A detecção pode ser feita por:  
- Assinaturas: compara pacotes com padrões conhecidos;  
- Anomalias: identifica comportamentos fora do padrão.  

Exemplos práticos: Snort, Suricata, Zeek.

⚡ IPS – O Interceptor de Ameaças   
O IPS atua de forma inline — o tráfego passa por ele antes de chegar ao destino — permitindo detectar e bloquear ameaças em tempo real. Pode gerar falsos positivos e adicionar latência à rede. Exemplos: Suricata em modo IPS, Cisco Firepower, Palo Alto Threat Prevention.

📊 Resumo das Diferenças   
- IDS: fora da linha de tráfego, apenas alerta; não impede ataques;  
- IPS: bloqueia automaticamente na linha de tráfego; pode impactar performance;  
- Melhor prática: usar ambos, combinando visibilidade e prevenção.

🕵️ Táticas de Evasão   
Adversários experientes podem:  
- Fragmentar pacotes;  
- Usar portas não convencionais;  
- Ofuscar código malicioso;  
- Realizar ataques lentos.  

Ferramentas modernas como Suricata e Snort já mitigam muitas dessas estratégias.

🏢 Aplicações no Ambiente Corporativo   
- IPS na borda: filtra ameaças externas;  
- IDS interno: monitora movimentos laterais e comportamentos anômalos;  
- Ambientes menos críticos: pode-se usar apenas IDS;  
- Setores de alta disponibilidade: IPS é indispensável.

<a name="item2.5"><h4>2.5 Monitoramento de Logs</h4></a>[Back to summary](#item2)   
[Lab05](labs.md#item2.5)

A aula abordou conceitos e práticas de monitoramento de logs e eventos, destacando a importância de registrar, centralizar e analisar atividades de sistemas, redes e aplicações para detecção de incidentes e suporte a auditorias. Foram apresentados os tipos de logs, a diferença entre logs e eventos, desafios de monitoramento e as principais ferramentas e plataformas utilizadas, incluindo SIEMs e stacks open-source como **Wazuh** e **ELK**.

💻 Logs   
Logs são registros cronológicos que documentam atividades em sistemas operacionais, aplicações e dispositivos de rede. Exemplos incluem logs de autenticação (login/logout), registros de firewall (pacotes bloqueados) e logs de aplicações (erros e requisições). Eles funcionam como evidências essenciais em investigações, auditorias e resposta a incidentes.

📊 Eventos   
Eventos são ocorrências significativas extraídas da análise de logs. Enquanto um log representa dados brutos (ex.: “falha de login do usuário admin às 10:32”), um evento contextualiza esses dados (ex.: “cinco falhas de login consecutivas indicam possível ataque de força bruta”). Podem ser classificados como informativos, alertas ou críticos, dependendo da gravidade e necessidade de ação imediata.

🌐 Origens de Logs e Eventos   
Logs e eventos podem ser gerados por diferentes fontes:  
- **Sistemas operacionais:** syslog, Windows Event Viewer;  
- **Redes:** roteadores, firewalls, IDS/IPS;  
- **Aplicações:** servidores web (Apache, Nginx), bancos de dados;  
- **Cloud e containers:** Kubernetes, AWS CloudTrail, Docker;  
- **Segurança:** antivírus, EDR, WAF.  

Os principais desafios incluem alto volume de dados, formatos variados (JSON, texto, XML), correlação entre eventos distribuídos e a necessidade de análise centralizada em tempo real.

🛠️ Ferramentas de Coleta e Centralização   
Ferramentas clássicas incluem **syslog** (padrão de envio de logs em rede) e **Windows Event Forwarding**. Para centralização e análise, destacam-se soluções como **Graylog**, **Splunk**, **Filebeat** e **Logstash**.

📈 SIEM   
Um **SIEM (Security Information and Event Management)** é uma plataforma que coleta, correlaciona e analisa eventos de segurança em tempo real. Suas funções principais incluem:  
- Centralização de logs de múltiplas fontes;  
- Correlação de eventos para identificar padrões suspeitos;  
- Alertas automáticos sobre comportamentos anômalos;  
- Relatórios e suporte a compliance (LGPD, PCI-DSS, ISO).  

Exemplo prático: um SIEM pode receber logs de firewall, servidor Linux e aplicações web, correlacionar falhas de login com escaneamento de portas e identificar um possível ataque em andamento. Ferramentas conhecidas incluem **Wazuh**, **Splunk**, **QRadar**, **ArcSight** e **Elastic SIEM**.

🛡️ Wazuh   
O **Wazuh** é uma plataforma open-source que combina SIEM e XDR, oferecendo coleta e normalização de logs, detecção de intrusão (HIDS), análise de integridade de arquivos (FIM) e regras de correlação com alertas. Integra-se ao **Elastic Stack (ELK)** para visualização e dashboards.

📊 ELK Stack   
O **ELK Stack** consiste em:  
- **Elasticsearch:** banco de busca e indexação de logs;  
- **Logstash:** pipeline de ingestão e processamento;  
- **Kibana:** visualização e dashboards interativos.  

A integração **Wazuh** + **ELK** permite transformar logs coletados em informações acionáveis, como tentativas de login inválidas, atividades suspeitas em arquivos e alertas de ataques conhecidos (SQLi, XSS).

🏁 Conclusão   
Logs e eventos representam a memória digital de uma infraestrutura. Ferramentas como **Wazuh** e **ELK** permitem transformar dados brutos em insights estratégicos de segurança, essenciais para detecção de ataques, resposta rápida a incidentes e conformidade regulatória.

<a name="item2.6"><h4>2.6 Patch Management</h4></a>[Back to summary](#item2)   
[Lab06](labs.md#item2.6)

Esta aula tratou da gestão de patches, explicando sua importância para a segurança, os desafios de aplicá-los em ambientes heterogêneos e como a automação otimiza o processo. Foram apresentados ciclos, ferramentas, boas práticas e casos reais que evidenciam os riscos de falhas no Patch Management.

💻 Patch   
Patches não são apenas correções de vulnerabilidades; eles também abrangem bugs, melhorias de performance e compatibilidade. Considerando que cerca de 80% dos ataques exploram falhas já conhecidas, manter sistemas atualizados é essencial para reduzir riscos.

🔄 Ciclo de Patch Management   
O gerenciamento de patches segue etapas bem definidas:  
1. **Inventário:** identificar todos os ativos e suas versões;  
2. **Monitoramento:** acompanhar atualizações e CVEs relevantes;  
3. **Testes:** validar patches críticos antes da aplicação em produção;  
4. **Deploy:** aplicar as atualizações de forma planejada e automatizada;  
5. **Validação & Relatórios:** confirmar a aplicação correta e gerar evidências.

⚠️ Desafios do Patch Management   
A diversidade de sistemas (Linux, Windows, cloud, containers), janelas de manutenção restritas, riscos de incompatibilidade, falsos negativos e sistemas fora do radar (Shadow IT) são obstáculos comuns. Automação é a chave para reduzir erros humanos e acelerar a aplicação de atualizações críticas.

🛠️ Ferramentas e Automação   
Para ambientes distintos, há soluções específicas:  
- **Linux:** unattended-upgrades (Debian/Ubuntu), yum-cron, dnf-automatic (Red Hat/CentOS);  
- **Windows:** WSUS, SCCM e Intune;  
- **Containers:** atualização automática de imagens base e scanners como Trivy e Clair;  
- **Orquestração:** Ansible, Puppet, Chef, SaltStack, CI/CD pipelines;  
- **Cloud:** AWS Systems Manager (Patch Manager), Azure Update Manager, Google OS Config.

🔐 Patches e Segurança   
O Patch Management deve ser integrado à Gestão de Vulnerabilidades. Priorizar patches críticos usando métricas como CVSS e monitorar o MTTP (Mean Time To Patch) garante que falhas conhecidas sejam corrigidas rapidamente, evitando incidentes de grande impacto.

📉 Casos Reais   
- **Equifax (2017):** Apache Struts vulnerável, sem patch -> 147 milhões de pessoas expostas;  
- **WannaCry (2017):** falha SMB corrigida pela Microsoft, mas patches não aplicados em milhares de sistemas.  

🚀 Estratégias de Deploy   
- **Patch Tuesday:** ciclo fixo de atualizações da Microsoft;  
- **Rolling Updates:** atualizações contínuas em Linux e containers;  
- **Blue/Green Deploy:** duas versões em paralelo, swap após validação;  
- **Canary Release:** patch aplicado em parte da frota antes do rollout completo.

📋 Boas Práticas   
- Classificar patches por criticidade (crítico, alto, médio, baixo);  
- Definir SLA de correção (ex.: críticos em até 48h);  
- Testar antes de aplicar em produção;  
- Ter plano de rollback definido (snapshot, backup);  
- Monitorar logs de atualização.

🏛️ Integração com Governança   
Políticas corporativas devem tornar o Patch Management mandatório, definindo responsabilidades, frequência e integração com compliance e auditorias (ISO 27001, NIST CSF, PCI-DSS, LGPD). Evidências auditáveis de aplicação, taxas de conformidade e MTTP são fundamentais.

🏁 Conclusão   
Patch Management automatizado significa segurança contínua. Atrasos na aplicação de patches representam riscos críticos, enquanto a automação reduz MTTP, evita crises e assegura conformidade.

<a name="item2.7"><h4>2.7 Cloud Security</h4></a>[Back to summary](#item2)   
[Lab07](labs.md#item2.7)

A aula explorou os conceitos essenciais de segurança em ambientes de nuvem, destacando o modelo de responsabilidade compartilhada, riscos de má configuração e controles de acesso e rede em um ambiente simulado.

☁️ Cloud Computing     
Cloud computing consiste na entrega de recursos de TI sob demanda, como servidores, armazenamento, bancos de dados, redes, software, análise e inteligência, acessíveis pela internet. Seus principais benefícios incluem:  
- **Acesso sob demanda:** recursos disponíveis instantaneamente, sem necessidade de hardware físico;  
- **Pagamento conforme uso:** custos convertidos de CAPEX (Depesa de capital) para OPEX (Despesa operacional), pagando apenas pelo que é consumido;  
- **Escalabilidade e flexibilidade:** ajuste rápido de recursos para atender às necessidades do negócio.

🌐 Principais Provedores   
- **AWS (Amazon Web Services):** pioneiro e maior provedor de nuvem, com vasta gama de serviços, adequado para praticamente qualquer tipo de carga de trabalho;  
- **Microsoft Azure:** integrado ao ecossistema Microsoft, ideal para empresas que já utilizam suas soluções;  
- **Google Cloud Platform (GCP):** forte em dados, análise, machine learning e inteligência artificial, apoiado pela infraestrutura do Google.

📦 Categorias de Serviços na Nuvem   
Empresas estão migrando diferentes operações para a nuvem em busca de agilidade, otimização de custos e segurança:  
- **Armazenamento e Bancos de Dados:** arquivos simples a bancos relacionais e NoSQL, com soluções escaláveis e duráveis;  
- **Aplicações Web e Mobile:** hospedagem de sites, e-commerce, SaaS e aplicativos móveis, garantindo alta disponibilidade global;  
- **Ambientes de Desenvolvimento e Testes:** criação e desativação rápida de ambientes, agilizando o ciclo de vida de software;  
- **Backup e Recuperação de Desastres:** cópias de segurança e planos de continuidade com segurança e eficiência.

🔐 Cloud Security   
Embora a nuvem traga escalabilidade e custos reduzidos, mais de 70% dos incidentes resultam de falhas de configuração. A segurança não é automática: cabe ao cliente configurar acessos, proteger dados e implementar controles de rede.

⚖️ Modelo de Responsabilidade Compartilhada   
- **Provedor (AWS, Azure, GCP):** segurança da infraestrutura física, hardware, rede e datacenters;  
- **Cliente:** configuração de acesso, proteção de dados, firewalls, logs e criptografia.  

🛠️ Modelos de Serviço e Responsabilidade   
- **FaaS (Functions as a Service):** cliente gerencia apenas dados e uso de funções;  
- **SaaS (Software as a Service):** cliente gerencia apenas uso e dados;  
- **PaaS (Platform as a Service):** provedor gerencia a maior parte da infraestrutura;  
- **IaaS (Infrastructure as a Service):** cliente assume quase todas as responsabilidades.  

🛡️ Pilares da Segurança na Nuvem   
- **IAM (Identity and Access Management):** controle de identidades e permissões;  
- **Proteção de Rede:** Security Groups, firewalls e VPCs;  
- **Proteção de Dados:** criptografia em trânsito e em repouso;  
- **Monitoramento e Auditoria:** logs, alertas e conformidade regulatória.

<a name="item2.8"><h4>2.8 IAM e Permissionamento</h4></a>[Back to summary](#item2)   
[Lab08](labs.md#item2.8)

Esta aula abordou o gerenciamento de identidades e permissões na nuvem, destacando boas práticas de IAM, configuração de redes seguras na AWS e defesa em camadas para proteção de recursos.

🔑 IAM – A Chave da Nuvem   
No mundo digital, o IAM (Identity and Access Management) funciona como a chave que abre portas: define quem pode acessar recursos, o que pode fazer e onde pode atuar. Um mau gerenciamento de permissões pode comprometer toda a infraestrutura.  

Componentes Fundamentais do IAM:   
- **Usuários:** identidades individuais;  
- **Grupos:** coleções de permissões aplicadas a vários usuários;  
- **Roles:** credenciais temporárias para serviços;  
- **Policies:** regras em JSON que definem ações permitidas ou negadas.  

**Princípio do Menor Privilégio (PoLP):** forneça apenas o acesso necessário, nada além.  

⚠️ Armadilhas Comuns:   
- Políticas excessivamente amplas (`"Action": "*"` e `"Resource": "*"`);
- Senhas fracas;
- Ausência de MFA;
- Chaves de acesso expostas em repositórios públicos;
- Uso diário da conta root.

🌐 Redes na AWS – A Cidade Murada   
A infraestrutura de rede na nuvem deve ser planejada como uma cidade segura:  
- **VPC (Virtual Private Cloud):** a cidade murada que abriga seus recursos;  
- **Subnets:** bairros públicos e privados;  
- **Security Groups:** guardas que protegem cada instância, atuando como firewalls stateful.  

🚫 Más práticas comuns:   
- Banco de dados em subnet pública;
- Security Groups com acesso 0.0.0.0/0 para SSH ou RDP;
- Uso exclusivo do root user;
- Permissões administrativas aplicadas a todos os usuários.

🛡️ Defesa em Camadas na Nuvem   
A segurança eficaz na AWS depende de múltiplas barreiras interconectadas:  
- **IAM:** define com precisão quem pode acessar quais recursos;  
- **Security Groups:** controlam o tráfego permitido e negado por instância;  
- **NACLs (Network Access Control Lists):** firewalls stateless em nível de subnet, filtrando tráfego antes de chegar aos Security Groups;  
- **MFA, Logs e Monitoramento:** autenticação multifator, registros detalhados (CloudTrail, VPC Flow Logs) e monitoramento contínuo (CloudWatch, GuardDuty) permitem detecção e resposta rápida a incidentes.

📖 Caso Real de Falha   
Um desenvolvedor júnior configurou rapidamente um banco de dados em subnet pública, liberou acesso completo via SG e aplicou uma policy IAM ampla. Um scanner automatizado detectou a vulnerabilidade, e credenciais expostas no GitHub foram exploradas, resultando na exfiltração de dados críticos. Moral: a pressa na nuvem pode custar milhões.

✅ Boas Práticas Recomendadas:   
- Banco de dados em subnet privada;  
- Aplicações web em subnet pública com Security Groups restritos;  
- IAM Developer com permissões mínimas (ex.: apenas listar e ler S3);  
- IAM Admin protegido com MFA, nunca hardcoded;  
- Logs no CloudTrail para rastreabilidade completa.  

💡 Conclusão:   
O IAM é a chave da nuvem, redes seguras são os muros da cidade e a segurança na AWS depende da combinação de pessoas, processos e tecnologia.

<a name="item2.9"><h4>2.9 Container Security Docker Bench & Trivy</h4></a>[Back to summary](#item2)   
[Lab09](labs.md#item2.9)

A aula explicou sobre a segurança de containers, destacando riscos comuns, boas práticas, integração com DevSecOps e ferramentas para proteger hosts e imagens.

🐳 Containers – Agilidade com Riscos   
Containers são rápidos, leves e práticos, mas não garantem segurança automática. É fundamental aplicar controles, monitoramento e boas práticas para reduzir vulnerabilidades.

⚠️ Problemas Comuns em Containers:   
- Imagens com vulnerabilidades conhecidas (CVEs);  
- Containers rodando como root;  
- Imagens antigas sem updates;  
- Secrets expostos no código ou variáveis de ambiente;  
- Configuração fraca do host Docker.

🔄 Segurança no Ciclo de Vida – DevSecOps   
A proteção de containers deve ser integrada ao ciclo de vida da aplicação:  
- Escaneamento automático de imagens no pipeline CI/CD;  
- Monitoramento contínuo de CVEs;  
- Reforço de configurações do host Docker;  
- Auditoria e atualização periódica.

🛠️ Ferramentas de Segurança   
- **Docker Bench for Security**: 
  - Ferramenta oficial que avalia a configuração do host e do daemon baseada no CIS Docker Benchmark.
  - Exemplos de checagens:  
    - Containers não rodando como root;  
    - Namespaces habilitados;  
    - Logging configurado corretamente.

- **Trivy**: 
  - Scanner open-source da **Aqua Security** que verifica:  
    - Imagens de containers;  
    - Repositórios de código;  
    - Configurações IaC e Kubernetes;  
    - Secrets expostos.  
  - Trivy usa **CVSS** para classificar vulnerabilidades.

⚖️ Docker Bench vs. Trivy   
- **Docker Bench:** foco na configuração do host/daemon e segurança do ambiente;  
- **Trivy:** foco em vulnerabilidades de imagens e segurança da aplicação;  
- **Complementares:** host seguro + imagem segura = proteção completa.

✅ Boas Práticas Recomendadas:   
- Usar imagens oficiais e minimalistas (Alpine, Distroless);  
- Rodar containers como usuário não-root;  
- Aplicar scans automáticos no pipeline CI/CD;  
- Monitorar CVEs críticos (CVSS ≥ 9);  
- Atualizar imagens e rebuildar periodicamente.

💡 Conclusão:   
Containers oferecem agilidade e escalabilidade, mas precisam de segurança dedicada. Docker Bench fortalece o host, Trivy reduz riscos nas imagens, e a segurança de containers é um processo contínuo.

<a name="item2.10"><h4>2.10 NIST & Resposta a Incidentes</h4></a>[Back to summary](#item2)   
[Lab10](labs.md#item2.10)

A última aula do módulo mostrou como aplicar conceitos de resposta a incidentes na prática, seguindo frameworks reconhecidos, como os do NIST, e como isso impacta a atuação profissional em cibersegurança.

📘 NIST – Referência em Segurança da Informação   
O **National Institute of Standards and Technology (NIST)** é uma autoridade global em padrões e boas práticas de cibersegurança. Suas publicações servem como guia para empresas e governos, ajudando a estruturar processos de proteção e resposta.  

Principais Guias:  
- **Cybersecurity Framework (CSF):** ajuda a gerenciar riscos de segurança;  
- **SP 800-53:** catálogo de controles de segurança;  
- **SP 800-61:** guia de tratamento e resposta a incidentes.

🚨 Por que a resposta a incidentes é essencial?   
Incidentes de segurança acontecem em qualquer organização, independentemente do porte. O fator crítico é a forma como são tratados:  
- Sem um plano estruturado: a organização enfrenta desorganização, perdas de dados e prejuízos financeiros significativos;  
- Com processos definidos: é possível conter rapidamente os danos, aprender com a ocorrência e reforçar os controles de segurança.  

Incidentes não são uma questão de “se”, mas de “quando” vão ocorrer, tornando a preparação essencial.

🔄 Ciclo de Resposta a Incidentes do NIST   
O framework propõe um ciclo em quatro etapas, que se reforçam mutuamente:  
1. **Preparação**: políticas, treinamento, ferramentas prontas e exercícios simulados;  
2. **Detecção e Análise**: identificar incidentes, validar alertas, classificar tipo e impacto, priorizar ações;  
3. **Contenção, Erradicação e Recuperação**: isolar sistemas afetados, remover ameaças e restaurar serviços com segurança;  
4. **Lições Aprendidas**: revisar ações, corrigir falhas e aprimorar políticas e processos.

🛠️ Detalhes do Ciclo   
- **Preparação:** preparar playbooks, treinar equipes, ter ferramentas como SIEM, EDR e SOAR operacionais;  
- **Detecção & Análise:** monitorar alertas, confirmar se é incidente real, avaliar impacto e urgência;  
- **Contenção, Erradicação & Recuperação:** bloquear acessos comprometidos, eliminar malwares e restaurar sistemas com monitoramento reforçado;  
- **Lições Aprendidas:** reuniões pós-incidente para avaliar acertos e erros, melhorar processos e documentar evidências para auditoria.

🏢 Carreiras e Ferramentas   
- **Locais de atuação:** SOCs, CSIRTs, CERTs e consultorias especializadas.  
- **Perfis comuns:** Analista SOC, Forense Digital, Threat Hunter e Gerente de IR.  
- **Ferramentas:** SIEM (Splunk, ELK, Wazuh), EDR/XDR (CrowdStrike, SentinelOne), IDS/IPS (Snort, Suricata), SOAR.

📊 Tendências de Mercado   
- Crescente demanda por profissionais de IR;  
- Regulamentações obrigando respostas estruturadas (LGPD, ISO 27035);  
- Uso crescente de IA e automação em SOCs;  
- Expansão do modelo de IR as a Service.

💡 Conclusão   
O NIST fornece a estrutura necessária para organizar a resposta a incidentes. Seguir o ciclo de preparação, detecção, contenção e aprendizado transforma caos em controle e fortalece a maturidade em segurança. Profissionais capacitados nesse processo são cada vez mais valorizados.

<a name="item2.11"><h4>2.11 Projeto Final</h4></a>[Back to summary](#item2)   
[Material do Projeto](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/tree/main/modulo2-defesa-monitoramento/projeto-final)

O desafio final deste módulo teve como objetivo consolidar os conhecimentos adquiridos, colocando em prática a capacidade de defesa, monitoramento e resposta a incidentes. Foram disponibilizadas duas opções de abordagem — uma prática e outra conceitual — além de um desafio bônus. Em todas as alternativas, o principal entregável foi um documento técnico, ao qual deveriam estar vinculados todos os anexos. Esse documento, em formato **Markdown** ou **PDF**, precisava seguir requisitos mínimos de estrutura e qualidade:  
- **Estrutura mínima:** capa, sumário executivo, objetivo, escopo, metodologia, diagrama, evidências/diagnóstico, recomendações, plano de ação, conclusão e anexos.  
- **Clareza executiva:** obrigatoriedade de 1 página dedicada ao sumário executivo.  
- **Rastreabilidade:** referência a prints e logs (com data/hora) e inclusão de arquivos de configuração como anexos.  

Projetos: 
- [Opção 1 – Projeto Técnico](./11-projeto_final_1/): Criação de um ambiente defensivo, simulação de ataques controlados e validação da defesa, monitoramento e resposta com evidências documentadas.  
- [Opção 2 – Projeto Conceitual](./11-projeto_final_2/): Atuação como consultor Blue Team em um cenário fictício, elaborando defesa em profundidade, plano de monitoramento e resposta a incidentes baseado no NIST.  
- [Desafio Bônus](./11-desafio_bonus/): Atividade complementar para reforçar a aplicação prática e aprofundar os conceitos do módulo.  