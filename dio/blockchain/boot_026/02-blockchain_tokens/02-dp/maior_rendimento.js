//Desafios JavaScript na DIO têm funções "gets" e "print" acessíveis globalmente:
//- "gets" : lê UMA linha com dado(s) de entrada (inputs) do usuário;
//- "print": imprime um texto de saída (output), pulando linha.

let dados = gets().split(" ");

let arr = [];
for (i = 0; /*TODO: Faça o laço de repetição FOR corretamente*/ i < dados.length; i++) {
    arr.push(dados[i]);
}


max_valor = Math.max(...arr) //Com essa função Math.max conseguimos encontrar o maior número. Como queremos encontrar 
//dentro de um array utilizamos o "spread" "..." antes do nome do array para que a função Math.max percorra o array 
//verificando  todos os números;
print(max_valor);