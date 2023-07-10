# Linux do Zero   <img src="./0-img/logo_boot.png" alt="boot_03" width="auto" height="45">

#### Repositório: [course](../../../)   
#### Plataforma: <a href="../../">dio   <img src="../../../0-outros/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
#### Software/Assunto: <a href="../">linux   <img src="../../../0-outros/logos/software/linux.png" alt="linux" width="auto" height="25"></a>
#### Bootcamp: <a href="./">boot_03 (Linux do Zero)   <img src="./0-img/logo_boot.png" alt="boot_03" width="auto" height="25"></a>

---

#### Tema:
- Sistemas Operacionais

#### Ferramentas Utilizadas:
- Sistema Operacional: 
  - Linux   <img src="../../../0-outros/logos/software/linux.png" alt="linux" width="auto" height="25">
- Ambiente de Desenvolvimento (IDE):
  - VS Code   <img src="../../../0-outros/logos/software/vscode.png" alt="vscode" width="auto" height="25">
- Versionamento: 
  - Git   <img src="../../../0-outros/logos/software/git.png" alt="git" width="auto" height="25">
- Repositório:
  - GitHub   <img src="../../../0-outros/logos/software/github.png" alt="github" width="auto" height="25">
- Bibliotecas: 
  - Gdown   <img src="../../../0-outros/logos/software/google_drive.png" alt="gdown" width="auto" height="25">
  - Matplotlib   <img src="../../../0-outros/logos/software/matplotlib.png" alt="matplotlib" width="auto" height="25">
  - Pandas   <img src="../../../0-outros/logos/software/pandas.png" alt="pandas" width="auto" height="25">
  - Openai   <img src="../../../0-outros/logos/software/openai.png" alt="openai" width="auto" height="25">
- Outros:
  - Google Drive <img src="../../../0-outros/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
  - Excel <img src="../../../0-outros/logos/software/microsoft_excel.png" alt="microsoft_excel" width="auto" height="25">
  - ChatGPT <img src="../../../0-outros/logos/software/chatgpt.png" alt="chat_gpt" width="auto" height="25">

---

#### Objetivo:
- O objetivo desse projeto prático é analisar a satisfação dos feedbacks dos talentos da DIO em relação a um Bootcamp qualquer (cujo os dados foram gerados hipoteticamente apenas para fins didáticos). Essa análise é feita através do o cálculo do Net Promoter Score (NPS), uma métrica utilizada para medir a experiência do cliente e prever o crescimento dos negócios, para notas dada para esse Bootcamp. Sendo utilizado também as técnicas de Natural Language Processing (NLP) para analisar os sentimentos expressos nos comentários associados às notas.

#### Estrutura:
- A estrutura é composta por apenas um arquivo de script em Jupyter Notebook (**curso_066.ipynb**), utilizado para executar os códigos; um arquivo de Excel em CSV (**feedbacks.csv**), que é a base de dados; este arquivo de README e uma pasta contendo algumas imagens auxilares utilizadas nesse arquivo de README. A estrutura é exibida na imagem 01.

<div align="Center"><figure>
    <img src=".//img/img01.PNG" alt="img01"><br>
    <figcaption>Imagem 01.</figcaption>
</figure></div><br>

#### Desenvolvimento:
Este projeto foi realizado em três aulas. 

  - ##### Aula 01:
    Na aula 1, foi criado um arquivo de Excel no formato CSV com apenas uma planilha contendo duas colunas para ser nossa base de dados e salvamos no **Google Drive**. A primeira coluna referente a **nota**, com as notas que, hipoteticamente, os alunos deram para um Bootcamp qualquer da DIO, e a segunda coluna nomeada de **comentario** com os comentários que os alunos deram para esse mesmo Bootcamp.

    Utilizei a linguagem de programação **Python** no nosso ambiente de desenvolvimento **Google Colab** para escrever nosso arquivo de script em Jupyter Notebook. Iniciei o código utilizando a biblioteca **gdown** para baixar a base de dados para a pasta **/content** do sistema de arquivos no **Google Colab**. Através da biblioteca Pandas foi realizado a leitura do arquivo em CSV para um Dataframe e o output é mostrado na imagem 02.

    <div align="Center"><figure>
      <img src=".//img/img02.PNG" alt="img02"><br>
      <figcaption>Imagem 02.</figcaption>
    </figure></div><br>

    A partir da criação do Dataframe realizei o cálculo do **Net Promoter Score (NPS)**. O NPS é uma métrica utilizada para medir a experiência do cliente e prever o crescimento dos negócios. Ela fornece uma escala de 0 a 10 para determinar quem são os clientes Detratores (pontuação de 0 a 6), os Passivos (pontuação de 7 a 8), e os Promotores (pontuação de 9 a 10). A determinação é feita contando a quantidade de clientes Detratores e Promotores e calculando quanto porcento eles representam da quantidade total de notas, descartando os clientes Passivos. Feito a determinação, a métrica utiliza a fórmula **NPS = % Promotores - % Detratores** para cálculo do NPS.

    Construí três blocos de códigos com o mesmo processo, para cada bloco foi utilizando três paradigmas de programação diferentes. O primeiro paradigma utilizado, como apresentado na imagem 03, é o **Paradigma Imperativo**, onde a implementação é realizada de uma maneira imperativa, ou seja, os comandos são executados sequencialmente. 