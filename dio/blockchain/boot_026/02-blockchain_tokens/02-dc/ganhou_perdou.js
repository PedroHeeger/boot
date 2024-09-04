//Desafios JavaScript na DIO têm funções "gets" e "print" acessíveis globalmente:
//- "gets" : lê UMA linha com dado(s) de entrada (inputs) do usuário;
//- "print": imprime um texto de saída (output), pulando linha.

ganhouAposta = gets();

//TODO: Crie uma condicional if-else corretamente para atender aos requisitos para solucionar o problema;
if (ganhouAposta === "1") {
    print("Ficou rico!");
} else if (ganhouAposta === "0") {
    print("Perdeu tudo!");
}