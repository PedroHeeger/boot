* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [3) Bancos de Dados SQL e NoSQL (17)](/dio/dados_unimed_1/03-modulo_database/)

# 3.3) Curso: Modelagem de Dados para Banco de Dados (2)
## Objetivos
Aprender comandos básicos em SQL no MySQL Workbench.
## Tecnologias
* Linguagem de Consulta: SQL
* Linguagem de Serialização: YAML
* Ambiente de Desenvolvimento: VS Code; Docker; Arquivo **.env**
* Banco de dados: MySQL; MySQL Workbench

<a id="ancora"></a>
## Índice
* 3.3.1) Overview sobre Modelagem de Dados (7)
    * 3.3.1.1) Introdução à Modelagem de dados - Parte 1
    * 3.3.1.2) Introdução à Modelagem de dados - Parte 2
    * 3.3.1.3) Instalação MySQL Windows
    * 3.3.1.4) PostgreSQL Windows
    * 3.3.1.5) Instalando MySQL no Ubuntu
    * 3.3.1.6) Instalando PostgreSQL no Ubuntu
    * [3.3.1.7) Explorando Comandos básicos SQL](#ancora1)
* 3.3.2) Materiais de apoio e Questionário (2)
    * 3.3.2.1) Materiais de apoio
    * 3.3.2.2) Certifique seu conhecimento

## Desenvolimento
Os cursos referente a banco de dados SQL, foram executados via docker. Através do arquivo **docker-compose.yaml** foram criados dois containers, um para o sistema de gerenciamento banco de dados (SGBD) SQL, que foi o **MySQL**, e outro para o administração do banco de dados pela internet, que foi o **phpmyadmin**, porém foi utilizado o **MySQL Workbench** para administração do banco de dados, pois já tinha instalado na maquina. Além disso, foi criado uma rede para comunicação do SGDB com o administrador.
### Comandos Linux
* Iniciando o serviço docker com super usuário (Digitar a senha)
```
sudo service docker start
```
* Alterando para o diretório onde a composição dos containers docker foi criada
```
cd /dio/dados_unimed_1/03-modulo_database
```

### Comandos Docker iniciais
* Criando uma composição de containers docker declarado no arquivo YAML
```
docker compose up -d
```
* Parando a composição de containers docker
```
docker compose stop
```
* Iniciando a composição de containers docker
```
docker compose start
```
* Verificando o status da composição de containers docker
```
docker compose ps -a
```
* Verificando o status de todos os containers docker
```
docker ps -a
```

----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
## 3.3.1.7) Explorando Comandos básicos SQL
[voltar](#ancora)   

* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Criando um banco de dados para o cenário de publicações
```
CREATE DATABASE BootDio_PublicationRecord;
```
* Exibindo os bancos de dados
```
SHOW DATABASES;
```
* Acessando o banco de dados criado
```
USE BootDio_PublicationRecord;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Removendo o banco de dados
```
DROP DATABASE BootDio_PublicationRecord;
```
* Criando um banco de dados para o cenário de publicações
```
CREATE DATABASE BootDio_PublicationRecord;
```
* Acessando o banco de dados criado
```
USE BootDio_PublicationRecord;
```
* Criando a tabela **periodicals**   
O ISSN, Número Internacional Normalizado para Publicações Seriadas ou Número Internacional Normalizado das Publicações em Série, é um Número serial de oito dígitos, usado para identificação única de uma publicação em série, aceite internacionalmente.
```
CREATE TABLE periodicals(
    publishing_company_id INT AUTO_INCREMENT,
    name VARCHAR(20),
    issn INT,
    PRIMARY KEY (publishing_company_id)
);
```
* Criando a tabela **publishing_company**
```
CREATE TABLE publishing_company(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) UNIQUE,
    country VARCHAR(5)
);
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Alterando a tabela **periodicals** e adicionando uma chave estrangeira
```
ALTER TABLE periodicals ADD CONSTRAINT fk_periodicals_1 FOREIGN KEY (publishing_company_id) REFERENCES publishing_company(id);
```
* Inserindo os dados na tabela **publishing_company**
```
INSERT INTO publishing_company (name, country) VALUES ('IEEE_EUA', 'EUA'), ('DataScienceMagazine', 'EUA');
```
* Selecionando os dados inseridos na tabela **publishing_company**
```
SELECT * FROM publishing_company;
```
* Inserindo os dados na tabela **publishing_company**
```
INSERT INTO publishing_company (name, country) VALUES ('IEEE_EU', 'EU');
```
* Selecionando os dados inseridos na tabela **publishing_company**
```
SELECT * FROM publishing_company;
```
* Selecionando os dados inseridos na tabela **periodicals**
```
SELECT * FROM periodicals;
```
* Inserindo os dados na tabela **periodicals**
```
INSERT INTO periodicals (publishing_company_id, name, issn) VALUES ('1', 'Special Issue', '156795164');
```
* Selecionando os dados inseridos na tabela **periodicals**
```
SELECT * FROM periodicals;
```
* Exibindo as tabelas
```
SHOW TABLES;
```
* Removendo o banco de dados criado
```
DROP DATABASE BootDio_PublicationRecord;
```