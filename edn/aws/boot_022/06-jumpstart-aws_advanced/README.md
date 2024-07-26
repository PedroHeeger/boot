# Bootcamp AWS re/Start-Cloud Computing - Module 6   <img src="../0-aux/logo_boot.png" alt="boot_022" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">edn   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25"></a> 
### Software/Subject: <a href="../../">aws    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_022 (Bootcamp AWS re/Start-Cloud Computing)   <img src="../0-aux/logo_boot.png" alt="boot_022" width="auto" height="25"></a>
### Module: 6. Jumpstart no AWS Advanced 

---

This folder refers to Module 6 **Jumpstart no AWS Advanced** from bootcamp [**Bootcamp AWS re/Start-Cloud Computing**](../).

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution: 
  - Amazon Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/amazon_linux.png" alt="amazon_linux" width="auto" height="25">
- Virtualization: 
  - Vocareum   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/sites/vocareum.png" alt="vocareum" width="auto" height="25">
- Cloud:
  - AWS   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
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

### Bootcamp Module 6 Structure

6. <a name="item6">Jumpstart no AWS Advanced</a><br>
  6.1. <a href="#item6.1">Amazon CloudWatch</a><br>
  6.2. <a href="#item6.2">Mergulhe fundo: Amazon CloudWatch</a><br>
  6.3. <a href="#item6.3">186- [JAWS] -Laboratório: Monitorar a infraestrutura</a><br>
  6.4. <a href="#item6.4">AWS CloudTrail</a><br>
  6.5. <a href="#item6.5">Integração do serviço da AWS com o Athena</a><br>
  6.6. <a href="#item6.6">187- [JAWS] -Atividade: Trabalhar com o AWS CloudTrail</a><br>
  6.7. 218- [JAWS] -KC - Monitoramento e segurança<br>
  6.8. <a href="#item6.8">AWS Organizations</a><br>
  6.9. <a href="#item6.9">Marcação</a><br>
  6.10. <a href="#item6.10">188- [JAWS] -Laboratório: Gerenciar recursos com marcação</a><br>
  6.11. <a href="#item6.11">Gerenciamento de custos da AWS e práticas recomendadas</a><br>
  6.12. <a href="#item6.12">Demonstração do painel de faturamento da AWS-2</a><br>
  6.13. 219- [JAWS] -KC - Gerenciando o consumo de recursos<br>
  6.14. <a href="#item6.14">189- [JAWS] -Atividade: Otimizar a utilização</a><br>
  6.15. <a href="#item6.15">Estratégia de construção da AMI</a><br>
  6.16. <a href="#item6.16">Modelos de inicialização do Amazon EC2</a><br>
  6.16. <a href="#item6.17">Demonstração do modelo de lançamento EC2-2</a><br>
  6.18. <a href="#item6.18">Infraestrutura como código</a><br>
  6.19. <a href="#item6.19">Introdução ao JSON e ao YAML</a><br>
  6.20. <a href="#item6.20">AWS CloudFormation</a><br>
  6.21. <a href="#item6.21">Automatizar implantações com o AWS CloudFormation</a><br>
  6.22. <a href="#item6.22">190- [JAWS] -Laboratório: Automatização de implantações com o AWS CloudFormation</a><br>
  6.23. <a href="#item6.23">Solucionar problemas do AWS CloudFormation</a><br>
  6.24. <a href="#item6.24">191- [JAWS] - Atividade do café: Solucionar problemas de implantações do AWS CloudFormation</a><br>
  6.25. 220- [JAWS] -KC - Criando implantações repetíveis automatizadas<br>

---

### Objective:
O objetivo deste módulo do bootcamp foi aprender sobre como funciona as redes na cloud da **AWS**, apresentando o serviço voltado para isso que é o **Amazon Virtual Private Cloud (Amazon VPC)**. Também foi ensinado como construir uma VPC com sub-redes pública e privada, gateway de internet e NAT gateway, tabela de rotas, grupo de segurança e provisionar uma instância do **Amazon Elastic Compute Cloud (Amazon EC2)** nesta VPC, acessando ela posteriormente.

