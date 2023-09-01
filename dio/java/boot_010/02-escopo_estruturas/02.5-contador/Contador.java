import java.util.Scanner;

/**
 * Classe que representa um contador.
 */
public class Contador {

    /**
     * Ponto de entrada do programa. Extrai informações de entrada do usuário e executa o método "contar",
     * lidando com exceções caso os parâmetros sejam inválidos.
     *
     * @param args Os argumentos da linha de comando.
     */
    public static void main(String[] args) {
        // Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
        Scanner terminal = new Scanner(System.in);

        // Extraindo as informações de entrada do usuário
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Informando as entradas");
        System.out.print("Digite o primeiro parâmetro: ");
        int parametro1 = terminal.nextInt();
        System.out.print("Digite o segundo parâmetro: ");
        int parametro2 = terminal.nextInt();

        /*
        Executando o método contar com as informações passadas pelo usuário dentro de uma estrutura 
        de exceções, que caso os parâmetros sejam inválidos, a exceção será acionada e exibirá uma mensagem.
        */
        try {
            contar(parametro1, parametro2);
        } catch (ParametroInvalidosException exception){
            // Recebendo o objeto criado e executando seu método
            System.out.println(exception.getMessage());
        }
    }

    /*
    Realizando uma contagem a partir de dois parâmetros, sendo que o primeiro tem que ser menor
    que o segundo parâmetro, caso contrário, uma estrutura de exceções é acionada.
    A cada número contado, o valor é exibido e ao final uma mensagem com o número total de ocorrências
    é impressa.
     */
    static void contar(int parametro1, int parametro2) throws ParametroInvalidosException {
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método contar");

        /*
        Determinando se o parâmetro 1 é maior ou igual ao parâmetro 2, caso seja, cria uma instância
        (objeto) da classe ParametroInvalidosException.
         */ 
        if(parametro1 >= parametro2){
            throw new ParametroInvalidosException();
        }
        
        int contagem = parametro2 - parametro1;

        for(int i = parametro1; i <= parametro2; i++){
            System.out.println(i);
        }
        System.out.println("A contagem realizada teve " + contagem + " ocorrencias.");
    }
}

/**
 * Exceção para tratar parâmetros inválidos.
 */
class ParametroInvalidosException extends Exception {
    public ParametroInvalidosException() {
        super("O segundo parâmetro deve ser maior que o primeiro.");
    }
}