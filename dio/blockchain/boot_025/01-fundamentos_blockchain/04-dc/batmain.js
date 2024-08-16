// IMPORTANTE: As funções "gets" e "print" são acessíveis globalmente e têm as seguintes funcionalidades: 
// - "gets" : lê UMA linha com dados de entrada (inputs) do usuário;
// - "print": imprime um texto de saída (output) e pula uma linha ("\n") automaticamente;
// Abaixo segue o template de código para este desafio, o qual pode ou não utilizar tais funções.

let T = parseInt(gets());

// TODO: Com base na quantidade de vilões (T), imprima um 'Y' para cada um deles.
// Para isso, use uma estrutura de repetição e a função global "print" (que já pula linha).


// Estrutura de repetição para imprimir 'Y' T vezes
for (let i = 0; i < T; i++) {
  print('Y');  // Imprime 'Y' e automaticamente pula uma linha
}