### Structure:
A estrutura das pastas obedece a estruturação do bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibido a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md6-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em um curso e um laboratório. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item6.1"><h4>6.1 Amazon CloudWatch</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>












<a name="item6.2"><h4>6.2 Mergulhe fundo: Amazon CloudWatch</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>









<a name="item6.3"><h4>6.3 186- [JAWS] -Laboratório: Monitorar a infraestrutura</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>

Neste laboratório, desenvolvido no sandbox **Voccareum**, foi explicado como realizar monitoramentos das aplicações e infraestrutura dos serviços da **AWS** utilizando três recursos do serviço **Amazon CloudWatch**, *Amazon CloudWatch Logs*, *Amazon CloudWatch Events* e *Amazon CloudWatch Agent*, e o serviço **AWS Config**. Outros serviços da **AWS** como **AWS System Manager (AWS SSM)** e **Amazon Simple Notification Service (Amazon SNS)** também foram utilizados integrando com os serviços anteriores. O monitoramento dos logs da aplicação foi realizado pelo *Amazon CloudWatch Agent* e *Amazon CloudWatch Logs*. Enquanto o monitoramento da infraestrutura dos serviços da **AWS** foi executado pelo *Amazon CloudWatch Agent* e as próprias métricas do **Amazon CloudWatch**, sendo a infraestrutura analisada neste caso, uma instância do **Amazon EC2** que funcionava como servidor web, onde a aplicação era executada. Com o *Amazon CloudWatch Events* foi realizado um monitoramento em tempo real com envio de notificações através do **Amazon SNS**. Por fim, com o **AWS Config** foi realizada a verificação de conformidade da infraestrutura.

A primeira tarefa do laboratório consistiu em instalar e configurar o *Amazon CloudWatch Agent* dentro da instância do **Amazon EC2** para coletar métricas internas da instância e da aplicação que ela executava. A instalação e configuração foi toda realizada através dos recursos *Parameter Store* e *Run Command* do **AWS SSM**, não sendo necessário acessar remotamente a instância. Tanto a instância do EC2 como os templates utilizados no *Run Command* foram provisionados automaticamente pelo **AWS CloudFormation** ao iniciar o laboratório. O primeiro comando executado na instância foi do template `AWS-ConfigureAWSPackage`, configurando na seção parâmetros de comando, a ação como instalar, o nome como `AmazonCloudWatchAgent` e a versão como `latest`. Na seção destino foi optado por escolher as instâncias manualmente, sendo selecionada a instância do EC2 de tag de nome igual a `Web Server`. A imagem 02 mostra o comando executado com êxito.

<div align="Center"><figure>
    <img src="../0-aux/md6-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>

O comando definido pelo template `AWS-ConfigureAWSPackage` realizava na instância do EC2...

Em destinos e saídas (Targets and outputs) foi possível verificar as saídas do comando e ver que em uma das etapas o agente do **Amazon CloudWatch** foi instalado na instância com sucesso. Uma das etapas do comando não foi executada devido a pré-condições que não foram satisfeitas, portanto ela foi ignorada, mas não comprometeu a execução. Nesta etapa era necessário que o sistema operacional da instância fosse **Windows**, mas neste caso era uma máquina **Amazon Linux**. A imagem 03 exibe os outputs do comando.

<div align="Center"><figure>
    <img src="../0-aux/md6-img03.png" alt="img03"><br>
    <figcaption>Imagem 03.</figcaption>
</figure></div><br>

Com o CloudWatch Agent instalado na instância foi preciso configurá-lo para que ele coletasse as informações de log desejada. Neste caso, as informações eram os logs do servidor web onde a aplicação rodava e as métricas gerais do sistema utilizadas para realizar o monitoramento da aplicação e da infraestrutura respectivamente. Para isso foi construído um parâmetro no recurso *Parameter Store* do **AWS SSM**, cujo nome dele foi `Monitor-Web-Server`, a descrição foi `Collect web logs and system metrics` e em valor foi passado o JSON abaixo.

