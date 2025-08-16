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
    1.2. <a href="#item1.2">Hardening</a><br>
    1.3. <a href="#item1.3">Firewall & ACL</a><br>
    1.4. <a href="#item1.4">IDS e IPS</a><br>
    1.5. <a href="#item1.5"></a><br>

---

### Objective:
Implementar estratégias de defesa em profundidade e monitoramento contínuo de ambientes computacionais, por meio do fortalecimento de sistemas, configuração de firewalls e ACLs, análise de vulnerabilidades, gestão de logs com ferramentas como **Wazuh** e **ELK**, uso de IDS/IPS e aplicação de boas práticas em segurança em nuvem e resposta a incidentes.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Documento escrito em **Markdown**, descrevendo todos os laboratórios realizados neste módulo.

### Development:
Este módulo foi estruturado em aulas, cada uma dedicada a um tema específico. Na maioria delas, foram realizados laboratórios práticos relacionados ao conteúdo abordado. Este arquivo README contempla exclusivamente a parte teórica, enquanto o arquivo [labs.md](./labs.md), também em Markdown, apresenta a resolução de todos os laboratórios do módulo.

<a name="item1.1"><h4>1.1 Arquitetura em Camadas</h4></a>[Back to summary](#item1)   
[Lab01](labs.md#item1.1)

A primeira aula abordou a construção de arquiteturas resilientes com base no conceito de Defesa em Profundidade, destacando a importância da aplicação de múltiplos mecanismos de proteção distribuídos por diferentes camadas da infraestrutura. Também foram apresentados exemplos práticos de controles por camada, além de estudos de caso que ilustram falhas e estratégias bem-sucedidas de defesa.

🔐 Defesa em Profundidade
A abordagem de Defesa em Profundidade consiste na implementação de diversos níveis de segurança, de forma que, se uma barreira for comprometida, as demais continuem exercendo controle sobre o avanço da ameaça. Essa metodologia, inspirada em estratégias militares, distribui os mecanismos de proteção ao longo da superfície de ataque, aumentando progressivamente a dificuldade de comprometimento à medida que se aproxima de ativos mais sensíveis. Esse modelo minimiza o risco de dependência de um único ponto de defesa, reforçando a postura de segurança com redundância e diversidade de controles. Cada camada pode atuar como elemento de detecção, retardo ou bloqueio do ataque.

Exemplos de mecanismos utilizados em conjunto para compor essas defesas incluem:
- Firewall: Filtragem e controle do tráfego de entrada e saída.
- Segmentação de Rede: Isolamento de zonas internas para limitar o movimento lateral.
- EDR (Endpoint Detection and Response): Monitoramento avançado de atividades suspeitas em dispositivos.
- Antivírus: Identificação e remoção de códigos maliciosos conhecidos.
- Autenticação Forte: Reforço na verificação de identidade com múltiplos fatores.
- Monitoramento Contínuo: Coleta e análise de eventos para identificar comportamentos anômalos.

🧱 Camadas de Segurança
A arquitetura em camadas organiza os controles de segurança em sete níveis distintos, que atuam de forma coordenada:
- Camada Física: Proteção de acesso físico aos equipamentos (hardwares) e ambientes (DataCenters).
- Camada Lógica: Barreiras digitais como autenticação, criptografia e controle de acesso.
- Camada Humana: Capacitação e conscientização para evitar erros e exploração de engenharia social.
- Camada de Rede: Segmentação, firewalls e inspeção de tráfego com sistemas como de detecção de intrusão.
- Camada de Aplicativo: Validação de entradas, controle de sessões e proteção contra vulnerabilidades conhecidas.
- Camada de Dados: Proteção da integridade, confidencialidade e disponibilidade das informações.
- Camada de Missão Crítica: Garantia de continuidade para os ativos e serviços essenciais à operação da organização.

🔒 Modelo Zero Trust
O modelo Zero Trust rompe com a ideia tradicional de confiança baseada na localização na rede. Em vez disso, assume que nenhuma entidade — interna ou externa — deve ser considerada confiável por padrão. A segurança é reforçada por meio da validação contínua de identidade, do contexto da solicitação e do estado do dispositivo. A máxima "Never Trust, Always Verify" define a lógica dessa abordagem, que exige autenticação constante, monitoração rigorosa e restrição de privilégios em todos os níveis.

💣 Ciclo de um Ataque Ransomware
O ransomware segue uma sequência bem estruturada com o objetivo de causar máximo impacto operacional e psicológico. As fases incluem:
- Acesso Inicial: Realizado por meio de phishing (e-mails com links ou anexos maliciosos), exploração de falhas de segurança (exploits de vulnerabilidades em softwares) ou credenciais expostas (como em conexões RDP).
- Movimentação Lateral e Persistência: Após a invasão, o código malicioso se propaga e instala mecanismos para se manter ativo, sempre buscando sistemas e dados críticos.
- Criptografia dos Dados: Ativação da carga maliciosa que bloqueia o acesso aos dados por meio de criptografia, tornando-os ilegíveis sem a chave de descriptografia.
- Extorsão: Exibição da nota de resgate exigindo pagamento, geralmente em criptomoeda, com ameaças adicionais como vazamento de dados.

📉 Exemplo de Falha por Ausência de Camadas
Um cenário crítico pode ser observado quando há ausência de controles distribuídos: um firewall mal configurado, ausência de segmentação de rede, senhas fracas e backups armazenados no mesmo ambiente. Em uma situação como essa, a entrada de um ransomware resultaria na criptografia completa dos dados, inclusive das cópias de segurança, comprometendo toda a estrutura sem chance de recuperação rápida. A falta de camadas torna a exposição total e o impacto devastador.

<a name="item1.2"><h4>1.2 Hardening</h4></a>[Back to summary](#item1)   
[Lab02](labs.md#item1.2)

Na segunda aula, o foco esteve na introdução ao conceito de *Hardening*, destacando sua relevância no fortalecimento da segurança de sistemas. Foram apresentados os principais objetivos dessa prática, como a redução da superfície de ataque, a aplicação de medidas básicas de proteção em um servidor **Ubuntu**, e a conexão entre essas ações e os pilares da segurança da informação: *Confidencialidade, Integridade e Disponibilidade (CIA)*.

*Hardening* é o processo de reforço da segurança de um sistema operacional ou serviço por meio da eliminação de componentes desnecessários, da restrinção de acessos e da aplicação de boas práticas de configuração. Além disso, envolve a monitoração contínua do ambiente para identificar comportamentos suspeitos ou inadequados. Ao reduzir a quantidade de vetores exploráveis, também se reduz a superfície de ataque, tornando o sistema mais resiliente a ameaças externas.

A adoção de práticas de hardening é essencial para evitar riscos frequentemente associados a configurações inseguras. Sem esse cuidado, um servidor pode se tornar um alvo fácil. Permitir o login direto como root, por exemplo, concede controle total a qualquer invasor que obtenha acesso, ampliando drasticamente o impacto de um ataque. Da mesma forma, manter serviços e portas abertas sem necessidade expande a superfície de ataque, criando múltiplas oportunidades para exploração. A ausência ou má configuração de logs compromete a capacidade de detecção e resposta a incidentes, dificultando qualquer tentativa de auditoria. Além disso, a negligência com práticas básicas de segurança torna o sistema vulnerável a ameaças conhecidas, que podem ser exploradas de forma automatizada com pouco esforço técnico.

Várias ações podem ser aplicadas para fortalecer a segurança de um servidor, cada uma focada em uma área específica do sistema. No acesso remoto via SSH, é recomendável desabilitar o login como root e evitar o uso de senhas, priorizando a autenticação por chave. Em relação aos usuários, deve-se restringir privilégios com o uso do `sudo` e remover contas antigas ou desnecessárias. A análise dos serviços em execução é fundamental para desativar aqueles que não são essenciais, reduzindo os pontos de exposição. O uso do firewall permite limitar o tráfego apenas às portas realmente necessárias. Já no controle de permissões, é importante proteger arquivos sensíveis contra acessos indevidos. Por fim, habilitar mecanismos de auditoria como o **auditd** e manter uma rotina de revisão dos logs contribui para a identificação de atividades suspeitas e a manutenção da integridade do sistema.

Diversos guias e padrões de hardening são utilizados como referência para reforçar a segurança de sistemas e atender a requisitos de conformidade. O **CIS Benchmarks** é um dos mais populares, oferecendo recomendações práticas para sistemas operacionais, aplicativos, nuvens e outros, com perfis de segurança ajustáveis (nível 1 e 2). O **NIST SP 800-53** traz uma estrutura mais abrangente, voltada a ambientes corporativos e regulados, com foco em controles organizacionais. Já os **STIGs da DISA** são padrões técnicos exigidos em ambientes militares dos EUA, com validação automatizada via ferramentas como o **STIG Viewer**. A **Microsoft** também disponibiliza baselines prontos para **Windows** e outros produtos, otimizados para uso com **Active Directory**. Por fim, ferramentas como **Ansible**, **CIS-CAT** e **OpenSCAP** permitem automatizar o processo de verificação e aplicação desses padrões em larga escala.

<a name="item1.3"><h4>1.3 Firewall & ACL</h4></a>[Back to summary](#item1)   
[Lab03](labs.md#item1.3)

A terceira aula teve como objetivo compreender o conceito de firewall, seu funcionamento e as diferentes formas de implementação, diferenciando um firewall de host de um firewall de borda. Também foram abordadas as listas de controle de acesso (ACLs) e a aplicação prática de regras com **iptables** no **Ubuntu**, além da utilização do **pfSense** para simular um firewall de rede.

Um firewall pode ser entendido como um “porteiro digital”, posicionado entre redes distintas, por exemplo, entre a internet e a rede interna, responsável por decidir quais conexões são permitidas, bloqueadas ou redirecionadas. Essa decisão é tomada com base em regras que consideram endereços IP, portas e protocolos. Existem dois tipos principais de firewall. O firewall de host atua diretamente em um único sistema operacional, controlando o tráfego que entra e sai daquele equipamento específico. É útil para proteger servidores e estações de trabalho, mesmo que já estejam atrás de um firewall de rede. Já o firewall de borda, ou de rede, fica posicionado na fronteira entre redes diferentes e protege múltiplos dispositivos ao mesmo tempo, servindo como a primeira barreira de defesa contra acessos não autorizados.

As ACLs (Access Control Lists) funcionam como um conjunto de regras que determinam quem pode acessar determinados recursos, com base em parâmetros como IP, porta e protocolo. Elas são amplamente aplicadas não apenas em firewalls, mas também em switches e roteadores. Um exemplo prático seria permitir que apenas um endereço IP específico tenha acesso à porta 22 (SSH) de um servidor.

No ambiente **Linux**, o **iptables** é a ferramenta nativa para configuração de regras de firewall. Ele opera com base em tabelas, cadeias (chains) e regras, permitindo desde políticas restritivas — como bloquear todo o tráfego por padrão — até permissões específicas para serviços essenciais. A ordem das regras é um ponto crítico, pois o sistema avalia de cima para baixo e aplica a primeira que corresponder ao pacote analisado.

Já o **pfSense**, baseado em **FreeBSD**, oferece uma solução de firewall de rede com interface gráfica, o que facilita a configuração e o gerenciamento das políticas de segurança. Entre seus recursos, destacam-se o suporte a NAT, segmentação de rede por VLANs, aplicação de regras específicas por interface e geração de logs detalhados para auditoria e diagnóstico.

Enquanto o **iptables** é mais técnico e voltado para administração local via linha de comando, o **pfSense** fornece uma abordagem visual e centralizada para a proteção de redes inteiras. Em ambos os casos, o monitoramento por meio de logs e ferramentas de análise, como **tcpdump**, **nmap** e **Wireshark**, é fundamental para manter a visibilidade e o controle sobre o tráfego.

<a name="item1.4"><h4>1.4 IDS e IPS</h4></a>[Back to summary](#item1)   
[Lab04](labs.md#item1.4)

A quarta aula foi dedicada ao estudo dos IDS (Intrusion Detection System) e IPS (Intrusion Prevention System), abordando suas funções, diferenças, aplicações e exemplos reais de uso. A proposta foi compreender como essas tecnologias contribuem para a defesa de redes e sistemas, quando utilizar cada uma e de que forma podem ser combinadas para uma proteção mais completa.

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


