#### Plataforma: [DIO (Digital Inovation One)](/dio/)
#### Bootcamp: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
#### Módulo_Bootcamp: [4) Imersão Cloud Computer (6)](/dio/dados_unimed_1/04-modulo_cloud)
#### Curso: [4.4) Curso: Introdução a Engenharia de Dados na AWS (2)](/dio/dados_unimed_1/04-modulo_cloud/04-aws/)

# Arquitetura:
<img src="/dio/dados_unimed_1/04-modulo_cloud/04-aws/arquitetura.png" alt="drawing" width="800" heigth="300"/>

# Objetivos:
* Criar um Stream Delivery com AWS Kinesis Firehose;
* Configurar instância no AWS EC2;
* Gerar logs de processamento de dados com Python;
* Armazenar logs no AWS S3;
* Manipular dados no AWS Glue Data Brew;

<a id="ancora"></a>
# Índice
* 4.4.1 Conheça os serviços da AWS (8)
    * 4.4.1.1 Apresentação inicial e objetivos do curso
    * 4.4.1.2 Conceitos básicos sobre Big Data
    * 4.4.1.3 Visão geral de Big Data na Aws
    * 4.4.1.4 AWS Snow Family
    * 4.4.1.5 AWS Kinesis
    * 4.4.1.6 AWS Elastic Mapduce
    * 4.4.1.7 AWS Glue
    * 4.4.1.8 AWS Redshift