```json
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "log_group_name": "HttpAccessLog",
            "file_path": "/var/log/httpd/access_log",
            "log_stream_name": "{instance_id}",
            "timestamp_format": "%b %d %H:%M:%S"
          },
          {
            "log_group_name": "HttpErrorLog",
            "file_path": "/var/log/httpd/error_log",
            "log_stream_name": "{instance_id}",
            "timestamp_format": "%b %d %H:%M:%S"
          }
        ]
      }
    }
  },
  "metrics": {
    "metrics_collected": {
      "cpu": {
        "measurement": [
          "cpu_usage_idle",
          "cpu_usage_iowait",
          "cpu_usage_user",
          "cpu_usage_system"
        ],
        "metrics_collection_interval": 10,
        "totalcpu": false
      },
      "disk": {
        "measurement": [
          "used_percent",
          "inodes_free"
        ],
        "metrics_collection_interval": 10,
        "resources": [
          "*"
        ]
      },
      "diskio": {
        "measurement": [
          "io_time"
        ],
        "metrics_collection_interval": 10,
        "resources": [
          "*"
        ]
      },
      "mem": {
        "measurement": [
          "mem_used_percent"
        ],
        "metrics_collection_interval": 10
      },
      "swap": {
        "measurement": [
          "swap_used_percent"
        ],
        "metrics_collection_interval": 10
      }
    }
  }
}
```

Esse JSON criava no **Amazon CloudWatch** dois grupos de log (Log Group) de nomes `HttpAccessLog` e `HttpErrorLog`, ambos relativo ao servidor web **Apache HTTP (Httpd)** que executava a aplicação na instância do EC2. Os logs eram extraídos das pastas `access_log` e `error_log`, armazenadas no diretório `/var/log/httpd/` dentro da instância do EC2. Então qualquer log do servidor web Apache que fosse gerado nessas pastas seriam extraídos para o log group correspondente do CloudWatch, sendo possível visualizá-los pelo console do próprio CloudWatch. O log stream (fluxo de registro) é uma subdivisão dentro de cada log group para armazenar os logs, onde neste caso teve como nome o próprio ID da instância. Isso seria extremamente útil se fosse uma frota de instância, pois separaria os logs de cada instância pelo seu ID.

Ainda no JSON, além dos logs coletados para o monitoramento da aplicação, também foram coletadas métricas do sistema da instância EC2, como: cpu, disk, diskio, mem e swap. Abaixo é informado quais métricas exatamente foram coletadas de cada um. A imagem 04 ilustra o parâmetro construído.
- cpu:
  - cpu_usage_idle: porcentagem do tempo em que a CPU está ociosa e não está executando nenhum processo.
  - cpu_usage_iowait: porcentagem do tempo em que a CPU está esperando por operações de entrada/saída (I/O), como leitura ou gravação em disco.
  - cpu_usage_user: porcentagem do tempo em que a CPU está executando processos de usuários, ou seja, tarefas e aplicativos iniciados pelo usuário.
  - cpu_usage_system: porcentagem do tempo em que a CPU está executando processos do sistema ou do kernel, como gerenciamento de recursos e tarefas internas do sistema operacional.
- disk
  - used_percent: porcentagem do espaço utilizado em um sistema de arquivos ou disco.
  - inodes_free: o número de inodes livres em um sistema de arquivos. Inodes são estruturas de dados usadas pelo sistema de arquivos para armazenar informações sobre arquivos e diretórios, como permissões, proprietário, tamanho, e localização dos dados.
- diskio
  - io_time: tempo total que o disco ou dispositivo de armazenamento está ocupado realizando operações de entrada/saída (I/O).
- mem:
  - mem_used_percent: porcentagem da memória física (RAM) que está atualmente em uso.
- swap:
  - swap_used_percent: porcentagem da memória swap que está atualmente em uso. Swap é uma área no disco usada como memória virtual quando a RAM está totalmente ocupada.

<div align="Center"><figure>
    <img src="../0-aux/md6-img04.png" alt="img04"><br>
    <figcaption>Imagem 04.</figcaption>
</figure></div><br>

