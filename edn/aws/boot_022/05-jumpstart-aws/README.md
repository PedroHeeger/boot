# Bootcamp AWS re/Start-Cloud Computing - Module 5   <img src="../0-aux/logo_boot.png" alt="boot_022" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">edn   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/edn.png" alt="edn" width="auto" height="25"></a> 
### Software/Subject: <a href="../../">aws    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_022 (Bootcamp AWS re/Start-Cloud Computing)   <img src="../0-aux/logo_boot.png" alt="boot_022" width="auto" height="25"></a>
### Module: 5. Redes 

---

This folder refers to Module 5 **Redes** from bootcamp [**Bootcamp AWS re/Start-Cloud Computing**](../).

### Theme:
- Cloud Computing

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Linux Distribution: 
  - Amazon Linux   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/amazon_linux.png" alt="amazon_linux" width="auto" height="25">
- Virtualization: 
  - Vocareum   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/sites/vocareum.png" alt="vocareum" width="auto" height="25">
- Cloud:
  - AWS   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
  - Amazon Elastic Compute Cloud (EC2)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_ec2.svg" alt="aws_ec2" width="auto" height="25">
  - Amazon Virtual Private Cloud (VPC)   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/cloud/aws_vpc.svg" alt="aws_vpc" width="auto" height="25">
  - Google Drive   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Visual Studio Code (VS Code)   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

### Bootcamp Module 5 Structure

5. <a name="item5">Jumpstart na AWS</a><br>
  5.1. <a href="#item5.1">AWS Cloud Adoption Framework</a><br>
  5.2. <a href="#item5.2">AWS Well Architected Framework</a><br>

---

### Objective:
O objetivo deste módulo do bootcamp foi aprender sobre como funciona as redes na cloud da **AWS**, apresentando o serviço voltado para isso que é o **Amazon Virtual Private Cloud (Amazon VPC)**. Também foi ensinado como construir uma VPC com sub-redes pública e privada, gateway de internet e NAT gateway, tabela de rotas, grupo de segurança e provisionar uma instância do **Amazon Elastic Compute Cloud (Amazon EC2)** nesta VPC, acessando ela posteriormente.

### Structure:
A estrutura das pastas obedece a estruturação do bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibido a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md2-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em um curso e um laboratório. Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item5.1"><h4>5.1 AWS Cloud Adoption Framework</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

A jornada de cada organização na adoção da nuvem é única. No entanto, para que uma organização migre com sucesso seu portfólio de TI para a nuvem, é essencial que três elementos ( pessoas, processos e tecnologia) estejam alinhados. Os líderes de negócios e tecnologia precisam entender o estado atual da organização, o estado desejado e a transição necessária para atingir esse estado, a fim de definir metas e criar processos para a equipe. O **AWS Cloud Adoption Framework (AWS CAF)** auxilia as organizações a desenvolver planos eficientes e eficazes para a adoção da nuvem. As práticas recomendadas e orientações oferecidas pelo framework ajudam a criar uma abordagem abrangente para gerenciar a computação em nuvem na organização e em todo o ciclo de vida da TI.

O **AWS CAF** simplifica o complexo processo de planejamento de migração para a nuvem, ao dividí-lo em seis partes gerenciáveis, chamadas perspectivas. Essas perspectivas cobrem áreas essenciais focadas em pessoas, processos e tecnologia. As habilidades dentro de cada perspectiva identificam as áreas da organização que precisam de atenção. Com base nisso, as ações são organizadas em fluxos de trabalho prescritivos que apoiam uma migração bem-sucedida para a nuvem. Cada perspectiva cobre responsabilidades específicas, gerenciadas por stakeholders que têm funções relacionadas. As perspectivas de negócios, pessoas e governança se concentram nas capacidades de negócios, enquanto as perspectivas de plataforma, segurança e operações se concentram em recursos técnicos.

Os stakeholders da perspectiva de negócios (gerentes de negócios, gerentes financeiros, proprietários de orçamento e responsáveis pela estratégia) podem usar o **AWS CAF** para criar um caso de negócio sólido para a adoção da nuvem e priorizar iniciativas de migração. Eles devem assegurar que as estratégias e metas de negócios da organização estejam alinhadas com suas estratégias e objetivos de TI. Entre os principais recursos dessa perspectiva estão: Finanças de TI, Estratégia de TI, Realização de benefícios e Gerenciamento de riscos empresariais. Os stakeholders da perspectiva de pessoas (recursos humanos, equipes e gerentes de pessoas) podem usar o **AWS CAF** para avaliar estruturas e funções organizacionais, bem como novos requisitos de habilidades e processos, identificando possíveis lacunas. Realizar uma análise de necessidades e lacunas pode ajudar a priorizar o treinamento, a equipe e as mudanças organizacionais para criar uma organização mais ágil. Seus principais recursos incluem: Gerenciamento de recursos, Gerenciamento de incentivos, Gerenciamento de carreiras, Gerenciamento de treinamento e Gerenciamento de mudanças organizacionais. Já os stakeholders da perspectiva de governança (Chief Information Officer ou CIO, gerentes de programas, arquitetos empresariais, analistas de negócios e gerentes de portfólio) podem usar o **AWS CAF** para focar nas habilidades e processos necessários para alinhar a estratégia e as metas de TI com a estratégia e as metas empresariais. Esse enfoque ajuda a organização a maximizar o valor comercial de seu investimento em TI e a minimizar os riscos empresariais. Seus recursos principais são: Gerenciamento de portfólio, Gerenciamento de programas e projetos, Medição de desempenho dos negócios e Gerenciamento de licenças.

Os stakeholders da perspectiva de plataforma (diretor de tecnologia ou CTO, gerentes de TI e arquitetos de soluções) utilizam diversas dimensões e modelos de arquitetura para compreender e comunicar a natureza dos sistemas de TI e suas interrelações. Eles devem ser capazes de descrever detalhadamente a arquitetura do ambiente de destino. O **AWS CAF** inclui princípios e padrões para a implementação de novas soluções na nuvem e para a migração de cargas de trabalho locais para a nuvem. Seus principais recursos incluem: Provisionamento de computação, Provisionamento de rede, Provisionamento de armazenamento, Provisionamento de banco de dados, Arquitetura de sistemas e soluções, e Desenvolvimento de aplicativos. Os stakeholders da perspectiva de segurança (diretor de segurança da informação ou CISO, gerentes de segurança de TI e analistas de segurança de TI) devem assegurar que a organização atenda aos objetivos de segurança, como visibilidade, auditoria, controle e agilidade. Eles podem usar o **AWS CAF** para estruturar a seleção e a implementação de controles de segurança que atendam às necessidades da organização. Seus principais recursos incluem: Gerenciamento de identidade e acesso, Controle de detecção, Segurança de infraestrutura, Proteção de dados e Resposta a incidentes. Por fim, os stakeholders da perspectiva de operações (gerentes de operações de TI e gerentes de suporte de TI) definem como as atividades diárias, trimestrais e anuais são conduzidas. Eles se alinham e apoiam as operações da empresa. O **AWS CAF** auxilia esses stakeholders a definir os procedimentos operacionais atuais, bem como a identificar os treinamentos e mudanças processuais necessários para uma adoção bem-sucedida da nuvem. Seus principais recursos incluem: Monitoramento de serviços, Monitoramento de desempenho de aplicativos, Gerenciamento de inventário de recursos, Gerenciamento de versões ou mudanças, Relatórios e análise, Continuidade dos negócios ou recuperação de desastres (DR), e Catálogo de serviços de TI.

<a name="item5.2"><h4>5.2 AWS Well Architected Framework</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

