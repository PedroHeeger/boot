// IMPORTANTE: As funções "gets" e "print" são acessíveis globalmente e têm as seguintes funcionalidades: 
// - "gets" : lê UMA linha com dados de entrada (inputs) do usuário;
// - "print": imprime um texto de saída (output) e pula uma linha ("\n") automaticamente;
// Abaixo segue o template de código para este desafio, o qual pode ou não utilizar tais funções.

const minutosFaltantes = parseInt(gets());
const valores = gets().split(" ");

// TODO: A partir do array "valores", atribua os valores respectivos às constantes "a" e "b".
const a = parseInt(valores[0]);
const b = parseInt(valores[0]);

if(minutosFaltantes < a + b) {
  print('Deixa para amanha!');
} else {
  print('Farei hoje!');
}