Este parâmetro foi utilizado ao executar um outro comando no *Run Command* para configurar ao agente do CloudWatch já instalado na instância, indicando quais informações deveriam ser coletadas. O template utilizado dessa vez foi o `AmazonCloudWatch-ManageAgent`. Cada template tem várias informações e entre elas um script que é executado dentro da instância. O script desse template fazia referência ao parâmetro construído no *Parameter Store*. Assim, caso quisesse modificar as métricas coletadas era só alterar o valor do parâmetro que é o arquivo JSON, especificar as métricas e então executar um comando com este template. Na seção parâmetros de comando foram feitas as seguintes configurações: em ação foi definido configurar, em modo foi selecionado ec2, em origem da configuração foi selecionado ssm, em local de configuração foi definido `Monitor-Web-Server` e o reinício foi definido como sim. Isso determinava que o agente do CloudWatch utilizasse a configuração estabelecida pelo parâmetro no **AWS SSM**. Na seção de destinos, novamente foi escolhida manualmente a instância de tag de nome `Web Server`. A imagem 05 mostra que o comando foi executado com êxito.

<div align="Center"><figure>
    <img src="../0-aux/md6-img05.png" alt="img05"><br>
    <figcaption>Imagem 05.</figcaption>
</figure></div><br>

A tarefa de número 2 teve como objetivo gerar dados de logs da aplicação executada no servidor web Apache dentro da instância do EC2 e em seguida monitorá-los através do **Amazon CloudWatch**. Para isso foi necessário acessar a aplicação que era executada na instância. Dessa forma, foi copiado o IP ou DNS público da instância e acessado pelo navegador da máquina física **Windows**. A requisição era direcionada para a página de teste do servidor web. Nesta mesma URL foi acrescentado o path `/start` que era uma pasta que não existia dentro do servidor web. Uma mensagem de erro aparecia indicando que a página não foi encontrada. A finalidade aqui era gerar dados de log tentando acessar uma aplicação que não existia. A imagem 06 exibe a tentativa de acesso a página da aplicação que não existia.

<div align="Center"><figure>
    <img src="../0-aux/md6-img06.png" alt="img06"><br>
    <figcaption>Imagem 06.</figcaption>
</figure></div><br>

Para confirmar os logs gerado, no console da **AWS** foi acessado o CloudWatch e escolhido o recurso grupos de log. Dois grupos de logs apareciam que foram os grupos criados pelo JSON armazenado no *Parameter Store*. O primeiro acessado foi `HttpAccessLog` que extraía logs da pasta `/var/log/httpd/access_log` da instância do EC2. Ao acessá-lo, apenas um log stream (fluxo de log) aparecia que era o ID da única instância. Ao acessar este log stream foi possível visualizar os logs oriundos da pasta `access_log` que eram os logs de acesso do servidor web, ou seja, solicitações GET que foram enviadas ao servidor da web. Também foi possível visualizar informações adicionais selecionando para expandir as linhas. Os dados de log incluíam informações sobre o computador e o navegador que fez a solicitação. Observe na imagem 07, uma linha com a solicitação feita ao path `/start` com um código de 404, o que significava que a página não foi encontrada.

<div align="Center"><figure>
    <img src="../0-aux/md6-img07.png" alt="img07"><br>
    <figcaption>Imagem 07.</figcaption>
</figure></div><br>

Ainda nesta tarefa foi construído um filtro de métrica no *Amazon CloudWatch Logs* para identificar erros 404 no arquivo de log. Esse erro normalmente seria uma indicação de que o servidor web está gerando links inválidos os quais os usuários estão escolhendo. Voltando para os grupos de logs e selecionando `HttpAccessLog`, foi criado um filtro de métrica para esse log group. Na caixa padrão de filtro foi colada a seguinte linha `[ip, id, user, timestamp, request, status_code=404, size]`. Essa linha informava ao CloudWatch Logs como interpretar os campos nos dados de log e definia um filtro para encontrar apenas linhas com `status_code=404`, que indicava que uma página não foi encontrada. O ID da instância `Web Server` foi selecionada e o nome do filtro foi definido como `404Errors`. Na seção detalhes da métrica foi realizada as seguintes configurações: o namespace da métrica foi definido como `LogMetrics`, o nome da métrica foi definido como `404Errors`, e o valor da métrica como `1`. Ao finalizar a criação do filtro, os resultados foram exibidos contendo a solicitação feita ao path `/start`, conforme mostrado na imagem 08.