Arquitetura é tanto uma arte quanto uma ciência que envolve projetar e criar grandes estruturas. Devido ao seu tamanho e complexidade, grandes sistemas exigem a expertise de arquitetos para serem gerenciados. Arquitetos de nuvem colaboram com tomadores de decisão para identificar objetivos de negócios, alinhar resultados tecnológicos com essas metas e trabalhar com as equipes de implementação para desenvolver as soluções adequadas. O **AWS Well-Architected Framework** documenta um conjunto de perguntas essenciais que ajudam a avaliar como uma arquitetura específica se alinha às melhores práticas da nuvem. Este framework oferece uma abordagem consistente para avaliar sistemas com base nas qualidades esperadas de sistemas modernos baseados na nuvem, além das melhorias necessárias para alcançar essas qualidades. O **AWS Well-Architected Framework** auxilia os arquitetos de nuvem na avaliação e aprimoramento de suas arquiteturas, proporcionando uma compreensão mais profunda de como as decisões de design podem impactar os negócios. Ele oferece um conjunto de perguntas elaboradas por especialistas da **AWS** para ajudar os clientes a refletirem cuidadosamente sobre suas arquiteturas. À medida que as tecnologias de nuvem evoluem e a **AWS** adquire mais conhecimento através de seu trabalho com clientes, a definição de uma arquitetura bem projetada é continuamente refinada e aprimorada.

O **AWS Well-Architected Framework** não fornece detalhes sobre a implementação ou padrões de arquitetura específicos. No entanto, ele oferece um conjunto de perguntas essenciais que ajudam a entender como uma arquitetura particular se alinha às melhores práticas da nuvem. Além disso, o framework inclui informações sobre serviços e soluções relevantes para cada pergunta, bem como referências a recursos úteis. O **AWS Well-Architected Framework** auxilia na concepção da arquitetura, abordando cinco perspectivas fundamentais, também conhecidas como pilares. Esses pilares são excelência operacional, segurança, confiabilidade, eficiência de desempenho e otimização de custos.

O primeiro pilar é excelência operacional, cujo foco é a execução e o monitoramento de sistemas para entregar valor comercial e aprimorar continuamente os processos e procedimentos. Os principais tópicos incluem: gerenciamento e automação de alterações, resposta a eventos e definição de padrões para gerenciar com êxito as operações diárias. Existem seis princípios de design para a excelência operacional na nuvem: Executar operações como código; Anotar a documentação; Fazer alterações frequentes, pequenas e reversíveis; Refinar os procedimentos de operações com frequência; Prever falhas; Aprender com todos os eventos e falhas operacionais.
- Executar operações como código implica em definir toda a carga de trabalho (ou seja, aplicativos e infraestrutura) como código e atualizá-la através de códigos. Procedimentos operacionais são implementados como código e configurados para serem acionados automaticamente em resposta a eventos. Ao adotar a prática de executar operações como código, ocorre a minimização do erro humano e a garantia de respostas consistentes a eventos.
- Anotar a documentação envolve automatizar a criação de documentação anotada após cada compilação. Essa documentação anotada pode ser utilizada tanto por pessoas quanto por sistemas. As anotações podem servir como entrada para o código de operações.
- Fazer alterações frequentes, em pequena escala e reversíveis é fundamental. Programe as cargas de trabalho de forma a possibilitar atualizações regulares dos componentes. Execute as mudanças em incrementos pequenos, facilitando a reversão em caso de falha (preferencialmente sem impactar os clientes).
- Refinar os procedimentos operacionais regularmente é essencial. Esteja atento a oportunidades para aprimorá-los conforme suas cargas de trabalho evoluem. Realize simulações periódicas para revisar todos os procedimentos, validar sua eficácia e garantir que as equipes estejam bem familiarizadas com eles.
- Prever falhas é crucial. Identifique as potenciais fontes de falha para eliminá-las ou reduzir seu impacto. Realize testes de cenários de falha para compreender melhor seu impacto. Verifique a eficácia de seus procedimentos de resposta por meio de testes e assegure-se de que as equipes estejam familiarizadas com sua execução. Estabeleça simulações periódicas para avaliar tanto as cargas de trabalho quanto as respostas da equipe a eventos simulados.
- Aprenda com todas as falhas operacionais. Incentive a melhoria contínua através das lições aprendidas em cada evento e falha operacional. Compartilhe esses insights com as equipes e toda a organização para promover uma cultura de aprendizado e aprimoramento.

O pilar da segurança aborda a necessidade de monitorar e proteger informações, sistemas e ativos, enquanto se entrega valor comercial através de avaliações de riscos e estratégias de mitigação. Os principais aspectos incluem: proteger a confidencialidade e integridade dos dados, gerenciar identidades e permissões de acesso (gestão de privilégios), fortalecer a segurança dos sistemas e estabelecer controles para detecção de eventos de segurança. É fundamental adotar princípios de design específicos para reforçar a segurança, tais como: Aplicar a segurança em todas as camadas; Habilitar a rastreabilidade; Implementar o princípio do menor privilégio; Proteger o sistema; Automatizar as práticas recomendadas de segurança.
- Aplicar a segurança em todas as camadas é fundamental para garantir múltiplas defesas. É essencial proteger a infraestrutura em todos os lugares e em cada nível. Em um data center físico, a segurança geralmente é concentrada apenas no perímetro. Porém, com a **AWS**, é possível estabelecer segurança tanto no perímetro quanto entre os recursos, garantindo a proteção não apenas do ambiente como um todo, mas também de componentes específicos uns dos outros.
- Habilitar a rastreabilidade é essencial. Ative o registro em log e a auditoria de todas as ações ou alterações no ambiente para garantir uma trilha de auditoria completa.
- Implementar o princípio do menor privilégio é crucial. Certifique-se de que as autorizações no ambiente sejam adequadas, implementando controles de acesso lógico sólidos nos recursos da **AWS** para conceder as permissões mínimas necessárias para atender aos requisitos empresariais.
- Proteger o sistema é primordial. Com o modelo de responsabilidade compartilhada da **AWS**, é possível focar precisamente na segurança de aplicativos, dados e sistemas operacionais. A **AWS** disponibiliza infraestrutura e serviços seguros, permitindo uma abordagem robusta à proteção.
- Automatizar as práticas recomendadas de segurança é essencial. Os mecanismos de segurança baseados em software aprimoram a capacidade de dimensionar com segurança, rapidez e eficiência. Por exemplo, é possível criar e armazenar automaticamente uma imagem fortalecida e corrigida de um servidor virtual, permitindo a criação instantânea de uma nova instância quando necessário. Além disso, automatizar a resposta a eventos de segurança habituais e anômalos é outra prática recomendada importante.

O pilar da confiabilidade concentra-se na capacidade de um sistema se recuperar de falhas de infraestrutura ou serviço, adquirir recursos de computação dinamicamente para atender à demanda e mitigar interrupções, como configurações incorretas e problemas de rede temporários. A confiabilidade é fundamental para a recuperação de falhas e o atendimento à demanda. Na nuvem, a confiabilidade é composta por três áreas principais: fundamentos, gerenciamento de alterações e gerenciamento de falhas. Uma avaliação cuidadosa de cada uma dessas áreas permite prever, responder e evitar falhas.
- Fudamentos: Na base da confiabilidade está a necessidade de uma arquitetura e sistema bem planejados, capazes de lidar com alterações na demanda e requisitos, além de detectar e corrigir falhas automaticamente. É crucial examinar cuidadosamente essa base antes de projetar qualquer tipo de estrutura ou sistema, garantindo a implementação adequada dos requisitos fundamentais que influenciam a confiabilidade.
- Gerenciamento de alterações: No gerenciamento de alterações, é crucial compreender plenamente como as mudanças podem impactar o sistema. Ao planejar de forma proativa e monitorar constantemente o sistema, torna-se possível acomodar e adaptar-se rapidamente e de forma confiável às mudanças.
- Gerenciamento de falhas: Para garantir a confiabilidade da arquitetura, é essencial antecipar, detectar e responder a falhas, além de implementar medidas para prevenir sua ocorrência. Na nuvem, a automação pode ser empregada para monitorar, substituir sistemas no ambiente e, em seguida, solucionar problemas em sistemas com falhas, tudo isso de forma econômica e mantendo uma alta confiabilidade.

