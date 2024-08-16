// IMPORTANTE: As funções "gets" e "print" são acessíveis globalmente e têm as seguintes funcionalidades: 
// - "gets" : lê UMA linha com dados de entrada (inputs) do usuário;
// - "print": imprime um texto de saída (output) e pula uma linha ("\n") automaticamente;
// Abaixo segue o template de código para este desafio, o qual pode ou não utilizar tais funções.

let linha = gets();

// Atribui os valores de entrada nas respectivas constantes usando destructuring.
// Referencia: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
const [precoAlcool, precoGasolina, rendimentoAlcool, rendimentoGasolina] = 
  linha.split(' ').map(x => parseFloat(x));

//TODO: Calcular o Preço/Km para cada conbustível considerando os valores de entrada.
const precoPorKmAlcool = precoAlcool / rendimentoAlcool;
const precoPorKmGasolina = precoGasolina / rendimentoGasolina;

// Usa o conceito de operador condicional (ternário) para identificar qual é o melhor preço.
// Referência: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Conditional_Operator
const maisEconomico = precoPorKmGasolina <= precoPorKmAlcool ? 'G' : 'A';
print(maisEconomico);