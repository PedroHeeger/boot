// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.Scanner;

public class Problem {
	public static void main(String[] args) {
		// Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
		Scanner sc = new Scanner(System.in);

		// TODO: complete os espaços em branco com sua solução para o problema
		// Criando uma matriz de Strings de tamanho 10 para receber nomes
		String[] nomes = new String[  10   ];
		
		// Iterando de zero a 10 (tamanho da matriz)
		for(int i=0 ; i<10 ; i++)
			// Extraindo as informações de entrada do usuário e inserindo na matriz
			nomes[  i  ] = sc.nextLine();
	
	// Imprimindo os nomes na matriz na posição determinada
    System.out.println(nomes[2]);
    System.out.println(nomes[6]);
    System.out.println(nomes[8]);
	}
}