// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.Scanner;

public class Problem {
    public static void main(String[] args){
		// Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
		Scanner leitor = new Scanner(System.in);

		// Extraindo o valor final até onde será iterado
		int C = leitor.nextInt();
		String nome;
		int N;

		// TODO: complete os espaços em branco com sua solução para o problema
		// Iterando de zero até o valor determinado pelo usuário
		for (int i = 0; i <  C   ; i++) {
			// Extraindo as informações de entrada do usuário
			nome = leitor.next();
			N = leitor.nextInt();

			// Comparando se o valor da variável nome é Thor
			if (nome.equals("Thor")) System.out.println(    "Y"     );
			else System.out.println(     "N"      );
		}
    }
	
}