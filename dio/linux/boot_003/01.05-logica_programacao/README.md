# Linux do Zero - Curso Introdução à Programação e Pensamento Computacional   <img src="../0-aux/logo_boot.png" alt="boot_03" width="auto" height="45">

### Repository: [boot](../../../../)   
### Platform: <a href="../../../">dio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/plataforma/dio.jpeg" alt="dio" width="auto" height="25"></a>   
### Software/Subject: <a href="../../">linux   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linux/linux-original.svg" alt="linux" width="auto" height="25"></a>
### Bootcamp: <a href="../">boot_03 (Linux do Zero)   <img src="../0-aux/logo_boot.png" alt="boot_03" width="auto" height="25"></a>
### Course: 1.5. Introdução à Programação e Pensamento Computacional

#### <a href="https://github.com/PedroHeeger/main/blob/main/cert_ti/04-curso/programming/logica_algoritmo/(22-10-09)...Programacao...Pensamento_Computacional_PH_DIO.pdf">Certificate</a>

---

This folder refers to the course **Introdução ao Desenvolvimento Moderno de Software** in Module 1 **Preparando-se Para a Jornada** of Bootcamp **Linux do Zero**.

### Theme:
- Programming Logic

### Used Tools:
- Operating System (OS): 
  - Windows 11   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/windows11.png" alt="windows11" width="auto" height="25">
- Cloud Services:
  - Google Drive <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/google_drive.png" alt="google_drive" width="auto" height="25">
- Language:
  - HTML   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/html5/html5-original.svg" alt="html" width="auto" height="25">
  - Markdown   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" alt="markdown" width="auto" height="25">
- Pseudocode:
  - Portugol   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/portugol.png" alt="portugol" width="auto" height="25">
- Integrated Development Environment (IDE) and Text Editor:
  - Portugol Studio   <img src="https://github.com/PedroHeeger/main/blob/main/0-aux/logos/software/portugol.png" alt="portugol_studio" width="auto" height="25">
  - VS Code   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/vscode/vscode-original.svg" alt="vscode" width="auto" height="25">
- Versioning: 
  - Git   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" alt="git" width="auto" height="25">
- Repository:
  - GitHub   <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original.svg" alt="github" width="auto" height="25">

---

### Objective:
O objetivo desse curso foi introduzir os conceitos básicos de lógica de programação e pensamento computacional.

### Structure:
Como esse curso foi boa parte teórico, só foram criados três arquivos de scripts em Portugol para execução de funções simples e conhecimento da lógica de programação, além deste arquivo de README.

### Development:
Em relação ao desenvolvimento, os arquivos de scripts realizados foram codificações simples apenas para conhecimento do pseudocódigo **Portugol**. Esses três foram desenvolvidos na plataforma online **Portugol Studio**. O primeiro de nome **soma_intervalo.por**, onde foi criada duas funções, a primeira para receber os valores das variáveis X e Y e passá-las para uma outra função que calcula a soma de todos os números de um intervalo de números determinados. Abaixo é exibida essa segunda função.

```
// Calcula a soma de todos os números de um intervalo de números determinado
	funcao inteiro soma_intervalo(inteiro x, inteiro y){
	    inteiro total, resultado_parcial
	    total = y /2 
	    resultado_parcial = y+x
	    
	    inteiro resultado = total * resultado_parcial
	    retorne resultado
	}
```

Já no segundo arquivo de script (**media.por**), também com duas funções, sendo uma que recebe duas notas dos alunos hipotéticos A e B e chama uma outra função passando as notas desses alunos. Esta outra função, por sua vez, calcula a média desses alunos e devolve para a primeira função que exibe a média desses alunos.

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