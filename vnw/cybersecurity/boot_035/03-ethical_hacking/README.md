# Formação Cybersec - Módulo 3   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">vnw   <img src="https://github.com/PedroHeeger/my_tech_journey/blob/main/platforms/img/vnw.jpeg" alt="vnw" width="auto" height="25"></a>
### Software/Subject: <a href="../../">cybersecurity   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/cybersecurity.jpg" alt="cybersecurity" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_035 (Formação Cybersec)   <img src="../0-aux/logo_boot.png" alt="boot_035" width="auto" height="25"></a>
### Module: 3. Ethical Hacking (Red Team)

#### <a href="./labs.md">Laboratórios</a>

---

Esta pasta refere-se ao módulo 3 **Ethical Hacking (Red Team)** do bootcamp [**Formação Cybersec**](../).

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

### Bootcamp Module 3 Structure:
3. <a name="item3">Módulo 3: Ethical Hacking (Red Team)<br>
  3.1 <a href="#item3.1">Pentest: Metodologia & Regras de Engajamento</a><br>
  3.2 <a href="#item3.2">Hardening de Servidores Linux</a><br>
  3.3 <a href="#item3.3">Firewall & ACL</a><br>
  3.4 <a href="#item3.4">IDS e IPS</a><br>
  3.5 <a href="#item3.5">Monitoramento de Logs</a><br>
  3.6 <a href="#item3.6">Patch Management</a><br>
  3.7 <a href="#item3.7">Cloud Security</a><br>
  3.8 <a href="#item3.8">IAM e Permissionamento</a><br>
  3.9 <a href="#item3.9">Container Security Docker Bench & Trivy</a><br>
  3.10 <a href="#item3.10">NIST & Resposta a Incidentes</a><br>
  3.11 <a href="#item3.11">Projeto Final</a><br>

---

### Objective:
Desenvolver a mentalidade ofensiva necessária para simular ataques reais e transformar descobertas em evidências técnicas e recomendações acionáveis, por meio da aplicação de metodologias de pentest, exploração de vulnerabilidades com ferramentas como **Metasploit** e **Burp Suite**, técnicas de quebra de credenciais, escalonamento de privilégios em **Linux** e **Windows**, movimentação lateral, evasão de controles de defesa e elaboração de relatórios técnicos profissionais.

### Folder Structure:
- [README.md](./README.md): Este documento de README, escrito em **Markdown**, descrevendo todo conteúdo teórico realizado neste módulo.
- [labs.md](./labs.md): Documento escrito em **Markdown** descrevendo todos os laboratórios realizados neste módulo.

### Development:
Este módulo foi estruturado em aulas, cada uma dedicada a um tema específico. Na maioria delas, foram realizados laboratórios práticos relacionados ao conteúdo abordado. Este arquivo README contempla exclusivamente a parte teórica, enquanto o arquivo [labs.md](./labs.md), também em **Markdown**, apresenta a resolução de todos os laboratórios do módulo.

