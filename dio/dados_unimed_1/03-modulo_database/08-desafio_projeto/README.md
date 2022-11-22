# 8) Desafio de projeto: Refinando um Projeto Conceitual de Banco de Dados-E-COMMERCE (12)

Essa pasta **08-desafio_projeto** é uma pasta específica para o desafio de projeto refinando um projeto conceitual de banco de dados que está dentro do módulo 3 ([Bancos de Dados SQL e NoSQL](/dio/dados_unimed_1/03-modulo_database)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](/dio/dados_unimed_1).

Nela está contida todos os arquivos de modelagem de banco de dados que foi realizado ao longo do desafio, tanto as arquivos das aulas de Draw.io e DBDesigner, como também os arquivos das aulas de MySQL Workbench contendo as modelagens dos bancos de dados de universidade e e-commerce, que foi o objetivo do desafio.

## Sobre o Projeto Conceitual para o Cenário Inicial
O desafio consiste na modelagem de um esquema de banco de dados com temática de e-commerce. O script SQL para criação do esquema/banco de dados foi realizado no desafio **15-desafio_projeto**.

## Sobre o Projeto Conceitual para o Cenário Refinado
Para o cenário de refinamento, deve ser acrescentado os seguintes pontos:
- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;  
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;   
- Entrega – Possui status e código de rastreio; 

----------------------------------------------------------------------------------------------
## Projeto Conceitual: e-commerce (Cenário Inicial/Refinado)

<a id="ancora"></a>
### Índice
* [Contexto](#ancora1)
    * [Produtos](#ancora1.1)
    * [Clientes](#ancora1.2)
    * [Pedidos](#ancora1.3)
  
* [Mapeamento do Diagrama ER](#ancora2)
    * [Cenário Incial](#ancora2.1)
    * [Cenário Refinado](#ancora2.2)


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
### Mapeamento do Diagrama ER.

#### Cenário Inicial
<a id="ancora2.1"></a>
![img](https://github.com/PedroHeeger/boot/blob/teste/dio/dados_unimed_1/03-modulo_database/08-desafio_projeto/08-refinando_universidade.png)

[voltar](#ancora)

#### Cenário Refinado.
<a id="ancora2.2"></a>
![img](dio/dados_unimed_1/03-modulo_database/08-desafio_projeto/08-refinando_universidade.png)

[voltar](#ancora)