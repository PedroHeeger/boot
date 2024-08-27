//Desafios JavaScript na DIO têm funções "gets" e "print" acessíveis globalmente:
//- "gets" : lê UMA linha com dado(s) de entrada (inputs) do usuário;
//- "print": imprime um texto de saída (output), pulando linha.

let n = gets();

//TODO: crie as variaveis necessarias para a resolução do problema;
let cripto = 50;
let rendimento_mes = cripto/10;
let rendimento_total = rendimento_mes * n;

//TODO 2: print na tela a quantidade total de criptomoedas (valor inicial + valor de rendimento);
print(cripto + rendimento_total, "criptomoedas");