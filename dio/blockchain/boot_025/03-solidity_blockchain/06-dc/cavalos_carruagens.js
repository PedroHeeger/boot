// IMPORTANTE: As funções "gets" e "print" são acessíveis globalmente e têm as seguintes funcionalidades: 
// - "gets" : lê UMA linha com dados de entrada (inputs) do usuário;
// - "print": imprime um texto de saída (output) e pula uma linha ("\n") automaticamente;
// Abaixo segue o template de código para este desafio, o qual pode ou não utilizar tais funções.

const N = parseInt(gets());

// Expressão regular para validação de uma placa.
// Referência: https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Regular_Expressions
const regexPlacaValida = new RegExp("^[A-Z]{3}-[0-9]{4}$");

for(let i = 0; i < N; i++){
  const placa = gets();
  
  if (placa.match(regexPlacaValida)) {
    // TODO: Recupere o digito final da placa e o atribua à constante "digito".
    const digito = parseInt(placa.slice(-1));

    // TODO: A partir do "digito", crie as condições necessárias para imprimir o dia da semana.
    if (digito === 1 || digito === 2) {
      print("SEGUNDA");
    } else if (digito === 3 || digito === 4) {
      print("TERCA");
    } else if (digito === 5 || digito === 6) {
      print("QUARTA");
    } else if (digito === 7 || digito === 8) {
      print("QUINTA");
    } else if (digito === 9 || digito === 0) {
      print("SEXTA");
    }
  } else {
    print("FALHA");
  }
}