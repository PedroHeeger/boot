# Formação Blockchain Specialist - Module 1   <img src="../0-aux/logo_boot.png" alt="boot_025" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">blockchain   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/content/blockchain.jpg" alt="blockchain" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_025 (Formação Blockchain Specialist)   <img src="./0-aux/logo_boot.png" alt="boot_025" width="auto" height="25"></a>
### Module: 1. Fundamentos da Blockchain 

---

This folder refers to Module 1 **Fundamentos da Blockchain** from bootcamp [**Formação Blockchain Specialist**](../).

### Theme:
- Blockchain

### Used Tools:
- Operating System (OS): 
  - Linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25">
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud:
  - AWS   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="auto" height="25">
- Cloud Services:
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

### Bootcamp Module 1 Structure
1. <a name="item1">Fundamentos da Blockchain</a><br>
  1.1. <a href="#item1.1">Introdução à Blockchain</a><br>
  1.2. <a href="#item1.2">Desafio de Projeto: Criando e Utilizando a Sua Carteira de Criptomoedas</a><br>
  1.3. <a href="#item1.3">Operações da Blockchain</a><br>
  1.4. <a href="#item1.4">Desafio de código: Desafios intermediários Javascript I - Formação Blockchain</a><br>
  1.5. Materiais Complementares - Fundamentos da Blockchain<br>

---

### Objective:
O objetivo deste módulo do bootcamp foi introduzir conceitos fundamentais para melhor compreensão da Inteligência Articial. Conceitos como IA Geral, IA Restrita, Machine Learning (Aprendizado Profundo), Deep Learning, Redes Neurais, IAs Generativas, Processamento de Linguagem Natural, foram abordados. Também foi detalhado minuciosamente como são divididas as redes neurais e que a partir delas surgem as IAs Generativas.

### Structure:
A estrutura das pastas obedeceu a estruturação do bootcamp, ou seja, conforme foi necessário, sub-pastas foram criadas para os cursos específicos deste módulo. Na imagem 01 é exibido a estruturação das pastas. 

<div align="Center"><figure>
    <img src="../0-aux/md1-img01.png" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

### Development:
O desenvolvimento deste módulo do bootcamp foi dividido em três cursos e uma . Abaixo é explicado o que foi desenvolvido em cada uma dessas atividades.