Além disso, há vários princípios de design que podem aumentar a confiabilidade: Testar procedimentos de recuperação; Recuperar-se de falhas automaticamente; Dimensionar a escala horizontalmente para aumentar a disponibilidade agregada do sistema; Parar de tentar adivinhar a capacidade; Gerenciar alterações na automação.
- Testar procedimentos de recuperação é essencial na nuvem. Os usuários têm a capacidade de simular falhas nos sistemas e validar seus procedimentos de recuperação. Isso permite que identifiquem e resolvam possíveis problemas antes que impactem de fato suas operações.
- Recuperar-se de falhas automaticamente é uma característica-chave na nuvem da AWS. Os usuários podem configurar respostas automatizadas para serem acionadas quando os limites são ultrapassados, permitindo antecipar e corrigir falhas antes mesmo que elas aconteçam.
- Dimensionar a escala horizontalmente para aumentar a disponibilidade agregada do sistema é fundamental. Ao substituir um recurso grande por vários recursos menores, o impacto de um ponto único de falha no sistema geral é reduzido. O objetivo é distribuir os requisitos entre múltiplos recursos menores, escalando horizontalmente para garantir maior disponibilidade e resiliência.
- Parar de tentar adivinhar a capacidade no ambiente de nuvem. Monitorando constantemente a demanda e a utilização do sistema, é possível automatizar a adição ou remoção de recursos conforme necessário. Isso garante que o nível ideal para atender à demanda seja mantido, evitando tanto o excesso quanto a escassez de provisionamento.
- Gerenciar alterações de forma automatizada na arquitetura e infraestrutura. Ao adotar essa abordagem, o foco será apenas no gerenciamento das alterações na automação, sem a necessidade de lidar com todos os sistemas ou recursos individualmente.

O pilar de eficiência de desempenho envolve a utilização eficiente dos recursos de computação para atender aos requisitos do sistema. É crucial manter essa eficiência diante das mudanças na demanda e da evolução tecnológica. Alguns dos fatores que impactam a eficiência de desempenho na nuvem incluem: Selecionar; Revisar; Monitorar; Compensações.
- Selecionar a solução mais adequada é importante para otimizar a arquitetura. As opções variam de acordo com o tipo de carga de trabalho existente, e a **AWS** oferece recursos para personalizar as soluções de várias maneiras, com diferentes configurações.
- Após a implementação da arquitetura, é fundamental monitorar o desempenho para identificar e corrigir eventuais problemas antes que afetem os clientes. Utilizando ferramentas como **Amazon CloudWatch**, **Amazon Kinesis**, **Amazon Simple Queue Service (Amazon SQS)** e **AWS Lambda**, é possível automatizar a monitorização da arquitetura na **AWS**.
- Compensações são fundamentais para garantir uma abordagem otimizada. Um exemplo disso é o equilíbrio entre consistência, durabilidade e uso de espaço em troca de tempo ou latência, visando aprimorar o desempenho geral do sistema.

Adicionalmente, diversos princípios de design podem contribuir para alcançar eficiência de desempenho: democratizar o acesso a tecnologias avançadas; obter alcance global em minutos; adotar uma arquitetura sem servidor; realizar experimentações com maior frequência; e estabelecer afinidade mecânica.
- Comece por democratizar as tecnologias avançadas. Ao transferir o conhecimento e a complexidade para os provedores de nuvem, as tecnologias que são difíceis de implementar podem se tornar mais acessíveis e simples de utilizar. Em vez de exigir que a equipe de TI aprenda a hospedar e operar uma nova tecnologia, ela pode consumi-la como um serviço.
- Em segundo lugar, busque uma presença global em questão de minutos. Através da **AWS**, é possível implantar o sistema rapidamente em diversas regiões ao redor do mundo, proporcionando baixa latência e uma experiência aprimorada aos clientes, tudo isso com custo mínimo.
- Terceiro, opte por uma arquitetura sem servidor. A computação sem servidor é um modelo de execução de computação em nuvem no qual o provedor de nuvem gerencia dinamicamente a alocação de recursos de máquina. Os custos são baseados na quantidade real de recursos consumidos por um aplicativo, em vez de em unidades de capacidade compradas antecipadamente. Na nuvem, a computação sem servidor permite reduzir a necessidade de manter servidores tradicionais para tarefas de computação, eliminando a sobrecarga operacional e possivelmente reduzindo os custos transacionais.
- Quarto, experimente com maior frequência. Através da virtualização, é possível realizar testes de maneira rápida, o que contribui para aumentar a eficiência do processo.
- Por último, tenha afinidade mecânica. Esse princípio sugere que seja adotada uma abordagem tecnológica que melhor se alinhe aos objetivos.

A otimização de custos diz respeito à capacidade de evitar ou eliminar gastos e recursos desnecessários. As quatro áreas que compõem esse pilar visam utilizar recursos que ofereçam custo-benefício, equiparação da oferta com a demanda, maior conscientização sobre despesas e otimização ao longo do tempo.
- Um sistema completamente otimizado para custos aproveitará todos os recursos disponíveis para alcançar o melhor resultado pelo menor preço possível, mantendo-se alinhado com os requisitos funcionais. Assegurar que os sistemas estejam utilizando os produtos, recursos e configurações adequados é fundamental para reduzir os custos. Como usuário, é essencial focar em detalhes como provisionamento, dimensionamento, opções de compra e outros aspectos específicos para garantir a melhor arquitetura para as necessidades.
- Um outro aspecto importante da otimização de custos é alinhar a oferta com a demanda. Por meio da **AWS**, é possível aproveitar a elasticidade da arquitetura em nuvem para atender às demandas conforme elas variam. Isso significa que é viável escalar e ser alertado por outros serviços para ajustar a oferta conforme a demanda se altera.
- Depois, vem a conscientização sobre despesas. Estar plenamente ciente dos fatores que geram custos e gastos na empresa é essencial. Aprimorar a otimização de custos da arquitetura na nuvem é possível quando se consegue visualizar, compreender e detalhar os custos atuais, prever os custos futuros e planejar adequadamente.
- Por fim, na **AWS**, é possível otimizar ao longo do tempo. Com todas essas ferramentas e abordagens distintas, é viável medir, monitorar e aprimorar a arquitetura utilizando os dados coletados por meio da **AWS**.

Além disso, os seguintes princípios de design podem contribuir para a otimização dos custos: Adotar um modelo de consumo; Medir a eficiência geral; Reduzir os gastos com operações de data center; Analisar e atribuir despesas; Usar serviços gerenciados.
- Adotar um modelo de consumo implica pagar apenas pelos recursos de computação efetivamente utilizados. Isso permite ajustar os recursos conforme as necessidades empresariais variam, seja aumentando ou diminuindo a capacidade.
- Medir a eficiência geral é crucial para avaliar a produtividade dos sistemas e os custos associados à entrega. Essa análise permite identificar oportunidades para aumentar a produção e reduzir os custos, garantindo um melhor retorno sobre o investimento.
- Ao migrar para a AWS, a necessidade de lidar com tarefas operacionais pesadas em data centers, como montagem de racks e configuração de servidores, é eliminada. Com essa responsabilidade transferida para a AWS, os recursos podem ser direcionados para atender melhor os clientes e focar em iniciativas de negócios, sem se preocupar com a gestão da infraestrutura de TI.
- Analisar e atribuir despesas na nuvem simplifica a identificação precisa do uso e dos custos dos sistemas. Isso permite que os clientes meçam o retorno sobre o investimento, possibilitando a otimização de recursos e a redução de custos.
- Utilize serviços gerenciados para diminuir o custo de propriedade. A nuvem disponibiliza diversos serviços gerenciados para eliminar a sobrecarga operacional da manutenção de servidores, como envio de e-mails ou administração de bancos de dados. Como essas tarefas são realizadas em escala de nuvem, os provedores de serviços de nuvem podem oferecer um custo menor por transação ou serviço.

<a name="item5.4"><h4>5.4 Design do Well-Architected</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

