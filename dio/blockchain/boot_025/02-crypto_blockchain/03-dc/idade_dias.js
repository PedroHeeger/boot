// IMPORTANTE: As funções "gets" e "print" são acessíveis globalmente e têm as seguintes funcionalidades: 
// - "gets" : lê UMA linha com dados de entrada (inputs) do usuário;
// - "print": imprime um texto de saída (output) e pula uma linha ("\n") automaticamente;
// Abaixo segue o template de código para este desafio, o qual pode ou não utilizar tais funções.

let totalDeDias = parseInt(gets());

// TODO: Calcular a quantidade de anos a patir do 'totalDeDias'.
const qtdAnos = Math.floor(totalDeDias / 365);
totalDeDias = totalDeDias % 365;

// TODO: Calcular a quantidade de meses a patir do 'totalDeDias' atualizado.
const qtdMeses= Math.floor(totalDeDias / 30);
totalDeDias = totalDeDias % 30;

// Impressão do resultado usando interpolação de strings.
// Referência: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Template_literals
print(`${qtdAnos} ano(s)
       ${qtdMeses} mes(es)
       ${totalDeDias} dia(s)`);