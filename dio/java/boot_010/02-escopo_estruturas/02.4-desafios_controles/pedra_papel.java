// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.*; 
public class Problem {
    public static void main(String[] args) {
		// Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
      	Scanner leitor = new Scanner(System.in);
		// Extraindo o valor final até onde será iterado
    	int N = leitor.nextInt();
    	String jogador1, jogador2;

		// TODO: complete os espaços em branco com sua solução para o problema
		// Iterando de zero até o valor determinado pelo usuário
    	for (int i = 0; i < N; i++) {
			// Extraindo as informações de entrada do usuário
    		jogador1 = leitor.next();
    		jogador2 = leitor.next();

			// Comparando várias condições para determinar quem vence o jogo
    		if (jogador1.equalsIgnoreCase("ataque") && jogador2.equalsIgnoreCase("ataque")) System.out.println("Aniquilacao mutua");
    		else if (jogador1.equalsIgnoreCase("papel") && jogador2.equalsIgnoreCase("papel")) System.out.println("Ambos venceram");
    		else if (jogador1.equalsIgnoreCase("ataque")) System.out.println("Jogador 1 venceu");
    		else if (jogador2.equalsIgnoreCase("ataque")) System.out.println("Jogador 2 venceu");
    		else if (jogador2.equalsIgnoreCase("papel")) System.out.println("Jogador 1 venceu");
    		else if (jogador1.equalsIgnoreCase("papel")) System.out.println("Jogador 2 venceu");
    		else System.out.println("Sem ganhador");
    	}
    }
}