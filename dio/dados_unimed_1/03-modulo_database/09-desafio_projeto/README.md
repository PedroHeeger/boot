# 9) Desafio de projeto: Construindo um Esquema Conceitual para Banco de dados (2)

Essa pasta **09-desafio_projeto** é uma pasta específica para o desafio de projeto construindo um esquema conceitual para banco de dados que está dentro do módulo 3 ([Bancos de Dados SQL e NoSQL](github.com/PedroHeeger/boot/tree/teste/dio/dados_unimed_1/02-curso_python)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](https://github.com/PedroHeeger/boot/tree/teste/dio/dados_unimed_1).

Nela está contida todos os arquivos de modelagem de banco de dados que foi realizado ao longo do desafio.

OFICINA:
    - Escopo: Revisão de veículo.
    - Entidades: Ordem de Serviço; Cliente; Veículo; Equipe; Mecânico; Serviço; Peça.
    - Narrativa - Oficina: Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica; Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas; Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
    - Narrativa - Oficina: Os mecânicos possuem código, nome, endereço e especialidade; Cada OS possui: nº, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
    - Narrativa - Oficina: Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS; Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.