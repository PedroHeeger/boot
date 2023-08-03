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