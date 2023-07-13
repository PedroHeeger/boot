# Linux do Zero - Curso Introdução à Programação e Pensamento Computacional   <img src="../0-img/logo_boot.png" alt="boot_03" width="auto" height="45">

#### Repositório: [course](../../../../)   
#### Plataforma: <a href="../../../">dio   <img src="../../../../0-outros/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
#### Software/Assunto: <a href="../../">linux   <img src="../../../../0-outros/logos/software/linux.png" alt="linux" width="auto" height="25"></a>
#### Bootcamp: <a href="../">boot_03 (Linux do Zero)   <img src="../0-img/logo_boot.png" alt="boot_03" width="auto" height="25"></a>
#### Curso: 1.05) Introdução à Programação e Pensamento Computacional
---

Esta pasta é referente ao curso **Introdução ao Desenvolvimento Moderno de Software** do Módulo 1 **Preparando-se Para a Jornada** do Bootcamp **Linux do Zero**.

#### Tema:
- Sistemas Operacionais

#### Ferramentas Utilizadas:
- Pseudocódigo:
  - Portugol <img src="../../../../0-outros/logos/software/portugol.png" alt="portugol" width="auto" height="25">
- Ambiente de Desenvolvimento (IDE):
  - VS Code   <img src="../../../../0-outros/0-outros/logos/software/vscode.png" alt="vscode" width="auto" height="25">
  - Portugol Studio   <img src="../../../../0-outros/logos/software/portugol.png" alt="portugol_studio" width="auto" height="25">
- Versionamento: 
  - Git   <img src="../../../../0-outros/logos/software/git.png" alt="git" width="auto" height="25">
- Repositório:
  - GitHub   <img src="../../../../0-outros/logos/software/github.png" alt="github" width="auto" height="25">
- Outros:
  - Google Drive <img src="../../../../0-outros/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">

---

#### Objetivo:
- O objetivo desse curso foi introduzir os conceitos básicos de lógica de programação e pensamento computacional.

#### Estrutura:
- Como esse curso foi boa parte teórico, só foram criados três arquivos de scripts em Portugol para execução de funções simples e conhecimento da lógica de programação.

#### Desenvolvimento:
Em relação ao desenvolvimento, os arquivos de scripts realizados foram condificações simples apenas para conhecimento do pseudocódigo **Portugol**. Esses três foram desenvolvidos na plataforma online **Portugol Studio**. O primeiro de nome **soma_intervalo.por**, onde foi criada duas funções, a primeira para receber os valores das variáveis X e Y e passá-las para uma outra função que calcula a soma de todos os números de um intervalo de números determinados. Abaixo, é exibido essa segunda função.

```
// Recebe as notas dos alunos e exibe o resultado do cálculo da média pela outra função
	funcao inicio() {
		real n1, n2, nota1, nota2
		escreva("Digite as notas da p1 e p2 do aluno A: ")
		leia(n1)
		leia(n2)
		
		escreva("Digite as notas da p1 e p2 do aluno B: ")
		leia(nota1)
		leia(nota2)
		
		escreva("Média do aluno A: ", media_aluno(n1, n2))
		escreva("\nMédia do aluno B: ", media_aluno(nota1, nota2))
	}
```

Já no segundo arquivo de script (**media.por**), também com duas funções, sendo uma que recebe duas notas dos alunos hipotéticos A e B, chama a outra função passando a nota desses alunos, esta outra função calcula a média desses alunos e devolve para a primeira função que exibe a média desses alunos.

```
programa {
	// Recebe as notas dos alunos e exibe o resultado do cálculo da média pela outra função
	funcao inicio() {
		real n1, n2, nota1, nota2
		escreva("Digite as notas da p1 e p2 do aluno A: ")
		leia(n1)
		leia(n2)
		
		escreva("Digite as notas da p1 e p2 do aluno B: ")
		leia(nota1)
		leia(nota2)
		
		escreva("Média do aluno A: ", media_aluno(n1, n2))
		escreva("\nMédia do aluno B: ", media_aluno(nota1, nota2))
	}

	// Cálcula a média das notas dos alunos
	funcao real media_aluno(real nota1, real nota2){
	    retorne (nota1 + nota2) / 2
	}
}
```

Por fim, o último script, chamado de **pesquisa_vetor.por**, com uma única função que verifica se um número procurado está contido em um vetor criado, caso exista, determina a posição (índice) desse número no vetor.

```
programa {
  // Verifica se o número procurado existe em um vetor criado e caso exista, determina a posição dele neste vetor
  funcao inicio() {
    inteiro vetor[] = {1,3,5,7,9} // Cria o vetor com valores pré-definidos
    inteiro numero
    logico achou = falso // Variável para armazenar o resultado da procura

    escreva("Qual número deseja procurar? ")
    leia(numero)

    para (inteiro posicao = 0; posicao < 5; posicao++){
      se (vetor[posicao] == numero){
        escreva ("Encontrado na posição: ", posicao, "\n")
        achou = verdadeiro
      }
    }
    
    se (nao achou){
      escreva ("O número não está no vetor\n")
    }
  }
}
```