<a name="item1.1"><h4>1.1 Introdução à Blockchain</h4></a>[Back to summary](#item1) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-09)_AWS_Official_Content-Introducao...AWS_PH_DIO.pdf">Certificate</a>


A blockchain pode ser vista como um registro público de transações, projetado para assegurar que as informações armazenadas permaneçam imutáveis e confiáveis. Este sistema armazena dados como a transferência de criptomoedas entre diferentes carteiras ou o registro de informações em contratos inteligentes. Embora a ideia de blockchain tenha ganhado destaque recentemente, seu conceito remonta a 1991, quando os cientistas Stuart Haber e W. Scott Stornetta propuseram um método de autenticação de documentos digitais que seria à prova de fraudes. Mais tarde, o criptógrafo Hal Finney introduziu o conceito de Proof of Work (PoW) para validar os novos blocos que são adicionados à blockchain.

A blockchain é mantida por uma rede ponto a ponto (Peer-to-Peer), onde cada nó da rede possui uma cópia completa dos dados. Cada bloco na blockchain é identificado por um código exclusivo, conhecido como hash, e contém também o hash do bloco anterior, o que forma uma cadeia de blocos conectados em sequência. Os blocos são elementos essenciais da blockchain, pois armazenam todas as informações registradas ao longo do tempo. Cada bloco possui uma estrutura específica que inclui detalhes de identificação e os dados das transações. A composição de um bloco inclui as seguintes partes:
- Index: o número sequencial do bloco;
- Timestamp: o registro de data e hora em que o bloco foi criado;
- PreviousHash: o hash do bloco anterior;
- Hash: a assinatura digital do bloco gerada com base em seu conteúdo;
- Data: os dados contidos no bloco, como as transações (payload).

A blockchain se destaca por algumas características fundamentais que tornam essa tecnologia revolucionária. Uma delas é a descentralização: em vez de depender de uma autoridade central para validar os dados, a rede opera de maneira distribuída, onde cada nó possui a capacidade de verificar e registrar transações. Isso elimina a necessidade de um intermediário e promove uma maior transparência. Outro aspecto crucial é a imutabilidade dos dados. Cada nó da rede possui uma cópia completa das informações, o que cria uma redundância natural e dificulta a alteração de qualquer dado já registrado. Uma vez que uma transação é gravada em um bloco, ela se torna permanente e não pode ser modificada sem o consenso da rede.

A segurança é um pilar essencial da blockchain, garantida pelo uso de criptografia avançada. Essa criptografia protege as informações e assegura que apenas os participantes autorizados possam acessar e verificar os dados. Além disso, a blockchain é baseada em registros distribuídos, o que significa que a rede é composta por inúmeros nós que colaboram para compartilhar o poder computacional necessário para a manutenção do sistema. Essa distribuição contribui para a resiliência e robustez da rede, tornando-a menos vulnerável a ataques ou falhas. Por fim, o processo de consenso é fundamental para a validação das transações na blockchain. Esse processo é realizado através de algoritmos de consenso que comparam os dados entre os diferentes nós da rede. Apenas quando há um acordo entre a maioria dos nós, um novo bloco é adicionado à cadeia, garantindo a integridade e a confiança nos registros armazenados.

O Bitcoin marcou a primeira adoção global de uma criptomoeda baseada em blockchain. Criado por uma entidade sob o pseudônimo Satoshi Nakamoto, que pode ser uma pessoa, uma empresa ou até mesmo um grupo de desenvolvedores, o Bitcoin se destaca por suas características únicas:
- Descentralização: Ao contrário dos sistemas financeiros tradicionais, que são controlados por autoridades e governos, o Bitcoin opera de forma completamente descentralizada. Nos sistemas centralizados, as regras são impostas por essas entidades, o que pode levar à manipulação de acordo com interesses específicos, comprometendo a transparência e criando vulnerabilidades devido à falta de redundância. O Bitcoin, por outro lado, é descentralizado em todos os aspectos, incluindo o desenvolvimento de atualizações, que são decididas por consenso entre os desenvolvedores. Sua arquitetura é sustentada por nós descentralizados e distribuídos, que mantêm cópias idênticas dos registros de transações, validadas por algoritmos de consenso.
- Distribuição: A rede Bitcoin é distribuída, o que significa que a responsabilidade pelo processamento e validação das transações não recai sobre um único ponto, mas é compartilhada por vários nós na rede, aumentando a resiliência e a segurança do sistema.
- Anonimato: O Bitcoin permite que os usuários realizem transações sem a necessidade de vincular uma identidade pessoal a uma carteira digital, preservando a privacidade dos envolvidos.
- Transparência: Apesar de garantir o anonimato, o Bitcoin também oferece um alto nível de transparência. Todas as transações registradas na blockchain do Bitcoin são públicas, permitindo que qualquer pessoa as verifique, geralmente através de exploradores de blocos.
- Imutabilidade: Uma vez registrada, uma transação no Bitcoin não pode ser alterada ou revertida. Isso é assegurado pela replicação dos registros em todos os nós da rede Bitcoin, garantindo a integridade e permanência das informações.

Aqui estão alguns fatos interessantes sobre o Bitcoin:
- Em 2010, 1 BTC valia apenas uma fração de centavo de dólar. Em 2011, seu valor ultrapassou 1 USD; no final de 2017, atingiu quase 20.000 USD, e em novembro de 2021, chegou ao pico de 68.000 USD.
- A primeira transação de compra usando Bitcoin ocorreu em 22 de maio de 2010, quando duas pizzas, avaliadas em US$ 45,00, foram adquiridas por 10.000 bitcoins.
- O Bitcoin tem um fornecimento máximo (supply) limitado a 21 milhões de unidades.
- A taxa de mineração, ou emissão de novos bitcoins, é constante, mas diminui periodicamente, o que garante uma inflação controlada.
- O último bitcoin está previsto para ser minerado no ano de 2140.

O Bitcoin representou uma ruptura nos sistemas de pagamento tradicionais, ao introduzir uma alternativa descentralizada, transparente, segura e confiável para a realização de transações financeiras. No entanto, ele ainda enfrenta alguns desafios, como questões de regulamentação, o risco de perda de chaves privadas e a alta volatilidade de seu preço.

Criptografia refere-se ao processo de transformar dados de um formato legível para um formato codificado, de forma que apenas quem possui a chave correta possa acessar a informação original. Dados criptografados só podem ser lidos ou processados após serem descriptografados. A eficácia de um sistema de criptografia aumenta com sua complexidade, tornando-o mais resistente a ataques de força bruta. As duas principais técnicas de criptografia são a criptografia de chave simétrica e a criptografia de chave assimétrica.

Na criptografia de chave simétrica, também chamada de criptografia de chave privada, a mesma chave é usada tanto para codificar quanto para decodificar as informações. Esse método é ideal para usuários individuais e sistemas fechados. No entanto, a chave privada precisa ser compartilhada com o destinatário, o que pode aumentar o risco de comprometimento caso seja interceptada por terceiros. Em comparação, a criptografia de chave simétrica é geralmente mais rápida do que a criptografia assimétrica. Por outro lado, na criptografia de chave assimétrica, são utilizadas duas chaves distintas, uma pública e uma privada, que estão matematicamente relacionadas. Embora ambas as chaves sejam grandes números emparelhados, elas não são idênticas, o que explica o termo "assimétrica". A chave privada é mantida em segredo pelo usuário, enquanto a chave pública é divulgada ao público. Este método é amplamente utilizado para a geração de carteiras no Bitcoin.

No Bitcoin e em outras criptomoedas, as carteiras funcionam como uma coleção de chaves privadas, que são essenciais para realizar transações. A criação dessas carteiras envolve o uso de algoritmos de dispersão criptográfica, ou funções hash criptográficas. Esses algoritmos são projetados para serem praticamente impossíveis de reverter, o que significa que é extremamente difícil reconstruir o valor original de entrada apenas a partir do valor hash gerado.

O algoritmo SHA-256 é um método criptográfico desenvolvido pela Agência de Segurança Nacional dos Estados Unidos (NSA) em colaboração com o Instituto Nacional de Padrões e Tecnologia (NIST). O acrônimo SHA-256 significa "Secure Hash Algorithm 256-bit". Este algoritmo é fundamental para o sistema de prova de trabalho do Bitcoin, gerando hashes ou códigos únicos que ajudam a proteger documentos e dados contra modificações por agentes externos. No contexto do Bitcoin, o SHA-256 é utilizado tanto no processo de mineração, que envolve a criação de novos bitcoins, quanto na geração de endereços de bitcoin, devido ao seu elevado nível de segurança. A função SHA-256 transforma uma entrada de tamanho variável em uma saída de tamanho fixo de 256 bits. Para que um bloco seja considerado válido, ele deve atender aos seguintes critérios:
- Versão: número da versão do software Bitcoin utilizado;
- Hash do bloco anterior: referência ao hash do bloco que precede o bloco atual;
- Raiz de Merkle: um hash que representa todas as transações incluídas no bloco;
- Registro de data e hora: o momento em que o bloco foi gerado;
- Target: o alvo definido pelo algoritmo de prova de trabalho para o bloco;
- Nonce: a variável que é ajustada durante o processo de prova de trabalho para encontrar um hash que atenda aos critérios estabelecidos.

Uma carteira, ou wallet, funciona como uma conta bancária para Bitcoin, onde o endereço público é usado para receber fundos e a chave privada é utilizada para fazer retiradas. No universo das criptomoedas, as carteiras também se referem às estruturas de dados que gerenciam as chaves do usuário. Existem vários tipos de carteiras para Bitcoin:
- Carteiras Não-determinísticas: São a forma inicial de carteiras, onde são geradas 100 chaves privadas na inicialização. Esse método, embora funcional, não oferece um gerenciamento muito prático devido ao grande número de chaves.
- Carteiras Determinísticas: Estas carteiras derivam as chaves privadas de uma única semente (seed), permitindo a geração de múltiplos endereços a partir dessa semente. Elas são mais eficientes e organizadas em comparação com as carteiras não-determinísticas.
- Carteiras HD (Hierarchical Deterministic): Semelhantes às carteiras determinísticas, mas com uma estrutura hierárquica. Elas geram chaves em uma árvore hierárquica a partir de uma semente inicial, facilitando a organização e o gerenciamento das chaves.
- Carteiras Mnemonic (BIP 39): Utilizam uma sequência de palavras em inglês, fáceis de lembrar e escrever, para gerar e armazenar as chaves. Um exemplo de frase mnemônica é: "army van defense carry jealous true", ou "garbage claim echo media make crunch". Essa abordagem simplifica a importação e recuperação das chaves.

Um endereço de criptomoeda funciona como um "número de conta bancária" para receber fundos. É possível criar um número ilimitado de endereços, proporcionando flexibilidade para o gerenciamento de transações. No Bitcoin Core, existem três tipos principais de endereços:
- P2PKH (Pay-to-Pubkey Hash): Este é o formato de endereço mais antigo e amplamente utilizado, também conhecido como "legacy". Todos os endereços P2PKH começam com o número 1 e têm taxas de transferência mais altas devido à falta de compatibilidade com os formatos mais recentes. Exemplo: `1PvPOdEYstMbpqTRn8Au3m3HEg7xJbECS3`.
- P2SH (Pay-to-Script Hash): Este formato foi desenvolvido para oferecer maior compatibilidade e funcionalidades avançadas em comparação com o P2PKH. É comumente utilizado em carteiras multisig, onde são necessárias múltiplas assinaturas para autorizar uma transação. Endereços P2SH começam com o número 3. Exemplo: `3G45p1GpEZ75NNmQvaicnyyiWrnqDhDMJi`.
- BECH32 (Segwit Nativo): O formato BECH32, associado ao Segregated Witness (Segwit), oferece redução nos custos de transação e aumento na capacidade dos blocos. Além disso, é compatível com o Lightning Network, que facilita transações rápidas e de baixo custo.

Existem várias maneiras de gerenciar carteiras de criptomoedas, incluindo:
- Hardware Wallets: Dispositivos físicos que armazenam chaves privadas de forma segura e offline, oferecendo proteção contra ataques digitais.
- Paper Wallets: Documentos físicos onde as chaves privadas e públicas são impressas, permitindo o armazenamento seguro offline, embora sejam suscetíveis a danos físicos e perda.
- Desktop Wallets: Aplicações instaladas em computadores que permitem gerenciar e armazenar criptomoedas localmente. Oferecem um equilíbrio entre segurança e conveniência, mas podem ser vulneráveis a malware.
- Mobile Wallets: Aplicativos para smartphones que permitem a gestão e o acesso às criptomoedas de forma prática e portátil, com a desvantagem de estarem mais expostos a riscos de segurança relacionados a dispositivos móveis.




<a name="item1.2"><h4>1.2 Desafio de Projeto: Criando e Utilizando a Sua Carteira de Criptomoedas</h4></a>[Back to summary](#item1) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-09)_AWS_Official_Content-Introducao...AWS_PH_DIO.pdf">Certificate</a>












<a name="item1.3"><h4>1.3 Operações da Blockchain</h4></a>[Back to summary](#item1) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Introducao...Conceito...Cloud_PH_DIO.pdf">Certificate</a>















<a name="item1.4"><h4>1.4 Desafio de código: Desafios intermediários Javascript I - Formação Blockchain</h4></a>[Back to summary](#item1) | <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/cloud/aws/(23-09-11)_Infraestrutura_Global_AWS_PH_DIO.pdf">Certificate</a>










<div align="Center"><figure>
    <img src="../0-aux/md1-img02.png" alt="img02"><br>
    <figcaption>Imagem 02.</figcaption>
</figure></div><br>








