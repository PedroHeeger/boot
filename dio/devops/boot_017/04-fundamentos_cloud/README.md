# Formação DevOps Fundamentals - Módulo 4   <img src="../0-aux/logo_boot.png" alt="boot_017" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">devops   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/devops.png" alt="devops" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_017 (Formação DevOps Fundamentals)   <img src="../0-aux/logo_boot.png" alt="boot_017" width="auto" height="25"></a>
### Module: 4. Fundamentos de Cloud Computing e Azure DevOps 

---

This folder refers to Module 4 **Fundamentos de Cloud Computing e Azure DevOps** from bootcamp [**Formação DevOps Fundamentals**](../).

### Theme:
- DevOps

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud Services:
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Configuration Management (CM):
  - Terraform   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/terraform/terraform-original.svg" alt="terraform" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">
- Command Line Interpreter (CLI):
  - Git Bash   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/git_bash.svg" alt="git_bash" width="auto" height="25">
  - Windows PowerShell   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows_power_shell.png" alt="windows_power_shell" width="auto" height="25">
- Tools:
  - Windows Terminal   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows_terminal.png" alt="windows_terminal" width="auto" height="25">
- Development:
  - GitLab   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gitlab/gitlab-original.svg" alt="gitlab" width="auto" height="25">

---

### Bootcamp Module 4 Structure
4. <a name="item4">Fundamentos de Cloud Computing e Azure DevOps</a><br>
  4.1. <a href="#item4.1">Cloud Computing e o DevOps</a><br>
  4.2. <a href="#item4.2">Infraestrutura como Código no DevOps</a><br>
  4.3. <a href="#item4.3">Conhecendo a Plataforma Azure Cloud e Azure DevOps</a><br>
  4.4. <a href="#item4.4">Entendendo na Prática a Cultura DevOps com Azure DevOps</a><br>

---

### Objective:
O objetivo deste módulo do bootcamp foi introduzir a metodologia/cultura **DevOps** bastante utilizada atualmente na área de desenvolvimento de software, explicando um pouco sobre suas características e como ela surgiu. Também foi abordado sobre a metodologia **DevSecOps** que adiciona uma camada de segurança durante todo o processo da metodologia **DevOps**, integrando os profissionais de segurança da informação junto aos desenvolvedores e operadores de infraestrutura.

### Structure:
A estrutura das pastas obedeceu a estruturação do bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibida a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md4-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do Bootcamp foi dividido em três cursos. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item4.1"><h4>4.1 Cloud Computing e o DevOps</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/development/devops/(24-02-22)_Cloud_Computing...DevOps_PH_DIO.pdf">Certificate</a>

O custo de manter um data center possuí várias variáveis, incluindo o tamanho do Data Center, sua localização, segurança e a necessidade de atualizações e manutenção regulares. Além do custo de infraestrutura, também tem o custo de energia, o que ocasiona um custo muito alto. As empresas que gerenciam seus sistemas de TI internamente lidam com uma variedade de desafios, incluindo custos excessivos, falta de escalabilidade e falta de flexibilidade. Mudar para a nuvem pode ajudar a aliviar essas dores e fornecer às empresas uma variedade de incentivos.

Em cloud existem três modelos de computação principais, são eles; IaaS, PaaS e SaaS. Cada modelo oferece um nível diferente de controle e responsabilidade para o usuário. *Infrastructure as a Service (IaaS)* ou Infraestrutura como Serviço tem o foco na migração, ela serve para sistema legado, servidor de arquivos, segurança, sistema de gerenciamento e sistema de cache. *Platform as a Service (PaaS)* ou Plataforma como Serviço é focada na construção, ela serve para desenvolvimento de aplicação, streaming, web, decisões de suporte. Já a *Software as a Service (SaaS)* ou Software como Serviço é focada na utilização, servindo para e-mail, CRM, ERP.

Além do modelo de computação, existe também os modelos de implantação que são: cloud pública, cloud híbrida e cloud privada. Na cloud pública existe maior risco de privacidade, alto desempenho, acesso imediato, baixo custo e escalabilidade. Na cloud híbrida tem-se alto desempenho; acesso imediato; baixo custo; escalabilidade; segurança; controle total. Já na cloud privada existe segurança, controle total, alto investimento e custo contínuo da operação.

<a name="item4.2"><h4>4.2 Infraestrutura como Código no DevOps</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/development/devops/(24-02-22)_Infraestrutura...Codigo...DevOps_PH_DIO.pdf">Certificate</a>

*Infraestrutura como Código (IAC)* é um processo de gerenciamento de infraestrutura de TI que aplica as melhores práticas do desenvolvimento de software DevOps para o gerenciamento de recursos de infraestrutura em nuvem. A ideia de Infraestrutura como Código (IAC) foi estimulada pelo sucesso do CI/CD. O **Ansible** é uma ferramenta de automação criada para gerenciar múltiplas máquinas de uma única vez através de playbooks escritas no formato YAML. O **Ansible** é ótimo para o gerenciamento de configurações, ele também provisiona recursos, mas não é o mais ideal de ser utilizado. É recomendado para configuração de maquinas virtuais (VMs), com a criação de domínio, usuários, etc.

O **Terraform** é uma ferramenta para construir, modificar e versionar infraestruturas criada para atuar principalmente nas Clouds. De fácil manutenção para migrar a outra plataforma Cloud. A melhor maneira seria utilizar IAC com o **Terraform** para criação de recursos e como gerenciamento da Infra o **Ansible**. O melhor cenário seria unir os recursos dos dois providers para conseguirmos ter maior flexibilidade e automatização na IAC.

Neste curso foi utilizado o arquivo [terraform.tf](./terraform/terraform.tf) dentro da sub-pasta [terraform](./terraform/) para criar um resource group na cloud da **Azure**. A localização desse grupo de recursos foi na região `westeurope`, sendo o nomeado de `rg-terraform-99`. Acontece que para trabalhar com o **Azure** foi necessário criar uma conta na cloud, pois ainda não possuía. Após a criação de conta, teve que ser baixado o CLI da **Azure** que é **AS** e então configurar com um usuário.


az login
az account list -> lista as subscrinções
az account set --subscription="homeTenantId"

terraform init
terraform plan

<div align="Center"><figure>
    <img src="../0-aux/md4-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md4-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>


<a name="item4.3"><h4>4.3 Conhecendo a Plataforma Azure Cloud e Azure DevOps</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/development/devops/(24-02-23)...Plataforma_Azure_Cloud...Azure_DevOps_PH_DIO.pdf">Certificate</a>







<a name="item4.4"><h4>4.4 Entendendo na Prática a Cultura DevOps com Azure DevOps</h4></a>[Back to summary](#item4) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/development/devops/(24-02-23)_DP_Entendendo...Cultura_DevOps...Azure_DevOps_PH_DIO.pdf">Certificate</a>


