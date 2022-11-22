# 15) Desafio de projeto: Construindo seu Primeiro Projeto Lógico de Banco de Dados (12)

Essa pasta **15-desafio_projeto** é uma pasta específica para o desafio de projeto construindo seu primeiro projeto lógico de banco de dados que está dentro do módulo 3 ([Bancos de Dados SQL e NoSQL](/dio/dados_unimed_1/03-modulo_database)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](/dio/dados_unimed_1).

Nela está contida dois arquvios SQL com os scripts para criação do esquema de banco de dados do projeto e-commerce, sendo um deles o cenário inicial e o outro cenário refinado. A modelagem de ambos foi realizada no [08-desafio_projeto](/dio/dados_unimed_1/03-modulo_database/08-desafio_projeto/).

## Sobre o Projeto Lógico para o Cenário Inicial
O desafio consiste na criação de Script SQL para criação do esquema de banco de dados, modelado no desafio **08-desafio_projeto**, além da persistência de dados e realização de consultas utilizando as seguintes clásulas:
* Filtros com WHERE Statement   
* Crie expressões para gerar atributos derivados    
* Defina ordenações dos dados com ORDER BY  
* Condições de filtros aos grupos – HAVING Statement    
* Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados  

### Diretrizes
* Não há um mínimo de queries a serem realizadas;
* Os tópicos supracitados devem estar presentes nas queries;
* Elabore perguntas que podem ser respondidas pelas consultas;
* As cláusulas podem estar presentes em mais de uma query;

## Sobre o Projeto Lógico para o Cenário Refinado
Para o cenário de refinamento, deve ser aplicado os mesmos pontos da modelagem conceitual realizado no desafio **08-desafio_projeto**:
* Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;  
* Pagamento – Pode ter cadastrado mais de uma forma de pagamento;   
* Entrega – Possui status e código de rastreio; 

----------------------------------------------------------------------------------------------
## Projeto Lógico: e-commerce (Cenário Inicial)

