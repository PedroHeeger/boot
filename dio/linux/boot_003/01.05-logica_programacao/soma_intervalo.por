programa {
	// Recebe os valores de X e Y digitados no input e passa eles para a função
	funcao inicio() {
		inteiro x, y
		
		escreva("Digite os números para executar a soma do intervalo: ")
		leia(x)
		leia(y)
		
		escreva(soma_intervalo(x,y))	
	}

	// Calcula a soma de todos os números de um intervalo de números determinado
	funcao inteiro soma_intervalo(inteiro x, inteiro y){
	    inteiro total, resultado_parcial
	    total = y /2 
	    resultado_parcial = y+x
	    
	    inteiro resultado = total * resultado_parcial
	    retorne resultado
	}
}