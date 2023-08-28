import java.util.Scanner;

public class Contador {
    public static void main(String[] args) {
        Scanner terminal = new Scanner(System.in);

        System.out.print("Digite o primeiro parâmetro: ");
        int parametro1 = terminal.nextInt();
        System.out.print("Digite o segundo parâmetro: ");
        int parametro2 = terminal.nextInt();

        try {
            contar(parametro1, parametro2);
        } catch (ParametroInvalidosExcepetion exception){
            System.out.println("O segundo parâmetro deve ser maior que o primeiro.");
        }

    }

    static void contar(int parametro1, int parametro2) throws ParametroInvalidosExcepetion {
        if(parametro1 >= parametro2){
            throw new ParametroInvalidosExcepetion();
        }
        
        
        int contagem = parametro2 - parametro1;

        for(int i = parametro1; i <= parametro2; i++){
            System.out.println(i);
        }
        System.out.println("A contagem realizada teve " + contagem + " ocorrencias.");
    }

    public static class ParametroInvalidosExcepetion extends Exception{}
}