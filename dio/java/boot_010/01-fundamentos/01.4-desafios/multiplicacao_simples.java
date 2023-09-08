// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.Scanner;

public class Multiplicacao_Simples {
	public static void main(String[] args) {
		// Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
		@SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);
		
		int A, B, PROD;
		
		// Extraindo as entradas informada pelo o usuário 
		A = sc.nextInt();
		B = sc.nextInt();
		
		// TO DO: Complete os espaços em branco com uma possível solução para o desafio 
		PROD = A * B;    

		System.out.println("PROD = " +  PROD );
	}
}