* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [4) Imersão Cloud Computer (6)](/dio/dados_unimed_1/04-modulo_cloud)

# 4.6) Desafio de projeto: Explorando Dados Demográficos com Serviços de Big Data na AWS (8)
## Objetivos
* Criar um repositório no Amazon S3 e enviar dados
* Criar uma aplicação no Amazon Glue Crawler para extrair dados do S3
* Criar uma aplicação no Amazon Athena para consultas em SQL
* Utilizar o Amazon QuickSight para visualizar os dados
## Tecnologias
* Linguagem de Consulta: SQL
* Ambiente de Desenvolvimento: VS Code; Cloud AWS
* Ferramentas da AWS: S3; Athena; Glue Crawler; Quicksight

<a id="ancora"></a>
## Índice
* 4.6.1.1) Apresentação
* 4.6.1.2) Desafio
* 4.6.1.3) Principais características da Amazon Athena
* [4.6.1.4) Criando um repositório no Amazon S3](#ancora1)
* [4.6.1.5) Extraindo dados com Amazon Glue](#ancora2)
* [4.6.1.6) Executando consultas SQL no Amazon Athena](#ancora3)
* [4.6.1.7) Visualizando os dados com Amazon Quicksight](#ancora4)
* 4.6.1.8) Entendendo o Desafio

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
### 4.6.1.4) Criando um repositório no Amazon S3
[voltar](#ancora) 

* Fazer o login na conta da AWS, devemos utilizar o IAM User já criado.
* Criar um bucket no Amazon S3
    * Bucket name: **dio-dadosunimed-04aws-06dp**
    * AWS Region: us-east-1 (US East-N. Virginia)
    * Demais configurações: Padrão
* Criar duas folders dentro do bucket
    * Folders name: **output** e **population**
* Fazer o upload do arquivo **brazil_population_2019** que está na subpasta [**data**](/dio/dados_unimed_1/04-modulo_cloud/06-desafio_projeto/data/)

----------------------------------------------------------------------------------------------
<a id="ancora2"></a>
### 4.6.1.5) Extraindo dados com Amazon Glue
[voltar](#ancora) 

* Criar um crawler em AWS Glue
  * Crawler name: **dio-dadosunimed-04aws-06dp-PopulationDBCrawler**
* Adicionar um data source
  * Data source: S3
  * Location of S3 data: In this account
  * S3 path: escolher a folder population do bucket criado 
  * Demais configurações: Padrão
* Configurar IAM role
  * IAM role name: **dio-dadosunimed-04aws-06dp-population**
* Adicionar um database (Criar caso não exista e selecionar depois)
  * Name: **dio-dadosunimed-04aws-06dp-populationdb**
  * Em Advanced options marcar a opção **Create a single schema for each S3 path**
  * Demais configurações: Padrão
  * Frequency: On demand
* Confirmar a revisão e criar
* Após criado, selecionar o crawler e clicar em **Run**, ele vai executar o processo de ler o arquivo que está no S3, vai montar um esquema conforme os dados organizados dentro dele e vai montar uma tabela dentro do Glue.
* Verificar a tabela criada na opção **Tables**
* Acessar a tabela e verificar o esquema, caso precise editar o esquema ir em **Edit schema**

----------------------------------------------------------------------------------------------
<a id="ancora3"></a>
### 4.6.1.6) Executando consultas SQL no Amazon Athena
[voltar](#ancora) 

* Abrir o Athena para explorar os dados, no **Query Editor** ele já vai identificar o Data source, Database e as informações da tabela criada. Caso não identifique, é só selecionar as opções.
* Antes de digitar queries para execução, devemos configurar o setup onde as queries serão salvas, então iremos na opção **Edit settings**
  * Location of query result: escolher a folder **output** no bucket criado
  * Demais configurações: Padrão
* Database Name: **dio-dadosunimed-04aws-06dp-populationdb**
* Table Name: **population**
#### No campo para digitar uma query, iremos executar algumas queries
* Verificando a população total
```
select
    sum(population)
from "dio-dadosunimed-04aws-06dp-populationdb"."population";
```
* Verificando a população de Foz do Iguaçu
```
select city, population
from "dio-dadosunimed-04aws-06dp-populationdb"."population"
where city='Foz do Iguaçu';
```
* Verificando a população de Rio de Janeiro
```
select city, population
from "dio-dadosunimed-04aws-06dp-populationdb"."population"
where city='Rio de Janeiro';
```
* Verificando a população total do Sul
```
select region,
    sum(population)
from "dio-dadosunimed-04aws-06dp-populationdb"."population"
where region='Sul'
group by region;
```
* Verificando a população total do estado de São Paulo
```
select state,
    sum(population)
from "dio-dadosunimed-04aws-06dp-populationdb"."population"
where state='São Paulo'
group by state;
```
* Verificando a população total do estado de São Paulo
```
select region,
    sum(population)
from "dio-dadosunimed-04aws-06dp-populationdb"."population"
where region='Norte'
group by region;
```

* Conferir na folder **output** os resultados das nossas queries, eles são armazenados em arquivos csv e pode ser baixado.
* Salvar as queries criadas, após nomeadas, tem que ser executadas novamente
  * Name Query 1: **dio-dadosunimed-04aws-06dp-query_all_population**
  * Name Query 2: **dio-dadosunimed-04aws-06dp-query_by_city**
  * Name Query 3: **dio-dadosunimed-04aws-06dp-query_sum_by_state**
  * Name Query 4: **dio-dadosunimed-04aws-06dp-query_sum_by_region**
* Após salvar, ir na pasta **output** no bucket e conferir as queries salvas, elas são salvas por ano, mês, dia, em formato csv, junto com um arquivo de metadados.
* Abrir um dos csvs dessas queries e ir na opção **Object actions**, **Query with S3 Select** para executar a Query pelo S3.
* Na tabela criada **population**, ir **Genarete table DDL** e será criado uma Query para mostrar o script de criação dessa tabela que pode ser aproveitado para criar uma outra tabela a partir dessa.

----------------------------------------------------------------------------------------------
<a id="ancora4"></a>
### 4.6.1.7) Visualizando os dados com Amazon Quicksight
[voltar](#ancora) 

* Abrir o Amazon Quicksight, o Amazon Quicksight solicitará para você criar uma conta nele com suas credenciais da AWS.
* Ir em **Datasets**, escolher **New dataset** e selecionar **Athena**
  * Data source name: **dio-dadosunimed-04aws-06dp-athenads**
  * Athena workgroup: primary
  * Validar a conexão
* Selecionar o database **dio-dadosunimed-04aws-06dp-populationdb** e a folder **population**
* Escolher a opção **Directly query your data**
* Criar Dashboards