* 4.4.2 Mãos à obra (10)
    * 4.2.1 Apresentação da parte prática
    * 4.2.2 Criando o delivery stream
    * [4.4.2.3 Implementando o serviço de instâncias EC2 e configurando através do Putty](#ancora1)
    * [4.4.2.4 Iniciando o serviço Kinesis e desenvolvendo os arquivos de log](#ancora2)
    * [4.4.2.5 Criando um data Stream e acessando os dados devolvidos](#ancora3)
    * [4.4.2.6 Visualizando os dados com o serviço Glue Data Brew](#ancora4)
    * 4.2.7 Conclusão do curso
    * 4.2.8 Github
    * 4.2.9 Slides
    * 4.2.10 Certifique seu conhecimento

<a id="ancora1"></a>
## 4.4.2.3 Implementando o serviço de instâncias EC2 e configurando através do Putty
[voltar](#ancora)   

Após a criação da instância EC2 na AWS

Para conectar o Putty a instância EC2, devemos ir na instância criada lá na AWS, na opção **conncet**, **SSH client** e na opção **4.Connect to your instance using its Public DNS:**, copiaremos o endereço que será colado lá no Putty. No Putty, além do endereço, iremos na opção **ssh**, **auth** e escolheremos o arquivo **.ppk** criado, que é nossa chave privada. Em seguida, clicamos em **open** e será aberto o terminal e solicitado o acesso. Agora é só seguir com os comandos abaixo:

* Login:
```
ec2-user
```
* Instalando o AWS Kineses Agent:
```
sudo yum install -y aws-kinesis-agent
```
* Instalando o git:
```
sudo yum install -y git
```
* Clonando o repositório do GitHub:
```
git clone https://github.com/cassianobrexbit/dio-live-aws-bigdata-2.git
```
* Entrando no diretório do repositório clonado:
```
cd dio-live-aws-bigdata-2
```
* Listando os arquivos desse diretório:
```
ls
```
* Descompactando o arquivo Dataset:
```
unzip Dataset.zip
```
* Visualizando pelo editor nano o arquivo python:
```
nano LogGenerator.py
```
* Modificando as permissões do arquivo python:
```
chmod a+x LogGenerator.py
```
* Visualizando a base de dados que iremos usar:
```
less country_vaccinations.csv
```
* Criando um diretório:
```
sudo mkdir /var/log/diolive
```
* Alterando de diretório para o diretório do AWS Kinesis:
```
cd /etc/aws-kinesis
```
* Listando os arquivos desse diretório:
```
ls
```
* Acessando pelo editor nano o arquivo agent para realizar modificações:
```
sudo nano agent.json
```

* Alterando o script do arquivo:
```
{
  "cloudwatch.emitMetrics": true,
  "kinesis.endpoint": "",
  "firehose.endpoint": "firehose:us-east-1.amazonaws.com",

  "flows": [
    {
      "filePattern": "/var/log/diolive/*.log",
      "deliveryStream": "CovidVaccinesLogDIOLive"
    }
  ]
}
```

<a id="ancora2"></a>
## 4.4.2.4 Iniciando o serviço Kinesis e desenvolvendo os arquivos de log
[voltar](#ancora)   

* Inicializando a instância do Kinesis Agent:
```
sudo service aws-kinesis-agent start
```
* Modificando a configuração para que seja inicializado o Kinesis Agent toda vez que a instância for inicializada:
```
sudo chkconfig aws-kinesis-agent on
```
* Alterando para o diretório que está o arquivo de código Python:
```
cd ~/dio-live-aws-bigdata-2/
```
* Listando os arquivos dentro desse diretório:
```
ls
```
* Modificando a configuração para que seja inicializado o Kinesis Agent toda vez que a instância for inicializada:
```
sudo ./LogGenerator.py 5000000
```
* Visualizando o arquivo de logs gerado:
```
tail -f /var/log/aws-kinesis-agent/aws-kinesis-agent.log
```
* Reinicializando o Kinesis Agent:
```
sudo service aws-kinesis-agent restart
```

<a id="ancora3"></a>
## 4.4.2.5 Criando um data Stream e acessando os dados devolvidos
[voltar](#ancora)  

* Alterando de diretório para o diretório do AWS Kinesis:
```
cd /etc/aws-kinesis
```
* Acessando pelo editor nano o arquivo agent para realizar modificações:
```
sudo nano agent.json
```
* Alterando o script do arquivo:
```
{
  "cloudwatch.emitMetrics": true,
  "kinesis.endpoint": "kinesis.us-east-1.amanonaws.com",
  "firehose.endpoint": "firehose.us-east-1.amazonaws.com",

  "flows": [
    {
        "filePattern": "var/log/diolive/*.log",
        "kinesisStream": "CovidVaccinesLogStreamDioLive",
        "partitionKeyOptions": "RANDOM",
        "dataProcessingOptions": [
            {
                "optionName": "CSVTOJSON",
                "customFieldNames": ["country", "iso_code", "total_vaccinations", "people_fully_vaccinated", "total_vaccinations_per_hundred", "vaccines", "source_name", "source_website"]
            }
        ]
    },
    {
      "filePattern": "/var/log/diolive/*.log",
      "deliveryStream": "CovidVaccinesLogDIOLive"
    }
  ]
}
```
* Agora iremos na AWS para criar o Kinesis Data streams de nome **CovidVaccinesLogStreamDioLive**.
* Reinicializando o Kinesis Agent:
```
sudo service aws-kinesis-agent restart
```
* Alterando para o diretório que está o arquivo de código Python:
```
cd ~/dio-live-aws-bigdata-2/
```
* Listando os arquivos dentro desse diretório:
```
ls
```
* Modificando a configuração para que seja inicializado o Kinesis Agent toda vez que a instância for inicializada:
```
sudo ./LogGenerator.py
```
* Visualizando o arquivo de logs gerado:
```
tail -f /var/log/aws-kinesis-agent/aws-kinesis-agent.log
```
* aa
```
```

<a id="ancora4"></a>
## 4.4.2.6 Visualizando os dados com o serviço Glue Data Brew
[voltar](#ancora)   

Iremos no Glue Data Brew e criaremos um novo projeto determinando um nome **CovidVaccinesDIOLive**, selecionaremos um novo dataset e um registro de log gerado dentro do bucket criado **dio-aws-04-covid-vaccines**. Escolheremos o formato **csv** e passaremos um sufixo para o nome da IAM role que será criada **DIOLive**.