<a id="ancora"></a>
### Índice
* [Contexto](#ancora1)
    * [Produtos](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Pedidos](#ancora1.3)
  
* [Script SQL para criação do esquema do banco de dados](#ancora2)
    * [CREATE DATABASE](#ancora2.1)
    * [CREATE TABLE clients](#ancora2.2)
    * [CREATE TABLE products](#ancora2.3)
    * [CREATE TABLE orders](#ancora2.4)
    * [CREATE TABLE stock](#ancora2.5)
    * [CREATE TABLE suppliers](#ancora2.6)
    * [CREATE TABLE sellers](#ancora2.7)
    * [CREATE TABLE productSeller](#ancora2.8)
    * [CREATE TABLE productOrder](#ancora2.9)
    * [CREATE TABLE productStock](#ancora2.10)
    * [CREATE TABLE productSupplier](#ancora2.11)

* [Script SQL para inserção dos dados](#ancora3)
    * [INSERT INTO clients](#ancora3.1)
    * [INSERT INTO products](#ancora3.2)
    * [INSERT INTO orders](#ancora3.3)
    * [INSERT INTO stock](#ancora3.4)
    * [INSERT INTO suppliers](#ancora3.5)
    * [INSERT INTO sellers](#ancora3.6)
    * [INSERT INTO productSeller](#ancora3.7)
    * [INSERT INTO productOrder](#ancora3.8)
    * [INSERT INTO productStock](#ancora3.9)
    * [INSERT INTO productSupplier](#ancora3.10)

* [Script SQL para consulta dos dados](#ancora3)
    * [1-Quantos pedidos foram feitos por cada cliente?](#ancora4.1)
    * [2-Algum vendedor também é fornecedor?](#ancora4.2)
    * [3-Relação de produtos, fornecedores e estoque](#ancora4.3)
    * [4-Relação de nomes dos fornecedores e nomes dos produtos](#ancora4.4)
    * [5-](#ancora4.5)
    * [6-](#ancora4.6)
    * [7-](#ancora4.7)
    * [8-](#ancora4.8)
    * [9-](#ancora4.9)
    * [10-](#ancora4.10)



----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
### Contexto.

<a id="ancora1.1"></a>
#### Produtos
* Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros).
* Cada produto possui um fornecedor.
* Um ou mais produtos podem compor um pedido.   

[voltar](#ancora)   


#### Clientes
<a id="ancora1.3"></a>
* O cliente pode se cadastrar no site com seu CPF ou CNPJ.
* O Endereço do cliente irá determinar o valor do frete.
* Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.

[voltar](#ancora)

#### Pedidos
<a id="ancora1.4"></a>
* Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega.
* Um produto ou mais compoem o pedido.
* O pedido pode ser cancelado.
  
[voltar](#ancora)




----------------------------------------------------------------------------------------------
### Script SQL para criação do esquema do banco de dados.
<a id="ancora2"></a>

#### CREATE DATABASE:
<a id="ancora2.1"></a>
```
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;
```
[voltar](#ancora)

#### CREATE TABLE clients:
<a id="ancora2.2"></a>
```
CREATE TABLE IF NOT EXISTS clients(
    idClients INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    Addres VARCHAR(255),
    CONSTRAINT unique_clients_cpf UNIQUE (CPF)
);
```
[voltar](#ancora)

#### CREATE TABLE products:
<a id="ancora2.3"></a>
```
CREATE TABLE IF NOT EXISTS products(
    idProducts INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(100) NOT NULL,
    Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Rating FLOAT DEFAULT 0,
    Size VARCHAR(10)
);
```
[voltar](#ancora)

#### CREATE TABLE orders:
<a id="ancora2.4"></a>
```
CREATE TABLE IF NOT EXISTS orders(
    idOrders INT AUTO_INCREMENT PRIMARY KEY,
    idClients INT,
    Status ENUM('Confirmado', 'Em processamento', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Confirmado',
    Description VARCHAR(255),
    Freight FLOAT DEFAULT 10,
    PaymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idClients) REFERENCES clients(idClients)
    ON UPDATE CASCADE ON DELETE SET NULL
);
```
[voltar](#ancora)

#### CREATE TABLE stock:
<a id="ancora2.5"></a>
```
CREATE TABLE IF NOT EXISTS stock(
    idStock INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Quantity INT DEFAULT 0
);
```
[voltar](#ancora)

#### CREATE TABLE suppliers:
<a id="ancora2.6"></a>
```
CREATE TABLE IF NOT EXISTS suppliers(
    idSuppliers INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_suppliers_cnpj UNIQUE (CNPJ)
);
```
[voltar](#ancora)

#### CREATE TABLE sellers:
<a id="ancora2.7"></a>
```
CREATE TABLE IF NOT EXISTS sellers(
    idSellers INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstractName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_sellers_cnpj UNIQUE (CNPJ),
    CONSTRAINT unique_sellers_cpf UNIQUE (CPF)
);
```
[voltar](#ancora)

#### CREATE TABLE productSeller:
<a id="ancora2.8"></a>
```
CREATE TABLE IF NOT EXISTS productSeller(
    idPSproduct INT,
    idPSseller INT,
    psQuantity INT DEFAULT 1,
    PRIMARY KEY (idPSproduct, idPSseller),
    CONSTRAINT fk_ps_product FOREIGN KEY (idPSproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_ps_seller FOREIGN KEY (idPSseller) REFERENCES sellers(idSellers)
);
```
[voltar](#ancora)

#### CREATE TABLE productOrder:
<a id="ancora2.9"></a>
```
CREATE TABLE IF NOT EXISTS productOrder(
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_po_product FOREIGN KEY (idPOproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_po_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrders)
);
```
[voltar](#ancora)

#### CREATE TABLE productStock:
<a id="ancora2.10"></a>
```
CREATE TABLE IF NOT EXISTS productStock(
    idPEproduct INT,
    idPEstock INT,
    peLocation VARCHAR(255) NOT NULL,
    peQuantity INT DEFAULT 0,
    PRIMARY KEY (idPEproduct, idPEstock),
    CONSTRAINT fk_pe_product FOREIGN KEY (idPEproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_pe_stock FOREIGN KEY (idPEstock) REFERENCES stock(idStock)
);
```
[voltar](#ancora)

#### CREATE TABLE productSupplier:
<a id="ancora2.11"></a>
```
CREATE TABLE IF NOT EXISTS productSupplier(
    idPFproduct INT,
    idPFsupplier INT,
    pfQuantity INT NOT NULL,
    PRIMARY KEY (idPFproduct, idPFsupplier),
    CONSTRAINT fk_pf_product FOREIGN KEY (idPFproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_pf_supplier FOREIGN KEY (idPFsupplier) REFERENCES suppliers(idSuppliers)
);
```
[voltar](#ancora)



----------------------------------------------------------------------------------------------
### Script SQL para inserção dos dados
<a id="ancora3"></a>
#### INSERT INTO clients:
<a id="ancora3.1"></a>
```
INSERT INTO clients (Fname, Minit, Lname, CPF, Addres) VALUES
    ('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
    ('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alemeda 289, Centro - Cidade das Flores'),
    ('Ricardo', 'F', 'Silva', 45678913, 'Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),
    ('Julia', 'S', 'França', 789123456, 'Rua Lareijras 861, Centro - Cidade das Flores'),
    ('Roberta', 'G', 'Assis', 98745631, 'Avenida Koller 19, Centro - Cidade das Flores'),
    ('Isabela', 'M', 'Cruz', 654789123, 'Rua Alameda das Flores 28, Centro - Cidade das Flores');
```
[voltar](#ancora)


#### INSERT INTO products:
<a id="ancora3.2"></a>
```
INSERT INTO products (Pname, Classification_kids, Category, Rating, Size) VALUES
    ('Fone de ouvido', false, 'Eletrônico', '4', null),
    ('Barbie Elsa', true, 'Brinquedos', '3', null),
    ('Body Carters', true, 'Vestimenta', '5', null),
    ('Microfone Veda - Youtuber', false, 'Eletrônico', '4', null),
    ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
    ('Farinha de arroz', false, 'Alimentos', '2', null),
    ('Fire Stick Amazom', false, 'Eletrônico', '3', null);
```
[voltar](#ancora)

#### INSERT INTO orders:
<a id="ancora3.3"></a>
```
INSERT INTO orders (idClients, Status, Description, Freight, PaymentCash) VALUES
    (1, DEFAULT, 'compra via aplicativo', null, 1),
    (2, DEFAULT, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, DEFAULT, 'compra via web site', 150, 0);
```
[voltar](#ancora)

#### INSERT INTO stock:
<a id="ancora3.4"></a>
```
INSERT INTO stock (Location, Quantity) VALUES
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60);
```
[voltar](#ancora)

#### INSERT INTO sellers:
<a id="ancora3.5"></a>
```
INSERT INTO suppliers (SocialName, CNPJ, Contact) VALUES
    ('Almeida e filhos', 123456789123456, 21985474),
    ('Eletrônicos Silva', 854519649143457, 21985484),
    ('Eletrônicos Valma', 934567893934695, 21975474);
```
[voltar](#ancora)

#### INSERT INTO suppliers:
<a id="ancora3.6"></a>
```
INSERT INTO sellers (SocialName, AbstractName, CNPJ, CPF, Location, Contact) VALUES
    ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);
```
[voltar](#ancora)

#### INSERT INTO productSeller:
<a id="ancora3.7"></a>
```
INSERT INTO productSeller (idPSseller, idPSproduct, psQuantity) VALUES
    (1,6,80),
    (2,7,10);
```
[voltar](#ancora)

#### INSERT INTO productOrder:
<a id="ancora3.8"></a>
```
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
    (1,5,2,null),
    (2,5,1,null),
    (3,6,1,null);
```
[voltar](#ancora)

#### INSERT INTO productStock:
<a id="ancora3.9"></a>
```
INSERT INTO productStock (idPEproduct, idPEstock, peLocation) VALUES
    (1,2,'RJ'),
    (2,6,'GO');
```
[voltar](#ancora)

#### INSERT INTO productSupplier:
<a id="ancora3.10"></a>
```
INSERT INTO productSupplier (idPFproduct, idPFsupplier, pfQuantity) VALUES
    (1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,15);
```
[voltar](#ancora)



----------------------------------------------------------------------------------------------
### Script SQL para inserção dos dados
<a id="ancora3"></a>
#### 1-Quantos pedidos foram feitos por cada cliente?
<a id="ancora3.1"></a>
```
SELECT c.idClients, c.Fname, count(*) AS Number_of_orders FROM clients c
    INNER JOIN orders o ON c.idClients = o.idClients
    GROUP BY idClients;
```
[voltar](#ancora)

#### 2-Algum vendedor também é fornecedor?
<a id="ancora3.2"></a>
```
SELECT idSellers, s.SocialName, idSuppliers FROM sellers s, suppliers f
    WHERE s.SocialName = f.SocialName ORDER BY s.SocialName ASC;
```
[voltar](#ancora)

#### 3-Relação de produtos, fornecedores e estoque
<a id="ancora3.3"></a>
```
SELECT p.idProducts, p.Pname AS Product_Name, f.idSuppliers, f.SocialName, pf.Quantity
    FROM products p INNER JOIN productSupplier pf ON p.idProducts = pf.idPFproduct
    INNER JOIN suppliers f ON pf.idPFsupplier = f.idSuppliers;
```
[voltar](#ancora)

#### 4-Relação de nomes dos fornecedores e nomes dos produtos
<a id="ancora3.4"></a>
```
SELECT p.idProducts, p.Pname AS Product_Name, f.idSuppliers, f.SocialName
    FROM products p INNER JOIN productSupplier pf ON p.idProducts = pf.idPFproduct
    INNER JOIN suppliers f ON pf.idPFsupplier = f.idSuppliers;
```
[voltar](#ancora)



----------------------------------------------------------------------------------------------
<!-- TODO: Organizar o cenário inicial e fazer o refinado -->
## Projeto Lógico: e-commerce (Cenário Refinado)

<a id="ancora"></a>
### Índice
* [Contexto](#ancora1)
    * [Produtos](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Pedidos](#ancora1.3)
    * [Refinamento](#ancora1.4)
  
* [Script SQL para criação do esquema do banco de dados](#ancora2)
    * [CREATE DATABASE](#ancora2.1)
    * [CREATE TABLE clients](#ancora2.2)
    * [CREATE TABLE products](#ancora2.3)
    * [CREATE TABLE orders](#ancora2.4)
    * [CREATE TABLE stock](#ancora2.5)
    * [CREATE TABLE suppliers](#ancora2.6)
    * [CREATE TABLE sellers](#ancora2.7)
    * [CREATE TABLE productSeller](#ancora2.8)
    * [CREATE TABLE productOrder](#ancora2.9)
    * [CREATE TABLE productStock](#ancora2.10)
    * [CREATE TABLE productSupplier](#ancora2.11)

* [Script SQL para inserção dos dados](#ancora3)
    * [INSERT INTO clients](#ancora3.1)
    * [INSERT INTO products](#ancora3.2)
    * [INSERT INTO orders](#ancora3.3)
    * [INSERT INTO stock](#ancora3.4)
    * [INSERT INTO suppliers](#ancora3.5)
    * [INSERT INTO sellers](#ancora3.6)
    * [INSERT INTO productSeller](#ancora3.7)
    * [INSERT INTO productOrder](#ancora3.8)
    * [INSERT INTO productStock](#ancora3.9)
    * [INSERT INTO productSupplier](#ancora3.10)

* [Script SQL para consulta dos dados](#ancora3)
    * [1-Quantos pedidos foram feitos por cada cliente?](#ancora4.1)
    * [2-Algum vendedor também é fornecedor?](#ancora4.2)
    * [3-Relação de produtos, fornecedores e estoque](#ancora4.3)
    * [4-Relação de nomes dos fornecedores e nomes dos produtos](#ancora4.4)
    * [5-](#ancora4.5)
    * [6-](#ancora4.6)
    * [7-](#ancora4.7)
    * [8-](#ancora4.8)
    * [9-](#ancora4.9)
    * [10-](#ancora4.10)