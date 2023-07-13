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