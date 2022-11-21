# 8) Desafio de projeto: Refinando um Projeto Conceitual de Banco de Dados-E-COMMERCE (12)

Essa pasta **08-desafio_projeto** é uma pasta específica para o desafio de projeto refinando um projeto conceitual de banco de dados que está dentro do módulo 3 ([Bancos de Dados SQL e NoSQL](/dio/dados_unimed_1/03-modulo_database)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](/dio/dados_unimed_1).

Nela está contida todos os arquivos de modelagem de banco de dados que foi realizado ao longo do desafio, tanto as arquivos das aulas de Draw.io e DBDesigner, como também os arquivos das aulas de MySQL Workbench contendo as modelagens dos bancos de dados de universidade e e-commerce já refinados conforme solicitado.

E-COMMERCE:
    - Escopo: Venda de produtos.    
    - Entidades: Produto, Estoque, Cliente, Pedido, Fornecedor. 
    - Narrativa - Produto: Os produtos são vendidos por uma única plataforma online. Contudo, estes podem ter vendedores distintos (terceiros); Cada produto possui um fornecedor; Um ou mais produtos podem compor um pedido.  
    - Narrativa - Cliente: O cliente pode se cadastrar no site com seu CPF ou CNPJ; O endereço do cliente irá determinar o valor do frete; Um cliente pode comprar mais de um pedido. Este tem um período de carência para devolução do produto.    
    - Narrativa - Pedido: Os pedidos são criados por clientes e possuem informações de compra, endereço e status de entrega; Um produto ou mais compoem o pedido; O pedido pode ser cancelado.  
    - Narrativa - Fornecedor & Estoque: 