O **AWS Well-Architected Framework** destaca um conjunto de princípios gerais de design para facilitar a criação de projetos de alta qualidade na nuvem. Alguns desses princípios incluem: parar de prever as necessidades de capacidade, testar sistemas em escala de produção, automatizar para facilitar experimentos de arquitetura, permitir que as arquiteturas evoluam, impulsionar arquiteturas orientadas por dados e aprimorar por meio de simulações.
- Parar de prever necessidades de capacidade: Em um ambiente tradicional, decidir sobre a capacidade antes de implantar um sistema pode levar à superestimativa (desperdício) ou à subestimativa (problemas de desempenho) dos recursos necessários. Na nuvem, não é necessário prever a necessidade de capacidade de infraestrutura. É possível começar com a capacidade mínima ou máxima necessária e ajustar verticalmente de maneira automática conforme as necessidades mudam. Para isso, é importante monitorar a demanda e o uso do sistema, além de automatizar a adição ou remoção de recursos para manter um nível ideal que atenda à demanda.
- Testar os sistemas em escala de produção: Em ambientes tradicionais fora da nuvem, criar um ambiente duplicado apenas para testes costuma ser proibitivamente caro, o que impede testes em níveis reais de demanda de produção. Na nuvem, é possível criar um ambiente duplicado sob demanda, realizar os testes e desativar os recursos. Como o pagamento é feito apenas pelo tempo de execução do ambiente de teste, é viável simular o ambiente de produção por uma fração do custo dos testes locais.
- Automatizar para facilitar experimentos de arquitetura: Os ambientes locais têm estruturas e componentes separados que exigem mais trabalho para automatizar quando não há uma interface de programação de aplicativo (API) comum para todas as partes da infraestrutura. A automação permite que seja criado e replicado os sistemas por um baixo custo e pouco esforço manual. É possível monitorar as alterações na automação, auditar o impacto e reverter para parâmetros anteriores quando necessário.
- Permitir que as arquiteturas evoluam: Em ambientes tradicionais, decisões de arquitetura são implementadas como eventos estáticos e únicos, resultando em poucas versões principais ao longo da vida útil do sistema. Decisões iniciais podem limitar a capacidade do sistema de atender a novos requisitos empresariais à medida que a empresa e seu contexto mudam. Na nuvem, a capacidade de automatizar e testar sob demanda reduz o risco de impactos negativos decorrentes de alterações no projeto. Isso permite que os sistemas evoluam continuamente, permitindo que as empresas incorporem inovações recentes como prática padrão.
- Impulsionar arquiteturas orientadas por dados: Em ambientes tradicionais, decisões arquitetônicas são frequentemente baseadas em padrões organizacionais, não em abordagens orientadas por dados, dificultando a geração de conjuntos de dados para decisões fundamentadas. Modelos e suposições são comumente usados para dimensionar a arquitetura. Na nuvem, é possível coletar dados sobre o impacto das opções arquitetônicas no comportamento das cargas de trabalho, permitindo decisões baseadas em fatos para melhorar a carga de trabalho. Com a infraestrutura de nuvem tratada como código, esses dados podem embasar escolhas e aprimoramentos arquitetônicos contínuos.
- Aprimorar por meio de simulações: Em ambientes tradicionais, o runbook é utilizado apenas quando ocorrem problemas na produção. Na nuvem, é possível testar a operação da arquitetura e dos processos programando testes aleatórios para simular eventos de produção. Esse processo ajuda a identificar onde são necessárias melhorias e a desenvolver a experiência organizacional na gestão de eventos.

Um runbook é um documento ou uma coleção de documentos que detalha os procedimentos e operações necessários para manter e solucionar problemas em sistemas de TI. Ele serve como um guia passo a passo para administradores e operadores de TI para realizar tarefas operacionais e resolver incidentes de maneira eficiente e consistente. Runbooks geralmente incluem instruções para: Monitoramento e Diagnóstico; Procedimentos de Manutenção; Soluções de Problemas Comuns; Respostas a Incidentes; Escalonamento.

<a name="item5.5"><h4>5.5 Confiabilidade e alta disponibilidade</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

A confiabilidade refere-se à probabilidade de que um sistema completo, incluindo hardware, firmware e software, opere de forma satisfatória por um determinado período. Ela representa a medida do tempo em que um item desempenha sua função prevista. Existem duas métricas comuns para avaliar a confiabilidade. A primeira é o tempo médio entre falhas (MTBF), calculado como o tempo total em serviço dividido pelo número de falhas. A segunda é a taxa de falhas, que representa o número de falhas dividido pelo tempo total em serviço. Confiabilidade e disponibilidade estão intrinsecamente ligadas. Enquanto a confiabilidade mede o tempo em que um recurso executa sua função pretendida, a disponibilidade representa a porcentagem de tempo em que os recursos permanecem operacionais.

Quando se trata dos serviços da **AWS**, é comum encontrar números como 99,99% ou 99,999% de disponibilidade. Esses valores representam a porcentagem do tempo em que um sistema ou aplicativo opera corretamente, realizando as operações esperadas. O termo "5 noves" é uma abreviação comum para 99,999% de disponibilidade. Para exemplificar melhor os cálculos das métricas de confiabilidade, tempo médio entre falhas (MTBF) e taxa de falhas, um cenário hipotético é utilizado. Neste cenário, um sistema de armazenamento de dados em nuvem é utilizado por uma empresa para armazenar e processar informações importantes. Este sistema está em operação por um ano e durante esse período, ocorreram 4 falhas que exigiram intervenção humana para restaurar o serviço. Logo, o tempo total em serviço seria de 1 ano que equivale a 365 dias e o número de falhas foram 4. Para calcular o MTBF, dividi-se o tempo total em serviço, 365 dias, pelo número de falhas nesse período, 4, resultando um MTBF de 91,25 dias/falha. Isso significa que, em média, o sistema opera por aproximadamente 91,25 dias antes de ocorrer uma falha. Já a taxa de falhas é calculada dividindo o número de falhas no período, 4, pelo tempo total de serviço, 365 dias, em seguida, multiplicado por 100% para encontrar a porcentagem. Logo, 4 dividido por 365, resulta em aproximadamente 0,011 que multiplicado por 100%, obtém uma taxa de falhas de 1,1%. Isso significa que, em média, o sistema experimenta uma taxa de falhas de aproximadamente 1,1% por dia.

A disponibilidade se refere ao tempo em que um sistema permanece em operação, indicado como 100% menos o tempo de inatividade do sistema. Alta disponibilidade (HA) significa minimizar o tempo de inatividade de um aplicativo sem a necessidade de intervenção humana. Isso não significa simplesmente replicar componentes físicos, mas sim compartilhar recursos em todo o sistema para garantir serviços essenciais. A HA combina software e hardware de padrão aberto para minimizar o tempo de inatividade, restaurando rapidamente os serviços essenciais quando um componente falha, geralmente em menos de um minuto. Embora eventos disruptivos sejam imprevisíveis, existem maneiras de aumentar a disponibilidade, contudo isso possa implicar custos mais elevados. Portanto, é essencial ponderar o custo da melhoria em relação ao benefício para os usuários ao considerar aprimorar a disponibilidade do ambiente.

Alta Disponibilidade é um conceito que abrange todo o sistema, visando assegurar que os sistemas estejam continuamente operacionais e acessíveis, com o mínimo de tempo de inatividade, sem depender de intervenção humana. Através da nuvem **AWS**, os usuários têm a capacidade de construir sistemas e arquiteturas altamente disponíveis e resilientes a falhas. Esses sistemas podem ser desenvolvidos com pouca intervenção humana e sem necessidade de grandes investimentos financeiros antecipados. Além disso, tudo pode ser personalizado de acordo com as necessidades específicas de cada usuário. A tolerância a falhas, a capacidade de recuperação e a escalabilidade são três fatores principais que determinam a disponibilidade geral de um aplicativo.

É comum confundir tolerância a falhas com alta disponibilidade. No entanto, a tolerância a falhas diz respeito à redundância integrada dos componentes de um aplicativo e à sua capacidade de continuar operando mesmo que alguns desses componentes falhem. Esse conceito depende de hardware especializado para detectar falhas e, instantaneamente, mudar para um componente redundante, seja um processador, placa de memória, fonte de alimentação, subsistema de E/S ou subsistema de armazenamento. Vale ressaltar que o modelo de tolerância a falhas não aborda falhas de software, que são, de longe, a causa mais comum de tempo de inatividade. A escalabilidade refere-se à capacidade da infraestrutura de um aplicativo de expandir rapidamente para atender à demanda por mais recursos, garantindo assim que o aplicativo permaneça disponível conforme os requisitos de desempenho estabelecidos. Embora não garanta disponibilidade por si só, a escalabilidade desempenha um papel crucial na manutenção da disponibilidade do aplicativo.

