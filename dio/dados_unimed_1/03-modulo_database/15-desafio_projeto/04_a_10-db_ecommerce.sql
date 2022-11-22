-- 15-Desafio de projeto: Construindo seu Primeiro Projeto Lógico de Banco de Dados
-- 15.1-Desafio de projeto: Construindo seu Primeiro Projeto Lógico de Banco de Dados
-- 15.1.4-Criando o esquema de Banco de Dados - Script SQL - Parte 1
-- 15.1.5-Criando o esquema de Banco de Dados - Script SQL - Parte 2
-- 15.1.6-Criando o esquema de Banco de Dados - Script SQL - Parte 3
-- 15.1.7-Criando o esquema de Banco de Dados - Script SQL - Parte 4
-- 15.1.8-Criando o esquema de Banco de Dados - Script SQL - Parte 5
-- 15.1.9-Criando o esquema de Banco de Dados - Script SQL - Parte 6

--- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIO DE E-COMMERCE:
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

--- Criar tabela cliente:
CREATE TABLE IF NOT EXISTS clients(
    idClients INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    Addres VARCHAR(255),
    CONSTRAINT unique_clients_cpf UNIQUE (CPF)
);

--- Criar tabela produto:
CREATE TABLE IF NOT EXISTS products(
    idProducts INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(100) NOT NULL,
    Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Rating FLOAT DEFAULT 0,
    Size VARCHAR(10)
);

--- Criar tabela pedido:
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

--- Criar tabela estoque:
CREATE TABLE IF NOT EXISTS stock(
    idStock INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(255),
    Quantity INT DEFAULT 0
);

--- Criar tabela fornecedor:
CREATE TABLE IF NOT EXISTS suppliers(
    idSuppliers INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_suppliers_cnpj UNIQUE (CNPJ)
);

--- Criar tabela vendedor:
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

