// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.Scanner;

public class Soma_Simples {

	public static void main(String[] args) {
		try (// Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
		Scanner sc = new Scanner (System.in)) {
			int A, B, soma;
			
			// Extraindo as entradas informada pelo o usuário 
			A = sc.nextInt();
			B = sc.nextInt();

			// TO DO: Complete os espaços em branco com uma possível solução para o desafio 
			soma =  A + B ;

 
			System.out.println("SOMA = " + soma );
		}
	}
}