Com frequência, a capacidade de recuperação é subestimada como um elemento da disponibilidade. Se um desastre natural afetasse um ou mais componentes ou destruísse a fonte principal dos dados, seria possível restaurar o serviço de forma rápida e sem perda de dados? Esses critérios não funcionais geralmente determinam a arquitetura da infraestrutura. Embora um ambiente altamente disponível e resistente a falhas possa abranger várias Zonas de Disponibilidade e Regiões da **AWS**, esse design envolve custos que precisam ser equilibrados com os requisitos de disponibilidade.

Para compreender as distinções entre as soluções de disponibilidade em ambientes locais e na nuvem, uma comparação direta é útil. Normalmente, os custos associados à garantia de alta disponibilidade (HA) em data centers locais podem ser significativos. Geralmente, a HA é reservada apenas para aplicativos críticos para a operação. No entanto, na **AWS**, é possível ampliar a disponibilidade e a capacidade de recuperação entre os servidores selecionados. Isso pode ser alcançado por meio de: múltiplos servidores; data centers redundantes e isolados em cada Zona de Disponibilidade; a presença de várias Zonas de Disponibilidade dentro de cada Região; a expansão para várias Regiões em todo o mundo; e o uso de serviços projetados para serem tolerantes a falhas.

<a name="item5.6"><h4>5.6 Transição de um data center para a nuvem</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>









<a name="item5.7"><h4>5.7 AWS Identity and Access Management</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

O AWS Identity and Access Management (IAM) é um serviço essencial para o controle seguro do acesso aos recursos da **AWS**. Ele permite a gestão dos recursos que podem ser acessados e das ações que podem ser realizadas. As credenciais necessárias devem ser definidas conforme o contexto, respondendo a perguntas como: Quem tem permissão para acessar determinado serviço da **AWS**?; Que ações o usuário ou sistema está autorizado a realizar com o serviço? O IAM é utilizado para configurar a autenticação, a primeira etapa no controle de acesso aos recursos da **AWS**, e a autorização. A autorização controla quais recursos os usuários podem acessar e quais ações podem realizar com esses recursos. Além disso, o IAM pode ser utilizado, por exemplo, por aplicativos e outros serviços da **AWS**, como EC2, Lambda, S3 e RDS, para obter acesso a outros recursos de forma segura.

O IAM reduz a necessidade de compartilhar senhas ou chaves de acesso ao conceder direitos de acesso. Ele também facilita a ativação ou desativação do acesso de um usuário ao longo do tempo, conforme necessário. O IAM deve ser visto como uma ferramenta centralizada para gerenciar o acesso, que pode iniciar, configurar, gerenciar e remover recursos. Ele fornece controle granular sobre permissões de acesso, tanto para pessoas quanto para sistemas ou outros aplicativos que realizam chamadas programáticas para recursos da AWS. Uma entidade principal é uma pessoa ou aplicativo que pode fazer uma solicitação para uma ação ou operação em um recurso da **AWS**.

Ao criar usuários do IAM, é possível decidir quais métodos eles poderão usar para acessar os serviços da **AWS**. Pode-se conceder acesso programático, acesso ao Console de Gerenciamento da **AWS** ou ambos. Para fornecer acesso programático, é necessário criar um ID de chave de acesso e uma chave de acesso secreta, e fornecê-los ao usuário. Com essas credenciais, o usuário terá acesso às Interfaces de Programação de Aplicativos (APIs) da **AWS**, à Interface de Linha de Comando da **AWS** (**AWS CLI**) e aos Kits de Desenvolvimento de Software (SDKs) da **AWS**. Para fornecer acesso ao Console de Gerenciamento da **AWS**, atribua ao usuário um nome de usuário e uma senha. O Console de Gerenciamento da **AWS** oferece uma interface web para a **AWS**. Caso a conta de usuário do IAM tenha a Autenticação Multifator (MFA) ativada, o que é recomendado pela **AWS** para aumentar a segurança, o usuário será solicitado a fornecer um código de autenticação adicional após inserir o nome de usuário e a senha.

Cada conta da **AWS** possui um usuário raiz associado à conta principal do usuário. Este usuário raiz tem um endereço de e-mail atribuído para recuperação e comunicação da conta. No entanto, a **AWS** recomenda não utilizar o usuário raiz para tarefas diárias, inclusive administrativas. Em vez disso, as melhores práticas sugerem usar o usuário raiz apenas para criar um usuário do IAM inicialmente. Depois disso, é aconselhável armazenar as credenciais do usuário raiz de forma segura e utilizá-las somente para executar as poucas tarefas de gerenciamento de contas e serviços que não podem ser realizadas de outras maneiras.

As credenciais de segurança de nome de usuário e senha do IAM são utilizadas para acessar o Console de Gerenciamento da AWS, também conhecido como console. As chaves de acesso, quando geradas para um usuário, podem ser usadas para acesso programático. Para aumentar a segurança, a AWS recomenda a aplicação da Autenticação Multifator (MFA) tanto no usuário raiz da conta quanto em qualquer usuário do IAM definido.

Os quatro tipos de política, que definem as permissões atribuídas aos usuários, são listados aqui em ordem de popularidade.
- Baseada em identidade: As políticas baseadas em identidade permitem anexar políticas gerenciadas e em linha a identidades do IAM, como usuários ou grupos aos quais os usuários pertencem. Também é possível anexar essas políticas a funções.
- Baseadas em recursos: As políticas baseadas em recursos permitem anexar políticas em linha diretamente aos recursos. Exemplos comuns incluem as políticas de bucket do **Amazon Simple Storage Service (Amazon S3)** e as políticas de confiança de função do IAM. Essas políticas são documentos de política em formato **JavaScript Object Notation (JSON)**. 
- Controle de Serviço: As Políticas de Controle de Serviço (SCPs) do **AWS Organizations** impõem limites de permissões ao **AWS Organizations** ou a unidades organizacionais (UOs).
- ACLs: As Listas de Controle de Acesso (ACLs) também servem para controlar quais entidades, como usuários ou recursos, podem acessar um determinado recurso. Embora semelhantes às políticas baseadas em recurso, as ACLs diferem por não adotarem a estrutura de documento de política em JSON.

As permissões em nível de recurso estão disponíveis em alguns serviços e recursos selecionados da **AWS**, oferecendo um controle de acesso detalhado sobre objetos específicos dentro de um serviço da **AWS**. Por exemplo, uma política de permissões de função pode listar instâncias específicas do EC2 e volumes específicos do **Amazon Elastic Block Store (Amazon EBS)**. No entanto, as permissões no nível do recurso nem sempre concedem acesso a todas as ações. Para instâncias do EC2, ações como Reiniciar, Iniciar, Parar e Terminar podem ser especificadas, mas ações como Run Instances não podem ser, pois o ID da instância não é conhecido antes da execução da chamada Run Instances. Portanto, Run Instances se aplica ao Amazon EC2 como um serviço completo, não como um recurso específico.

As políticas seguem o seguinte raciocínio de avaliação: Verificar a autenticação do usuário principal; Analisar o contexto da solicitação (Ambiente; Recursos envolvidos; Ações solicitadas; Recursos em questão; Usuário principal); Examinar as políticas com base em (Tipo de política; Categoria da política); Decidir se a solicitação é permitida ou negada. A ordem em que as políticas são avaliadas não afeta o resultado final.

Uma função estabelece as permissões para recursos. Quando essa função é atribuída a um usuário, ele adquire as permissões definidas na função. As funções são projetadas para conceder permissões com base na identidade (ou baseadas em usuário). No entanto, é importante notar que também é possível criar permissões com base nos recursos. Esses tipos de permissões são vinculados a um recurso específico e determinam quem pode acessá-lo e quais ações podem ser realizadas sobre ele.

Existem três formas de utilizar uma função: de forma interativa na seção IAM do Console de Gerenciamento da **AWS**; de maneira programática com a **AWS CLI**; ou através dos **AWS SDKs** (usando chamadas de API). Um aplicativo ou serviço, como o **Amazon EC2**, pode assumir uma função solicitando credenciais de segurança temporárias para a função em questão, que podem ser utilizadas para fazer solicitações programáticas à **AWS**. As funções do IAM também suportam soluções de Logon Único (SSO). Por exemplo, um administrador do IAM pode configurar a federação Security Assertion Markup Language (SAML) 2.0, ao invés de criar usuários do IAM dentro de uma conta da **AWS**. Com um provedor de identidade, as identidades dos usuários podem ser gerenciadas fora da **AWS**. Estas identidades externas podem então receber permissões para acessar recursos dentro da conta da **AWS**.

