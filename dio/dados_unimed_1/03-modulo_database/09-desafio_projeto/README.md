# 9) Desafio de projeto: Construindo um Esquema Conceitual para Banco de dados (2)

Essa pasta **09-desafio_projeto** é uma pasta específica para o desafio de projeto construindo um esquema conceitual para banco de dados que está dentro do módulo 3 ([Bancos de Dados SQL e NoSQL](/dio/dados_unimed_1/03-modulo_database)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](/dio/dados_unimed_1).

Nela está contida todos os arquivos de modelagem de banco de dados deste desafio, que foram realizado no MySQL Workbench com a temática de oficina.

## Sobre o Projeto Conceitual para o Cenário Inicial
O desafio consiste na modelagem de um esquema de banco de dados do zero com temática de oficina. O script SQL para criação do esquema/banco de dados foi realizado no desafio **16-desafio_projeto**.

## Sobre o Projeto Conceitual para o Cenário Refinado
Para o cenário de refinamento, deve ser acrescentado os seguintes pontos:
- Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;  
- Pagamento – Pode ter cadastrado mais de uma forma de pagamento;   
- Entrega – Possui status e código de rastreio; 

----------------------------------------------------------------------------------------------
## Projeto Conceitual: oficina (Cenário Inicial/Refinado)

<a id="ancora"></a>
### Índice
* [Contexto](#ancora1)
  
* [Mapeamento do Diagrama ER](#ancora2)
    * [Cenário Incial](#ancora2.1)
    * [Cenário Refinado](#ancora2.2)


----------------------------------------------------------------------------------------------
<a id="ancora1"></a>
### Contexto.
* Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica;
* Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;
* Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega;   
* A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;
* O valor de cada peça também irá compor a OS;
* O cliente autoriza a execução dos serviços; 
* A mesma equipe avalia e executa os serviços;
* Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS;
* Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS. 
* Os mecânicos possuem código, nome, endereço e especialidade; 
* Cada OS possui: nº, data de emissão, um valor, status e uma data para conclusão dos trabalhos;  
  
[voltar](#ancora)



----------------------------------------------------------------------------------------------
### Mapeamento do Diagrama ER.

#### Cenário Inicial
<a id="ancora2.1"></a>
![img](https://github.com/PedroHeeger/boot/blob/teste/dio/dados_unimed_1/03-modulo_database/09-desafio_projeto/)

[voltar](#ancora)

#### Cenário Refinado.
<a id="ancora2.2"></a>
![img](dio/dados_unimed_1/03-modulo_database/09-desafio_projeto/)

[voltar](#ancora)