<div align="Center"><figure>
    <img src="../0-aux/md6-img08.png" alt="img08"><br>
    <figcaption>Imagem 08.</figcaption>
</figure></div><br>

Após isso foi criado um alarme, utilizando este filtro de métrica, para enviar notificações quando muitos erros 404 fossem recebidos. Para isso o filtro de métrica foi selecionado e então foi configurado o alarme. Na seção métricas, o período foi definido com 30 segundos. Na seção condições foi determinado que sempre que o erro `404Errors` fosse maior ou igual a `5`. Na seção notificações, um tópico do **Amazon SNS** foi elaborado e meu email foi definido para receber a notificação. Lembrando que sempre que o SNS é utilizado com email, é necessário aceitar a subscrição através do primeiro email que é recebido para que os emails futuros possam ser entregues. O nome do alarme foi definido como `404 Errors` e a descrição como `Alert when too many 404s detected on an instance`. Após isso, o alarme apareceu laranja indicando que havia dados insuficientes. O alarme levava um tempo para coletar dados e conseguir verificar a situação. Assim que foi possível verificar, o alarme ficou verde, conforme imagem 09.

<div align="Center"><figure>
    <img src="../0-aux/md6-img09.png" alt="img09"><br>
    <figcaption>Imagem 09.</figcaption>
</figure></div><br>

Agora foi preciso testar o alarme gerando novos dados de log que resultassem em erros. Portanto, a aplicação web teve que ser acessada novamente pelo navegador da máquina física **Windows** através do IP ou DNS público da instância acrescentando um path `/start2` que não existia para provocar o erro. Como o alarme foi configurado para ser acionado a partir de 5 requisições, então a página foi atualizada mais quatro vezes. Foi necessário aguardar um tempo de 30 segundos que foi o configurado no alarme. Após esse tempo, o alarme foi acionado ficando vermelho, conforme imagem 10. Na imagem 11, a notificação que foi enviada para o email conforme determinado é visualizada.

<div align="Center"><figure>
    <img src="../0-aux/md6-img10.png" alt="img10"><br>
    <figcaption>Imagem 10.</figcaption>
</figure></div><br>

<div align="Center"><figure>
    <img src="../0-aux/md6-img11.png" alt="img11"><br>
    <figcaption>Imagem 11.</figcaption>
</figure></div><br>

A terceira tarefa consistiu na realização do monitoramento da infraestrutura através das métricas coletadas pelo agente do CloudWatch dentro da instância. Dessa forma, o console do **Amazon EC2** foi aberto e a instância `Web Server` foi selecionada alterando a guia para monitoramento para visualizar as métricas, conforme imagem 12. O **Amazon CloudWatch** consegue coletar algumas métricas que visualizam a instância "por fora" como uma máquina virtual, mas não fornecem informações sobre o que está sendo executado "dentro" da instância, como medir memória livre ou espaço livre em disco. Por isso que foi utilizado o agente do CloudWatch para conseguir visualizar informações de dentro da instância. 

<div align="Center"><figure>
    <img src="../0-aux/md6-img12.png" alt="img12"><br>
    <figcaption>Imagem 12.</figcaption>
</figure></div><br>

O console foi alterado agora para o **Amazon CloudWatch** e o recurso métricas foi selecionado, expandido a visualização paratodas as métricas. A metade inferior da página exibe as várias métricas coletadas pelo CloudWatch. A **AWS** gera automaticamente algumas dessas métricas e o agente do CloudWatch coleta outras. Então foi selecionado `CWAgent` e escolhido `dispositivo, fstype, host, caminho` para visualizar as métricas coletada pelo agente do CloudWatch, conforme apresentado na imagem 13.

