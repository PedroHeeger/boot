# RELATÓRIO DE IMPLEMENTAÇÃO DE SERVIÇOS AWS

Data: 05/10/2023   
Empresa: Abstergo Industries   
Responsável: Pedro Heeger Costa   

## Introdução
Este relatório apresenta o processo de implementação de ferramentas na empresa Abstergo Industries, realizado por Pedro Heeger Costa. O objetivo do projeto foi elencar 3 serviços AWS, com a finalidade de realizar diminuição de custos imediatos.

## Descrição do Projeto
O projeto de implementação de ferramentas foi dividido em 3 etapas, cada uma com seus objetivos específicos. A seguir, serão descritas as etapas do projeto:

Etapa 1: 
- Amazon Elastic Compute Cloud (EC2)
- Amazon Elastic Compute Cloud (EC2) faz parte da plataforma de computação em nuvem da Amazon.com, Amazon Web Services (AWS), que permite aos usuários alugar computadores virtuais para executar seus próprios aplicativos de computador. O EC2 incentiva a implantação escalável de aplicativos, fornecendo um serviço da Web por meio do qual um usuário pode inicializar uma Amazon Machine Image (AMI) para configurar uma máquina virtual, que a Amazon chama de "instância", contendo qualquer software desejado. Um usuário pode criar, iniciar e encerrar o servidor-instâncias conforme necessário, pagando por segundo para servidores ativos. O EC2 oferece aos usuários controle sobre a localização geográfica das instâncias, o que permite a otimização da latência e altos níveis de redundância.
- Este serviço seria responsável por fornecer a capacidade computacional escalável na nuvem, hospedando as aplicações web que construirão o site da empresa. Em caso de variação da demanda, novas instâncias podem ser executadas para atender o volume de requisições necessária, pagando apenas pelo tempo utilizado. Um balanceamento de cargas pode ser implantado para distribuir melhor o tráfego das requisições nos diferentes servidores.

Etapa 2: 
- Amazon Relational Database Service (RDS)
- Amazon Relational Database Service (RDS) é um serviço de banco de dados relacional distribuído da Amazon Web Services (AWS). É um serviço web executado "na nuvem" projetado para simplificar a configuração, operação e escalonamento de um banco de dados relacional para uso em aplicativos. Os processos de administração, como correção do software de banco de dados, backup de bancos de dados e ativação de recuperação pontual, são gerenciados automaticamente.
- Este serviço seria utilizado para o gerenciamento de dados da empresa, armazenando dados do cliente, do inventário de produtos da farmacêutica, das transações de vendas, do fornecimento de suprimentos e da rastreabilidade dos produtos. Com essas informações, também poderia ser feitas análises de dados para uma melhor tomada de decisão por parte da empresa, visando um melhor desempenho.

Etapa 3: 
- Amazon Simple Storage Service (S3)
- O Amazon Simple Storage Service (S3) é um serviço oferecido pela Amazon Web Services (AWS) que fornece armazenamento de objetos por meio de uma interface de serviço web. O Amazon S3 pode armazenar qualquer tipo de objeto, o que permite usos como armazenamento para aplicativos de Internet, backups, recuperação de desastres, arquivos de dados, data lakes para análise e armazenamento em nuvem híbrida.
- Este serviço seria utilizado para armazenamento de dados estáticos como: de imagens dos produtos, sendo útil para o site da farmacêutica exibir catálogos online; de documentações e regulamentações de medicamentos; para backups do banco de dados, garantindo a recuperação dos dados em caso de falha; e para armazenamento de logs tanto do banco de dados como da aplicação. Com isso, a farmacêutica pode economizar em custos de armazenamento, eliminando a necessidade de investir em hardware adicional e infraestrutura de armazenamento local. Além disso, a escalabilidade automática do S3 permite que a empresa pague apenas pelos recursos que realmente utiliza, proporcionando uma abordagem mais eficiente em termos de custos.


## Conclusão
A implementação de ferramentas na empresa *Abstergo Industries tem como esperado a redução de custos*, o que aumentará a eficiência e a produtividade da empresa. Recomenda-se a continuidade da utilização das ferramentas implementadas e a busca por novas tecnologias que possam melhorar ainda mais os processos da empresa.

<!-- ## Anexos

[lista de anexos, como manuais, documentos, planilhas, entre outros] -->

Assinatura do Responsável pelo Projeto:

Pedro Heeger Costa