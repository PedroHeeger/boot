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

### Bootcamp Module 2 Structure
1. <a name="item1">Módulo 2: Defesa & Monitoramento (Blue Team)<br>
    1.1. <a href="#item1.1">Arquitetura em Camadas</a><br>
    1.2. <a href="#item1.2">Hardening de Servidores Linux</a><br>
    1.3. <a href="#item1.3">Firewall & ACL</a><br>
    1.4. <a href="#item1.4">IDS e IPS</a><br>
    1.5. <a href="#item1.5"></a><br>
    1.6. <a href="#item1.6"></a>Monitoramento de Logs<br>
    1.7. <a href="#item1.7"></a>Patch Management<br>
    1.8. <a href="#item1.8"></a>Cloud Security<br>

---

### Objective:
Implementar estratégias de defesa em profundidade e monitoramento contínuo de ambientes computacionais, por meio do fortalecimento de sistemas, configuração de firewalls e ACLs, análise de vulnerabilidades, gestão de logs com ferramentas como **Wazuh** e **ELK**, uso de IDS/IPS e aplicação de boas práticas em segurança em nuvem e resposta a incidentes.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Documento escrito em **Markdown** descrevendo todos os laboratórios realizados neste módulo.

### Development:
Este módulo foi estruturado em aulas, cada uma dedicada a um tema específico. Na maioria delas, foram realizados laboratórios práticos relacionados ao conteúdo abordado. Este arquivo README contempla exclusivamente a parte teórica, enquanto o arquivo [labs.md](./labs.md), também em **Markdown**, apresenta a resolução de todos os laboratórios do módulo.

<a name="item1.1"><h4>1.1 Arquitetura em Camadas</h4></a>[Back to summary](#item1)   
[Lab01](labs.md#item1.1)

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

<a name="item1.2"><h4>1.2 Hardening de Servidores Linux</h4></a>[Back to summary](#item1)   
[Lab02](labs.md#item1.2)

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

<a name="item1.3"><h4>1.3 Firewall & ACL</h4></a>[Back to summary](#item1)   
[Lab03](labs.md#item1.3)

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

<a name="item1.4"><h4>1.4 IDS e IPS</h4></a>[Back to summary](#item1)   
[Lab04](labs.md#item1.4)

A quarta aula foi dedicada ao estudo dos IDS (Intrusion Detection System) e IPS (Intrusion Prevention System), abordando suas funções, diferenças, aplicações e exemplos reais de uso. A proposta foi compreender como essas tecnologias contribuem para a defesa de redes e sistemas, quando utilizar cada uma e de que forma podem ser combinadas para uma proteção mais completa.

👁️ Sentinelas   
Para entender melhor o papel do IDS e do IPS, é possível imaginar uma rede como uma fortaleza: existem várias entradas — portas, janelas e passagens escondidas — e o fluxo de pessoas é constante. No mundo digital, ataques podem ocorrer sem serem percebidos, e essas ferramentas funcionam como sentinelas: o IDS observa e alerta sobre movimentos suspeitos, enquanto o IPS intervém e impede a ação maliciosa.

O IDS tem como objetivo identificar tráfego suspeito ou malicioso, mas não interfere diretamente na comunicação. Atua como um vigia que observa e reporta incidentes. Pode ser classificado em:
- NIDS (Network IDS), que monitora toda a rede;
- HIDS (Host IDS), que acompanha a atividade de um único sistema.

A detecção pode ser feita por assinaturas, comparando pacotes com padrões conhecidos, ou por análise de anomalias, que busca comportamentos fora do padrão. Entre os exemplos práticos estão ferramentas como **Snort**, **Suricata** e **Zeek**, capazes de detectar desde um simples port scan até tentativas de exploração mais elaboradas.

O IPS, por sua vez, atua de forma inline — o tráfego passa por ele antes de chegar ao destino —, o que permite não apenas detectar como também bloquear ameaças em tempo real. Embora ofereça uma camada adicional de segurança, pode gerar falsos positivos, bloqueando tráfego legítimo, além de adicionar latência à rede. Soluções como **Suricata** em modo IPS, **Cisco Firepower** e **Palo Alto Threat Prevention** exemplificam seu uso.

De forma resumida:
- IDS: fora da linha de tráfego, apenas alerta, não afeta o fluxo de dados, mas não impede ataques;
- IPS: na linha de tráfego, bloqueia automaticamente, pode impactar a performance e, em casos de configuração incorreta, interromper comunicações legítimas;
- Melhor prática: utilizar ambos, combinando visibilidade e prevenção.

Entretanto, adversários experientes desenvolvem técnicas de evasão para tentar driblar esses sistemas, como fragmentar pacotes, usar portas não convencionais, ofuscar o código malicioso ou adotar ataques lentos que passam despercebidos. Ferramentas modernas como **Suricata** e **Snort** já incorporam mecanismos para mitigar tais estratégias.

No contexto corporativo, é comum empregar IPS na borda para filtrar ameaças externas e IDS internamente para monitorar movimentos laterais e comportamentos anômalos dentro da rede. Em ambientes menos críticos, pode-se adotar apenas IDS para garantir visibilidade sem riscos de interrupção, enquanto em setores que demandam alta disponibilidade e segurança, o IPS torna-se indispensável.

<a name="item1.5"><h4>1.5 </h4></a>[Back to summary](#item1)   
[Lab05](labs.md#item1.5)











<a name="item1.6"><h4>1.6 Monitoramento de Logs</h4></a>[Back to summary](#item1)   
[Lab06](labs.md#item1.6)

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

<a name="item1.7"><h4>1.7 Patch Management</h4></a>[Back to summary](#item1)   
[Lab07](labs.md#item1.7)

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

<a name="item1.8"><h4>1.8 Cloud Security</h4></a>[Back to summary](#item1)   
[Lab08](labs.md#item1.8)

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