A **AWS** destaca algumas práticas recomendadas em relação ao **AWS IAM**:
- Evite utilizar as credenciais do usuário raiz da conta para atividades administrativas diárias: Em vez disso, ao configurar uma nova conta da **AWS**, é recomendado criar pelo menos um novo usuário do IAM. Em seguida, conceda acesso a esse usuário para que ele possa realizar a maioria das atividades diárias utilizando as credenciais do usuário do IAM.
- Delegue funções administrativas seguindo o princípio do menor privilégio: Conceda acesso apenas aos serviços necessários e limite as permissões nesses serviços apenas ao mínimo necessário. Direitos adicionais podem ser concedidos conforme necessário ao longo do tempo.
- Utilize funções do IAM para fornecer acesso entre contas: As funções do IAM permitem que uma conta conceda acesso a outra conta de forma segura e controlada, facilitando a colaboração e o acesso a recursos entre diferentes partes da organização na AWS.
- Implemente a MFA para fornecer um nível adicional de segurança da conta: É uma prática recomendada implantar a MFA para reforçar a segurança da conta.

<a name="item5.8"><h4>5.8 AWS Command Line Interface</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

Os serviços da **AWS** podem ser acessados de três maneiras principais: através do Console de Gerenciamento da AWS (**AWS Console Management**), que oferece uma interface gráfica avançada; pela **AWS Command Line Interface (AWS CLI)**, um conjunto de utilitários executados via linha de comando em sistemas operacionais como **Linux**, **macOS** ou **Microsoft Windows**; e pelos Kits de Desenvolvimento de Software (SDKs), que permitem acesso aos serviços da **AWS** por meio de linguagens de programação como **Python**, **Ruby**, **.NET** ou **Java**. Os SDKs simplificam o uso da **AWS** em aplicativos existentes e permitem o desenvolvimento de sistemas complexos inteiramente por meio de código. Todas as três opções são criadas em uma interface de programação de aplicativos (API) comum, semelhante ao REST, que serve como base da **AWS**.

A **AWS CLI** e os SDKs proporcionam flexibilidade, permitindo que os usuários criem ferramentas específicas para seus negócios e personalizem os recursos da **AWS**. A **AWS CLI** oferece automação e repetição na implantação de recursos, independentemente de uma linguagem de programação específica, como por meio de scripts de shell do **Linux** ou arquivos em lote do **Windows**. Todos os três modos de acesso são intercambiáveis. Por exemplo, um servidor **Amazon EC2** criado com o SDK da **AWS** pode ser descrito usando a chamada de comando apropriada da **AWS CLI** (`aws ec2 describe-instances`). Essa instância do EC2 pode ser posteriormente encerrada no Console de Gerenciamento da **AWS**. Mudanças feitas através da **AWS CLI** ou da API podem levar alguns segundos ou minutos para serem refletidas no Console de Gerenciamento da AWS.

A **AWS CLI** está disponível para **Linux**, **Microsoft Windows** e **macOS**, sendo possível instalá-la também em instâncias EC2 dessas plataformas. No **Amazon Linux**, ela já vem instalada por padrão. Após a instalação, pode-se usar o comando `aws configure` para definir configurações padrão para todos os comandos da **AWS CLI**. Essas configurações incluem o ID da chave de acesso e a chave de acesso secreta associados à conta do IAM utilizada para acessar recursos da **AWS**, além da especificação de uma região padrão. O formato de saída padrão é **JSON**, ideal para tratamento programático de dados. O **JSON** é um padrão amplamente utilizado na Internet, sendo facilmente compreensível por humanos e processável por máquinas. A maioria das principais linguagens de programação e estruturas oferecem métodos para converter respostas **JSON** em objetos ou arrays associativos.

No entanto, a **AWS CLI** também suporta dois outros formatos de saída. A Tabela formatada em ASCII exibe os dados de forma tabular, facilitando a leitura humana. O comando correspondente é: `export AWS_DEFAULT_OUTPUT="table"`. Por outro lado, o Texto delimitado por tabulação apresenta os dados em linhas de texto separadas por tabulação, adequado para ferramentas de processamento de texto Unix, como scripts do **PowerShell**. O comando correspondente é: `output=text`.

A estrutura da linha de comando pode ser dividida em várias partes, cada uma especificando uma ação a ser executada. Primeiramente, utiliza-se o comando `aws` como base para a chamada de linha de comando da **AWS**. Em seguida, são especificadas as ações adicionais a serem realizadas. Isso inclui identificar o serviço de alto nível a ser acessado, como, por exemplo, o **Amazon EC2**, através do comando `ec2`. Posteriormente, define-se a operação a ser executada no serviço, como `stop-instances` ou `run-instances`. Em seguida, são especificados os parâmetros necessários para a operação. Por fim, são definidas as opções adicionais, como a opção `--output`, que permite especificar o formato da resposta, após chamar `aws ec2 stop-instances`.

Parâmetros são detalhes ou argumentos utilizados para realizar uma operação. Algumas operações exigem parâmetros obrigatórios, enquanto outras não têm essa exigência. Além disso, a maioria das operações disponibiliza parâmetros opcionais. Por exemplo, na operação `stop-instances`, é necessário fornecer o parâmetro `instance-id` para identificar as instâncias que devem ser interrompidas. Os parâmetros são identificados pelos nomes precedidos por dois traços (--). Por exemplo, ao executar a operação `run-instances` do **Amazon EC2**, diversos parâmetros necessários (e possivelmente alguns opcionais) são especificados. Entre os parâmetros obrigatórios está o ID da Amazon Machine Image (AMI) utilizado para criar a instância.

Todos os comandos na **AWS CLI** incluem exemplos de sintaxe e comandos que podem ser acessados usando o comando `help`. Os resultados dos comandos da **AWS CLI** são retornados em formato JSON, onde cada elemento da matriz pode desencadear outra matriz ou conter uma propriedade retornada como pares nome-valor entre aspas, separados por dois pontos. A opção `--query` pode ser usada na maioria dos comandos para limitar os resultados retornados, filtrando-os no lado do cliente. As consultas devem ser formatadas de acordo com a especificação JMESPath, que define uma sintaxe para pesquisar documentos JSON. As consultas são criadas designando a subseção da resposta desejada, especificando o caminho completo a partir do elemento mais alto da resposta. Elementos de array podem ser referenciados usando indexação baseada em zero. Por exemplo, para descrever apenas a primeira instância retornada pela operação `describe-instances` do **Amazon EC2**, use o caminho `Reservations[0].Instances[0]`, que indica "Para a primeira reserva, retorne os detalhes sobre a primeira instância". É possível visualizar apenas atributos específicos dessa instância, como seu estado operacional atual. Para visualizar informações de todos os elementos de uma matriz, curingas podem ser usados em vez de índices. A sintaxe `*` pode ser usada em qualquer array para especificar que deseja visualizar a propriedade especificada ou o elemento filho para todos os membros desse array. 

A opção `--filter`, diferentemente da opção `--query`, é usada para restringir o conjunto de resultados que é filtrado no lado do servidor. As opções de consulta (`--query`) e filtro (`--filter`) podem ser utilizadas juntas. Outra opção da CLI é a `--dry-run`, utilizada para fins de teste. Essa opção verifica se as permissões necessárias para a ação estão presentes sem realmente executar a solicitação. Normalmente, ela fornece uma resposta de erro: se as permissões necessárias estiverem presentes, a resposta de erro será `DryRunOperation`; se as permissões não estiverem presentes, o comando falharia sem a opção `--dry-run`, retornando a resposta de erro `UnauthorizedOperation`.

<a name="item5.9"><h4>5.9 AWS Systems Manager</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