<a name="item3.1"><h4>3.1 Pentest: Metodologia & Regras de Engajamento</h4></a>[Back to summary](#item2)   
[Lab01](labs.md#item3.1)

A primeira aula do módulo 3 foi dedicada a introduzir o conceito de Pentest (Penetration Testing), explorando seu valor prático para organizações, metodologias de execução, elaboração de Rules of Engagement (ROE) e preparação do ambiente de laboratório. O objetivo foi compreender como planejar e conduzir testes de intrusão de forma segura, estruturada e com resultados acionáveis para o negócio.

🕵️ Pentest – Simulação Controlada   
Um Pentest consiste em um teste de intrusão planejado que simula ataques reais contra sistemas, aplicações e infraestrutura de uma organização. A ideia não é apenas identificar falhas, mas explorar vulnerabilidades de forma controlada, mostrando o impacto real sobre o negócio.

Benefícios:
- Revela vulnerabilidades exploráveis e seu impacto;
- Vai além de varreduras automatizadas, incluindo exploração contextual;
- Gera evidências concretas para tomada de decisão;
- Fornece relatórios detalhados com recomendações priorizadas.

💡 Diferencial do Pentest   
Não se trata apenas de escanear sistemas, mas de demonstrar como uma falha pode ser explorada para comprometer ativos críticos, permitindo que a organização entenda riscos reais e não apenas teóricos.

📚 Metodologias – Estrutura e Reprodutibilidade   
Seguir metodologias garante que os testes sejam consistentes, reproduzíveis e documentados, minimizando riscos legais e operacionais:
- PTES (Penetration Testing Execution Standard): fluxo claro e focado em testes práticos e estruturados;
- OSSTMM (Open Source Security Testing Methodology Manual): abordagem científica que analisa pessoas, processos e infraestrutura;
- NIST SP 800-115: guia formal para coleta de evidências e controle rigoroso, indicado para ambientes regulamentados;
- OWASP: metodologia focada em aplicações web, com Top 10 de vulnerabilidades e testes detalhados.

Cada metodologia se adapta a diferentes contextos: OWASP para web, NIST/OSSTMM para ambientes corporativos, PTES para projetos ágeis ou de aplicação prática.

📝 Planejamento e Escopo – ROE   
Definir claramente o escopo é essencial para segurança e sucesso do Pentest. O ROE estabelece limites, técnicas permitidas e autorizações. Elementos mínimos:
- Autorizações e Assinaturas: contrato formal com aprovações necessárias;
- Ativos em Escopo: IPs, domínios, portas e sistemas autorizados;
- Exclusões de Escopo: sistemas críticos ou produção não autorizada;
- Técnicas Permitidas/Proibidas: restrições sobre ferramentas ou métodos;
- Janelas de Teste: horários e limites de tráfego;
- Comunicação de Emergência: contatos e procedimentos para incidentes;
- Critérios de Encerramento: condições e formato de entrega dos resultados.

⚖️ Regras Essenciais:   
- Autorização obrigatória: nunca testar sem aprovação formal;
- Controle de exploits: manter confidencialidade e uso seguro;
- Notificação imediata: relatar quedas ou impactos não planejados;
- Conformidade legal: respeitar LGPD/GDPR e legislação local;
- Responsabilidade profissional: sigilo e ética em todos os momentos.

🔧 Ferramentas e Coleta de Informações   
A fase de reconhecimento é crítica e envolve identificar ativos e tecnologias de forma controlada:
- Rede/Hosts: nmap, rustscan – descoberta de hosts e serviços;
- Aplicações Web: whatweb, gobuster, nikto, ffuf – enumeração de diretórios e vulnerabilidades;
- Subdomínios/OSINT: amass, subfinder, crt.sh – inteligência de fontes abertas;
- Automatização: scripts como collect_recon.sh para agilizar coleta e salvar resultados.

📊 Estrutura do Relatório   
- Relatório Executivo: impacto no negócio e prioridades estratégicas;
- Relatório Técnico: detalhes técnicos, PoCs e reproduções;
- Coleta de Evidências: stdout, screenshots, hashes, timestamps;
- Priorização de Vulnerabilidades: crítico, alto, médio, baixo – considerando contexto do negócio e CVSS/CVEs;
- Remediação: soluções rápidas de impacto imediato vs melhorias de longo prazo.

<a name="item3.2"><h4>3.2 Hardening de Servidores Linux</h4></a>[Back to summary](#item2)   
[Lab02](labs.md#item3.2)









<a name="item3.3"><h4>3.3 Firewall & ACL</h4></a>[Back to summary](#item2)   
[Lab03](labs.md#item3.3)







<a name="item3.4"><h4>3.4 IDS e IPS</h4></a>[Back to summary](#item2)   
[Lab04](labs.md#item3.4)



<a name="item3.5"><h4>3.5 Monitoramento de Logs</h4></a>[Back to summary](#item2)   
[Lab05](labs.md#item3.5)








<a name="item3.6"><h4>3.6 Patch Management</h4></a>[Back to summary](#item2)   
[Lab06](labs.md#item3.6)








<a name="item3.7"><h4>3.7 Cloud Security</h4></a>[Back to summary](#item2)   
[Lab07](labs.md#item3.7)







<a name="item3.8"><h4>3.8 IAM e Permissionamento</h4></a>[Back to summary](#item2)   
[Lab08](labs.md#item3.8)








<a name="item3.9"><h4>3.9 Container Security Docker Bench & Trivy</h4></a>[Back to summary](#item2)   
[Lab09](labs.md#item3.9)









<a name="item3.10"><h4>3.10 NIST & Resposta a Incidentes</h4></a>[Back to summary](#item2)   
[Lab10](labs.md#item3.10)








<a name="item3.11"><h4>3.11 Projeto Final</h4></a>[Back to summary](#item2)   
[Material do Projeto](https://github.com/Kensei-CyberSec-Lab/formacao-cybersec/tree/main/modulo2-defesa-monitoramento/projeto-final)

O desafio final deste módulo teve como objetivo consolidar os conhecimentos adquiridos, colocando em prática a capacidade de defesa, monitoramento e resposta a incidentes. Foram disponibilizadas duas opções de abordagem — uma prática e outra conceitual — além de um desafio bônus. Em todas as alternativas, o principal entregável foi um documento técnico, ao qual deveriam estar vinculados todos os anexos. Esse documento, em formato **Markdown** ou **PDF**, precisava seguir requisitos mínimos de estrutura e qualidade:  
- **Estrutura mínima:** capa, sumário executivo, objetivo, escopo, metodologia, diagrama, evidências/diagnóstico, recomendações, plano de ação, conclusão e anexos.  
- **Clareza executiva:** obrigatoriedade de 1 página dedicada ao sumário executivo.  
- **Rastreabilidade:** referência a prints e logs (com data/hora) e inclusão de arquivos de configuração como anexos.  

Projetos: 
- [Opção 1 – Projeto Técnico](./11-projeto_final_1/): Criação de um ambiente defensivo, simulação de ataques controlados e validação da defesa, monitoramento e resposta com evidências documentadas.  
- [Opção 2 – Projeto Conceitual](./11-projeto_final_2/): Atuação como consultor Blue Team em um cenário fictício, elaborando defesa em profundidade, plano de monitoramento e resposta a incidentes baseado no NIST.  
- [Desafio Bônus](./11-desafio_bonus/): Atividade complementar para reforçar a aplicação prática e aprofundar os conceitos do módulo.  