// Abaixo segue um exemplo de código que você pode ou não utilizar
import java.util.Scanner;

public class Program {
    public static void main(String[] args) {
        // Classe existente utilizada para extrair dados de entrada fornecidos pelo usuário
        Scanner sc = new Scanner(System.in);

        double A, B, media;
        
        // Extraindo as entradas informada pelo o usuário 
        A = sc.nextDouble();
        B = sc.nextDouble();

 //TODO: Complete os espaços em branco com uma possível solução para o desafio 
        media = (  A   * 3.5 +   B  * 7.5)/11; 

        System.out.printf("MEDIA = %.5f",  media   );
        System.out.println();
    }
}