O **AWS Systems Manager** é um serviço de gerenciamento que auxilia na coleta de inventário de software, aplicação de patches no sistema operacional, criação de imagens do sistema e configuração dos sistemas operacionais **Microsoft Windows** e **Linux**. Projetado com foco na automação, o Systems Manager permite configurar e gerenciar sistemas tanto no local quanto na **AWS**. Com ele, é possível selecionar as instâncias a serem gerenciadas e definir as tarefas de gerenciamento desejadas. O Systems Manager oferece diversos recursos e benefícios úteis para especialistas em operações de sistemas (SysOps). Alguns dos seus incluem: Automação, Documentos, Patch Manager, Parameter Store, Inventory, Maintenance Windows, State Manager e Run Command.

O recurso de automação no Systems Manager (*Systems Manager Automation*) permite definir tarefas comuns de TI como uma coleção de etapas em um documento do **AWS Systems Manager** (documento SSM). Esse recurso pode executar todas as etapas do documento em uma coleção inteira de recursos da **AWS**. Por exemplo, é possível definir uma automação para corrigir instâncias inacessíveis, criar imagens de máquina da Amazon (AMIs) douradas ou aplicar patches em instâncias. Automações personalizadas também podem ser criadas em **JavaScript Object Notation (JSON)**. O *Amazon CloudWatch Events* pode ser configurado para acionar automações do Systems Manager. Uma abordagem sugerida para desenvolver e testar uma automação do Systems Manager inclui:
- Criar um documento de automação, ou usar um modelo de automação existente, que inclua etapas e parâmetros sequenciais executados pelo Systems Manager.
- Executar a automação usando o Systems Manager, possibilitando ações como: iniciar uma instância, fazer um snapshot, marcar instâncias, excluir imagens antigas e encerrar uma instância.
- Monitorar o fluxo de trabalho de automação, por exemplo, utilizando o console de gerenciamento da **AWS**.
- Após a conclusão da automação, confirmar se os resultados esperados foram obtidos, como executar uma instância de teste a partir de uma AMI atualizada pela automação do Systems Manager para verificar se ela possui as características desejadas.

O *Run Command* do Systems Manager oferece uma maneira simples de executar comandos predefinidos em instâncias do EC2. Utilizar o *Run Command* reduz a sobrecarga de gerenciamento, permitindo gerenciar instâncias sem a necessidade de configurar hosts bastion ou gerenciar chaves e certificados Secure Shell (SSH). A integração com o **AWS Identity and Access Management (AWS IAM)** permite aplicar permissões granulares para controlar as ações que podem ser executadas nas instâncias. Todas as ações realizadas com o Systems Manager podem ser registradas pelo **AWS CloudTrail**, permitindo auditoria das alterações em todo o ambiente.

O recurso *Session Manager* no Systems Manager permite o gerenciamento de instâncias do EC2 por meio de um shell interativo baseado no navegador, disponível no Console de gerenciamento da **AWS**. O *Session Manager* oferece uma maneira segura e auditável de gerenciar instâncias sem a necessidade de abrir portas de entrada nos grupos de segurança, manter instâncias bastion em sub-redes do EC2 ou gerenciar chaves SSH (Secure Shell). Além disso, o *Session Manager* facilita a conformidade com políticas corporativas que exigem acesso controlado a instâncias, práticas rigorosas de segurança e logs auditáveis com detalhes de acesso às instâncias. Esses benefícios são proporcionados enquanto ainda se oferece acesso às instâncias do EC2 aos usuários finais.

Diversos desafios podem surgir na aplicação de patches em servidores e instâncias, como o tempo necessário para corrigir várias instâncias do EC2 ou máquinas locais, a natureza repetitiva da tarefa, os erros que podem causar tempo de inatividade e problemas de compatibilidade. Para automatizar a aplicação de patches em grandes grupos de instâncias do **Amazon Elastic Compute Cloud (Amazon EC2)** ou máquinas locais, utilize o Systems Manager *Patch Manager*. Para isso, crie uma linha de base de patch com regras para aprovação ou rejeição automática de patches, defina uma janela de manutenção, agrupe instâncias para aplicação de patches, aplique os patches durante a janela de manutenção e reinicie todas as instâncias no grupo de patches. Após o processo, analise os resultados e detalhes de conformidade dos patches.

O recurso *Maintenance Windows* do Systems Manager permite agendar tarefas regulares, como patches, para execução automática. É possível definir limites para execuções simultâneas de tarefas e taxas de erro permitidas. As etapas para implementar uma janela de manutenção incluem: criar uma janela de manutenção, atribuir destinos e definir tarefas a serem executadas nesses destinos. Os tipos de tarefas que podem ser executadas incluem comandos do *Run Command* do Systems Manager, fluxos de trabalho do *Systems Manager Automation*, fluxos de trabalho do *AWS Step Functions* e funções do **AWS Lambda**. Após a conclusão das tarefas, revise o status delas.

O *State Manager* do **AWS Systems Manager** é um serviço seguro e escalável de gerenciamento de configuração que automatiza a manutenção da infraestrutura, tanto híbrida quanto do EC2, mantendo-a em um estado definido. Ele permite instalar software ao criar instâncias do EC2, baixar e atualizar agentes, definir configurações de rede, ingressar em um domínio do **Windows**, aplicar patches e executar scripts em instâncias gerenciadas do **Linux** e do **Windows**. Primeiro, crie ou identifique um documento do **AWS Systems Manager (AWS SSM)** que define as ações a serem executadas nas instâncias gerenciadas. Esses documentos, em JSON ou YAML, incluem etapas e parâmetros especificados. Depois, associe as instâncias gerenciadas ao documento do SSM, definindo a frequência com que o estado configurado será aplicado. Por fim, é possível optar por gravar a saída dos comandos em um bucket do **Amazon S3** ao criar uma associação.

Em vez de armazenar dados confidenciais em arquivos de configuração ou codificá-los no código-fonte, é possível usar o *Parameter Store* do Systems Manager para guardar esses parâmetros. Esses dados podem ser referenciados em aplicativos ou scripts. O *Parameter Store* é ideal para armazenar informações de configuração, como senhas, chaves, códigos de licença e strings de banco de dados. Ele se integra ao IAM para controlar o acesso aos parâmetros e permite criptografar as informações armazenadas com o **AWS Key Management Service (AWS KMS)**. Atualmente, os documentos SSM não suportam referências a parâmetros de cadeia de caracteres seguros, portanto, para usar esses parâmetros com comandos como o Executar comando, é necessário recuperar o valor do parâmetro antes de passá-lo para o comando.

O recurso *Inventory* do Systems Manager coleta informações detalhadas sobre instâncias do EC2 e o software instalado nelas, incluindo dados de aplicativos, configurações de rede, funções do servidor, arquivos, atualizações, serviços do **Windows** e propriedades do sistema. Esse recurso proporciona uma visão abrangente das configurações do sistema e dos aplicativos em várias instâncias, sem necessidade de login individual em cada uma. Os dados coletados são úteis para gerenciamento de ativos de aplicativos, rastreamento de licenças, monitoramento da integridade dos arquivos, e descoberta de aplicativos não instalados por métodos tradicionais, entre outros.

O recurso *Insights* integrados do *AWS Systems Manager* agrega e exibe dados operacionais de cada grupo de recursos em um painel central. Esse painel elimina a necessidade de navegar por vários consoles de serviço da **AWS** para visualizar dados operacionais. É possível visualizar chamadas de API do CloudTrail, alterações na configuração de recursos do **AWS Config**, inventário de software e status de conformidade de patch por grupo de recursos. Além disso, os painéis do **Amazon CloudWatch**, notificações do Trusted Advisor e alertas do Personal Health Dashboard podem ser integrados ao painel do *Insights*.

<a name="item5.10"><h4>5.10 169- [JAWS] -Laboratório: Usar o AWS Systems Manager</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

Neste laboratório, quatro tarefas foram realizadas, onde em cada uma foi explorado um dos seguintes recursos do **AWS System Manager (AWS SSM)**: *Inventory*, *Run Command*, *Parameter Store* e *Session Manager*. Na primeira tarefa











<a name="item5.11"><h4>5.11 Ferramentas de administração e desenvolvimento</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

