using System;

class Program {
    static void Main(string[] args) {
        // Lê a entrada do usuário
        string url = Console.ReadLine(); 

        string resultado;
        if (url.StartsWith("https://")) {
       // TODO: Atribua para a variável resultado a mensagem adequada:
          resultado = "URL segura";    
  
      //TODO: Implemente a condição necessária para a verificação da URL:
        } else if (url.StartsWith("http://")) {
      // TODO: Atribua para a variável resultado a mensagem adequada:
          resultado = "URL nao segura";
        } else {
           resultado = "Formato invalido";            
        }

        // Exibe o resultado
        Console.WriteLine(resultado);
    }
}