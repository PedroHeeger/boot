import java.util.Locale;
import java.util.Scanner;

/**
 * Classe que representa a interação do terminal para criação de uma conta bancária.
 */
public class ContaTerminal {

    /**
     * Ponto de entrada do programa.
     * Permite a criação de uma conta bancária, coletando informações do usuário através do terminal.
     *
     * Este método realiza as seguintes etapas:
     * 1. Extrai informações da agência, número da conta, nome completo e saldo do usuário.
     * 2. Imprime uma mensagem de agradecimento e detalhes da conta criada.
     *
     * @param args Os argumentos da linha de comando.
     */
    public static void main(String[] args){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Executando todo o código dentro do método main:");
        
        // Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
        Scanner scanner = new Scanner(System.in).useLocale(Locale.US);

        // Extraindo as informações de entrada do usuário
        System.out.print("Por favor, digite o número da Agência: ");
        String agencia = scanner.next();

        System.out.print("Digite o número da Conta: ");
        int conta = scanner.nextInt();

        // Limpando a quebra de linha pendente
        scanner.nextLine();

        // Extraindo as informações de entrada do usuário
        System.out.print("Digite seu nome completo: ");
        String nome = scanner.nextLine();

        System.out.print("Digite seu saldo: ");
        double saldo = scanner.nextDouble();

        // Fechando o objeto criado da classe Scanner
        scanner.close();

        // Imprimindo as informações
        System.out.println("Olá " + nome + ", obrigado por criar uma conta em nosso banco, sua agência é " + agencia + ", conta " + conta + " e seu saldo " + saldo + " já está disponível para saque.");
    }
}