O **AWS Tools for PowerShell** permite criar scripts para operações nos recursos da **AWS** por meio da linha de comando do **PowerShell**. Com essas ferramentas, é possível realizar muitas das mesmas ações disponíveis no **AWS SDK for .NET**. Através da linha de comando do **PowerShell**, é possível realizar tarefas rápidas como criar e configurar grupos de segurança, iniciar instâncias, criar e excluir buckets do **Amazon S3**, e executar tarefas do IAM, como atribuir uma função a um usuário. O **AWS Tools for PowerShell** fornece um conjunto de cmdlets, comandos usados no ambiente do **Microsoft Windows PowerShell** para executar ações, e oferece suporte ao mesmo conjunto de serviços e regiões compatíveis com os SDKs da **AWS**. Neste curso foi apresentado alguns comandos básicos para interagir com alguns dos principais serviços da **AWS**.

O conceito de infraestrutura como código (IaC) é essencial para a computação em nuvem e distingue a nuvem dos ambientes de TI tradicionais. Os SDKs e APIs da **AWS** oferecem ferramentas para gerenciar recursos na **AWS** com uma abordagem IaC. A **AWS** fornece SDKs específicos para várias linguagens de programação (**Python**, **Java**, **JavaScript**, **Golang**, **Ruby**, **.NET**, **PHP**, **Node.js**, **C++**), contendo APIs para essas linguagens. Isso permite que desenvolvedores integrem a conectividade e funcionalidade dos diversos serviços da **AWS** em seus códigos sem precisar escrever funções do zero. Os **AWS SDKs** vêm com ampla documentação, incluindo guias de início, guias do desenvolvedor, referências de API e fóruns da comunidade ou blogs de desenvolvedores.

O **AWS CloudFormation** é uma ferramenta útil que permite criar, atualizar ou excluir implantações completas de infraestrutura da **AWS** de maneira previsível e repetida. Com o **AWS CloudFormation**, toda a infraestrutura pode ser modelada em um único arquivo de texto escrito em **JSON** ou **YAML**. Esse modelo define todos os recursos da **AWS** necessários para uma pilha, que é um conjunto de recursos gerenciado como uma unidade única. Recursos na pilha podem incluir instâncias do EC2, **Amazon RDS**, VPCs, entre outros serviços da **AWS**. O **AWS CloudFormation** permite visualizar como as alterações propostas afetarão os recursos existentes antes de aplicá-las, garantindo que apenas mudanças aprovadas sejam executadas.

Outro recurso do **AWS CloudFormation** é a detecção de desvios. Ao executar uma operação de detecção de desvio em uma pilha, é possível determinar se a configuração real da pilha se desviou da configuração esperada definida no modelo. Um recurso é considerado desviado se algum de seus valores de propriedade reais for diferente dos esperados ou se a propriedade ou recurso tiver sido excluído. Uma pilha é considerada desviada se um ou mais de seus recursos tiverem se desviado. Se o recurso na pilha for compatível com a detecção de desvios, a operação fornecerá informações detalhadas sobre o status do desvio desse recurso. O **AWS CloudFormation** também suporta extensões personalizadas para modelos de pilha que podem ser criadas utilizando o **AWS Lambda**. É possível desenvolver provisionamento personalizado em uma função do Lambda e configurar uma pilha do **AWS CloudFormation** para acionar essa função ao ser criada. Por exemplo, pode-se escrever uma lógica de provisionamento personalizada para tarefas como buscar os IDs mais recentes da imagem de máquina da Amazon (AMI) para utilização nas pilhas.

O **AWS OpsWorks** é um serviço de gerenciamento de configuração que oferece instâncias gerenciadas do **Chef** e do **Puppet**. Essas plataformas de automação permitem usar código para automatizar as configurações de servidores. Com o **AWS OpsWorks**, **Chef** e **Puppet** podem ser utilizados para automatizar a configuração, implantação e gerenciamento de servidores nas instâncias do EC2 ou em ambientes locais. O **AWS OpsWorks** inclui três opções: *AWS OpsWorks for Chef Automate*, *AWS OpsWorks for Puppet Enterprise* e *AWS OpsWorks Stacks*.

<a name="item5.12"><h4>5.12 Hospedar um site estático no S3 da AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>











<a name="item5.13"><h4>5.13 170-[JAWS]-Visão geral da atividade do café: crie um site no S3</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.14"><h4>5.14 Visão geral da computação (servidores)</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.15"><h4>5.15 Computação na AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.16"><h4>5.16 Gerenciar instâncias da AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.17"><h4>5.17 Visão geral do laboratório: Instâncias do EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.18"><h4>5.18 171- [JAWS] -Lab - Criando instâncias do Amazon EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.19"><h4>5.19 Demonstração do AWS IAM-2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>



<a name="item5.20"><h4>5.20 172- [JAWS] -Laboratório: [Desafio] Exercício de instância do EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

<a name="item5.22"><h4>5.22 AWS Elastic Beanstalk</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.23"><h4>5.23 173- [JAWS] -Atividade: Solucionar problemas para criar uma instância</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.24"><h4>5.24 Visão geral de escalabilidade e resolução de nomes</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.25"><h4>5.25 Elastic Load Balancing</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.26"><h4>5.26 Listeners do Elastic Load Balancer</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.27"><h4>5.27 Auto Scaling do Amazon EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.28"><h4>5.28 Visão geral do laboratório: Auto Scaling do EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.29"><h4>5.29 174- [JAWS] -Laboratório: Dimensionar e balancear a carga da arquitetura</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.30"><h4>5.30 175-[JAWS]-Laboratório: Usar o Auto Scaling na AWS (Linux)</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.31"><h4>5.31 Desafio de previsão de Auto Scaling</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.32"><h4>5.32 Amazon Route 53</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.33"><h4>5.33 Demonstração do Amazon Route 53-2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.34"><h4>5.34 Amazon CloudFront</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.35"><h4>5.35 176-[JAWS]-Atividade: Roteamento de failover do Route 53</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

<a name="item5.37"><h4>5.37 AWS Lambda</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.38"><h4>5.38 178- [JAWS] -Atividade: Trabalhar com o AWS Lambda</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.39"><h4>5.39 APIs e REST da Amazon</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.40"><h4>5.40 Amazon API Gateway</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.41"><h4>5.41 Contêineres na AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.43"><h4>5.43 Funções do AWS Step</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.44"><h4>5.44 Visão geral dos bancos de dados</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.45"><h4>5.45 Amazon Redshift</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.46"><h4>5.46 Amazon Aurora</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.47"><h4>5.47 Migração de banco de dados da Amazon</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.48"><h4>5.48 179- [JAWS] -Atividade: Migrar para o Amazon RDS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.50"><h4>5.50 Visão geral das redes da AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.51"><h4>5.51 Amazon VPC</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.52"><h4>5.52 Opções de conectividade da Amazon VPC</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.53"><h4>5.53 Segurança e solução de problemas da rede</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.54"><h4>5.54 Visão geral do laboratório: Configurar uma Amazon VPC</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.55"><h4>5.55 180- [JAWS] -Laboratório: Configurar uma Amazon VPC</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.56"><h4>5.56 181- [JAWS] -Atividade: Solucionar problemas de uma VPC</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>

<a name="item5.58"><h4>5.58 Visão geral do Cloud Storage</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.59"><h4>5.59 Amazon EBS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.60"><h4>5.60 Demonstração do Amazon EBS-2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.61"><h4>5.61 182- [JAWS] -Laboratório: Trabalhar com o Amazon EBS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.62"><h4>5.62 O armazenamento de instâncias do EC2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.63"><h4>5.63 Elastic File System</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.64"><h4>5.64 Demonstração do Elastic File System-2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.65"><h4>5.65 Amazon Glacier</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.66"><h4>5.66 Demonstração do S3 Glacier-2</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.67"><h4>5.67 Amazon S3 e a CLI da AWS</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.68"><h4>5.68 183- [JAWS] -Laboratório: Gerenciar o armazenamento</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.69"><h4>5.69 Amazon Storage Gateway</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.70"><h4>5.70 184- [JAWS] -Laboratório: [Desafio] Exercício de S3</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>
<a name="item5.71"><h4>5.71 185- [JAWS] -Atividade: Trabalhar com o Amazon S3</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>


<a name="item5.73"><h4>5.73 Esperamos que seu Jumpstart na AWS esteja indo bem!</h4></a>[Back to summary](#item5) | <a href="">Certificate</a>













<div align="Center"><figure>
    <img src="../0-aux/md5-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>


