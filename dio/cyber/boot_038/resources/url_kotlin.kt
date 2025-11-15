fun main() {
    // Lê a entrada do usuário ou usa uma string vazia se nenhuma entrada for fornecida
    val url = readLine() ?: "" 

    val resultado: String

    if (url.startsWith("https://")) {
    // TODO: Atribua para a variável resultado a mensagem adequada:
      resultado = "URL segura"
   //TODO: Implemente a condição necessária para a verificação da URL:
    } else if (url.startsWith("http://")) {
    // TODO: Atribua para a variável resultado a mensagem adequada:
      resultado = "URL nao segura"
    } else {
      resultado = "Formato invalido"
    }

    //Exibe o resultado
    println(resultado)
}