--- Criar tabela produto-vendedor:
CREATE TABLE IF NOT EXISTS productSeller(
    idPSproduct INT,
    idPSseller INT,
    psQuantity INT DEFAULT 1,
    PRIMARY KEY (idPSproduct, idPSseller),
    CONSTRAINT fk_ps_product FOREIGN KEY (idPSproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_ps_seller FOREIGN KEY (idPSseller) REFERENCES sellers(idSellers)
);

--- Criar tabela produto-pedido:
CREATE TABLE IF NOT EXISTS productOrder(
    idPOproduct INT,
    idPOorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_po_product FOREIGN KEY (idPOproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_po_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrders)
);

--- Criar tabela produto-estoque:
CREATE TABLE IF NOT EXISTS productStock(
    idPEproduct INT,
    idPEstock INT,
    peLocation VARCHAR(255) NOT NULL,
    peQuantity INT DEFAULT 0,
    PRIMARY KEY (idPEproduct, idPEstock),
    CONSTRAINT fk_pe_product FOREIGN KEY (idPEproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_pe_stock FOREIGN KEY (idPEstock) REFERENCES stock(idStock)
);

--- Criar tabela produto-fornecedor:
CREATE TABLE IF NOT EXISTS productSupplier(
    idPFproduct INT,
    idPFsupplier INT,
    pfQuantity INT NOT NULL,
    PRIMARY KEY (idPFproduct, idPFsupplier),
    CONSTRAINT fk_pf_product FOREIGN KEY (idPFproduct) REFERENCES products(idProducts),
    CONSTRAINT fk_pf_supplier FOREIGN KEY (idPFsupplier) REFERENCES suppliers(idSuppliers)
);



--- Criar tabela pagamentos:
--- Para ser continuada no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias.
--- Além disso, reflita essa modificação no diagrama de esquema relacional.
--- Criar constraints relacionadas ao pagamento.
CREATE TABLE IF NOT EXISTS payments(
    idPayments INT AUTO_INCREMENT NOT NULL,
    idClients INT,
    TypePayment ENUM('Boleto', 'Cartão', 'Dois', 'Cartões') NOT NULL,
    LimitAvailable FLOAT,
    PRIMARY KEY (idPayments, idClients),
);


--- VERIFICANDO AS CONSTRAINTS CRIADAS:
USE information_schema;
DESC table_constraints;
DESC referential_constraints;

USE information_schema;
SELECT * FROM referential_constraints
    WHERE CONSTRAINT_SCHEMA = 'ecommerce';

USE information_schema;
SELECT * FROM table_constraints
    WHERE CONSTRAINT_SCHEMA = 'ecommerce'
    ORDER BY CONSTRAINT_TYPE;

-- DROP DATABASE ecommerce;
-- DELETE FROM orders WHERE idClients IN (1,2,3,4);

-- 15.1.10-Persistindo e Recuperando Dados a partir de Consultas SQL no Banco de Dados
--- Atualizando o Auto_Increment:
ALTER TABLE clients AUTO_INCREMENT = 1;
ALTER TABLE orders AUTO_INCREMENT = 1;
ALTER TABLE products AUTO_INCREMENT = 1;
ALTER TABLE suppliers AUTO_INCREMENT = 1;
ALTER TABLE sellers AUTO_INCREMENT = 1;
ALTER TABLE stock AUTO_INCREMENT = 1;

--- INSERÇÃO DOS DADOS NAS TABELAS:
--- inserir na tabela cliente:
INSERT INTO clients (Fname, Minit, Lname, CPF, Addres) VALUES
    ('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
    ('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alemeda 289, Centro - Cidade das Flores'),
    ('Ricardo', 'F', 'Silva', 45678913, 'Avenida Alameda Vinha 1009, Centro - Cidade das Flores'),
    ('Julia', 'S', 'França', 789123456, 'Rua Lareijras 861, Centro - Cidade das Flores'),
    ('Roberta', 'G', 'Assis', 98745631, 'Avenida Koller 19, Centro - Cidade das Flores'),
    ('Isabela', 'M', 'Cruz', 654789123, 'Rua Alameda das Flores 28, Centro - Cidade das Flores');

--- inserir na tabela produto:
INSERT INTO products (Pname, Classification_kids, Category, Rating, Size) VALUES
    ('Fone de ouvido', false, 'Eletrônico', '4', null),
    ('Barbie Elsa', true, 'Brinquedos', '3', null),
    ('Body Carters', true, 'Vestimenta', '5', null),
    ('Microfone Veda - Youtuber', false, 'Eletrônico', '4', null),
    ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
    ('Farinha de arroz', false, 'Alimentos', '2', null),
    ('Fire Stick Amazom', false, 'Eletrônico', '3', null);

--- inserir na tabela pedido:
INSERT INTO orders (idClients, Status, Description, Freight, PaymentCash) VALUES
    (1, DEFAULT, 'compra via aplicativo', null, 1),
    (2, DEFAULT, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, DEFAULT, 'compra via web site', 150, 0);

--- inserir na tabela estoque:
INSERT INTO stock (Location, Quantity) VALUES
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60);

--- inserir na tabela vendedor:
INSERT INTO sellers (SocialName, AbstractName, CNPJ, CPF, Location, Contact) VALUES
    ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

--- inserir na tabela fornecedor:
INSERT INTO suppliers (SocialName, CNPJ, Contact) VALUES
    ('Almeida e filhos', 123456789123456, 21985474),
    ('Eletrônicos Silva', 854519649143457, 21985484),
    ('Eletrônicos Valma', 934567893934695, 21975474);

--- inserir na tabela produto-vendedor:
INSERT INTO productSeller (idPSseller, idPSproduct, psQuantity) VALUES
    (1,6,80),
    (2,7,10);

--- inserir na tabela produto-pedido:
INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) VALUES
    (1,5,2,null),
    (2,5,1,null),
    (3,6,1,null);

--- inserir na tabela produto-estoque:
INSERT INTO productStock (idPEproduct, idPEstock, peLocation) VALUES
    (1,2,'RJ'),
    (2,6,'GO');

--- inserir na tabela produto-fornecedor:
INSERT INTO productSupplier (idPFproduct, idPFsupplier, pfQuantity) VALUES
    (1,1,500),
    (1,2,400),
    (2,1,633),
    (3,3,5),
    (2,2,15);


--- VERIFICANDO AS TABELAS:
SELECT * FROM clients;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM suppliers;
SELECT * FROM sellers;
SELECT * FROM stock;
SELECT * FROM productOrder;
SELECT * FROM productSupplier;
SELECT * FROM productStock;
SELECT * FROM productSeller;


--- REALIZANDO CONSULTAS:
SELECT count(*) FROM clients;
SELECT * FROM clients c, orders o WHERE c.idClients = o.idClients;

SELECT concat(c.Fname, ' ', c.Lname) AS Client, o.idOrders AS Orders, o.Status AS Status
    FROM clients c, orders o WHERE c.idClients = o.idClients;

INSERT INTO orders (idClients, Status, Description, Freight, PaymentCash) VALUES
    (2, DEFAULT, 'compra via aplicativo', null, 1);
SELECT * FROM clients c, orders o WHERE c.idClients = o.idClients;

SELECT Fname, count(*) FROM clients c, orders o
    WHERE c.idClients = o.idClients
    GROUP BY c.idClients;

SELECT * FROM clients c
    LEFT OUTER JOIN orders o ON c.idClients = o.idClients;

SELECT * FROM clients c
    INNER JOIN orders o ON c.idClients = o.idClients
    INNER JOIN productOrder po ON idPOorder = idOrders;

--- recuperação de pedido com produto associado
SELECT c.idClients, c.Fname, count(*) AS Number_of_orders FROM clients c
    INNER JOIN orders o ON c.idClients = o.idClients
    INNER JOIN productOrder po ON idPOorder = idOrders
    GROUP BY idClients;

--- recuperar quantos pedidos foram realizados pelos clientes?
SELECT c.idClients, c.Fname, count(*) AS Number_of_orders FROM clients c
    INNER JOIN orders o ON c.idClients = o.idClients
    GROUP BY idClients;

--- recuperar se algum vendedor também é fornecedor?
SELECT idSellers, s.SocialName, idSuppliers FROM sellers s, suppliers f
    WHERE s.SocialName = f.SocialName ORDER BY s.SocialName ASC;

--- relação de produtos, fornecedores e estoque
SELECT p.idProducts, p.Pname AS Product_Name, f.idSuppliers, f.SocialName, pf.Quantity
    FROM products p INNER JOIN productSupplier pf ON p.idProducts = pf.idPFproduct
    INNER JOIN suppliers f ON pf.idPFsupplier = f.idSuppliers;

SELECT p.idProducts, p.Pname AS Product_Name, f.idSuppliers, f.SocialName, e.idStock, e.Quantity AS Stock_Quantity
    FROM products p INNER JOIN productSupplier pf ON p.idProducts = pf.idPFproduct
    INNER JOIN suppliers f ON pf.idPFsupplier = f.idSuppliers
    INNER JOIN (productStock pe INNER JOIN stock e ON pe.idPEstock = e.idStock) ON p.idProducts = pe.idPEproduct;

4-Relação de nomes dos fornecedores e nomes dos produtos
--- relação de nomes dos fornecedores e nomes dos produtos
SELECT p.idProducts, p.Pname AS Product_Name, f.idSuppliers, f.SocialName
    FROM products p INNER JOIN productSupplier pf ON p.idProducts = pf.idPFproduct
    INNER JOIN suppliers f ON pf.idPFsupplier = f.idSuppliers;