<div align="Center"><figure>
    <img src="../0-aux/md6-img13.png" alt="img13"><br>
    <figcaption>Imagem 13.</figcaption>
</figure></div><br>

Na tarefa 4 foi criado notificações em tempo real através do *Amazon CloudWatch Events* que informava quando uma instância fosse interrompida ou encerrada. Portanto, no console do CloudWatch, o recurso Events foi escolhido e seleciona regras (Rules). Uma regra foi criada e na seção origem do evento foi configurado: o nome do serviço como EC2, o tipo de evento como notificação de alteração do estado da instância do EC2, a caixa de seleção estados específicos foi marcada e foi selecionado interrompido ou encerrado. Na seção destinos, um destino foi adicionado com as seguintes configurações: SNS e em tópico foi escolhido `Padrão_CloudWatch_Alarmes_Tópico`. Este tópico foi criado na tarefa 2 que já possuía meu email como assinante. Na configuração de detalhes, em definição de regra, o nome foi `Instance_Stopped_Terminated`. A imagem 14 evidência a regra de evento construída.

<div align="Center"><figure>
    <img src="../0-aux/md6-img14.png" alt="img14"><br>
    <figcaption>Imagem 14.</figcaption>
</figure></div><br>

Agora foi o momento de testar, a instância `Web Server` foi interrompida e assim que o processo de interrupção foi concluído, um mensagem foi enviada para meu email contendo detalhes em JSON sobre a instância que foi interrompida, conforme mostrado na imagem 15.

<div align="Center"><figure>
    <img src="../0-aux/md6-img15.png" alt="img15"><br>
    <figcaption>Imagem 15.</figcaption>
</figure></div><br>

Na última tarefa foi executado o monitoramento da conformidade da infraestrutura com o **AWS Config**, ativando duas regras dele para garantir a conformidade de marcação (tags) e dos volumes do **Amazon Elastic Block Store (Amazon EBS)**. Ao abrir o **AWS Config** no console foi selecionado comece a usar e avançado até o fim. Isso configurava o **AWS Config** para uso inicial. Uma janela de Bem-vindo ao **AWS Config** foi exibida, mas pôde ser fechada. O recurso regras (Rules) foi selecionado e a regra `required-tags`, que é gerenciada pela **AWS**, foi adicionada. Essa regra exigia um código de projeto para cada recurso, ou seja, uma tag. Na página de configurar regra, em parâmetros, o valor de `tag1Key` foi definida como `project`. Essa regra agora procurava recursos que não tinham uma tag projeto. A imagem 16 mostra recursos que não atendiam essa regra. Pode ser que leve um tempo até o Config terminar de verificar os recursos.

<div align="Center"><figure>
    <img src="../0-aux/md6-img16.png" alt="img16"><br>
    <figcaption>Imagem 16.</figcaption>
</figure></div><br>

A segunda regra criada foi uma regra que procurava volumes do EBS que não estevam anexados às instâncias do EC2. O volume da instância `Web Server` ainda não tinha sido excluído, portanto não estava anexado a nenhuma instância, já que a instância tinha sido interrompida anteriormente. Esta também foi uma regra gerenciada pela **AWS**, sendo o nome dela `ec2-volume-inuse-check`. O resultado dessa regra é exibido na imagem 17 abaixo.

<div align="Center"><figure>
    <img src="../0-aux/md6-img17.png" alt="img17"><br>
    <figcaption>Imagem 17.</figcaption>
</figure></div><br>

<a name="item6.4"><h4>6.4 AWS CloudTrail</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>


















<a name="item6.5"><h4>6.5 Integração do serviço da AWS com o Athena</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>


















<a name="item6.6"><h4>6.6 187- [JAWS] -Atividade: Trabalhar com o AWS CloudTrail</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>























<a name="item6.8"><h4>6.8 AWS Organizations</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>









<a name="item6.9"><h4>6.9 Marcação</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>






<a name="item6.10"><h4>6.10 188- [JAWS] -Laboratório: Gerenciar recursos com marcação</h4></a>[Back to summary](#item6) | <a href="">Certificate</a>