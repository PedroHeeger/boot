import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/**
 * Classe que a partir de uma lista de meses e de temperaturas,
 * verifica quais meses a temperatura foi maior que a média.
 */
public class Temperatura{

    /**
     * Ponto de entrada do programa. Cria duas listas, uma de meses e outra com
     * valores de temperatura desses meses para verificar quais meses a temperatura 
     * foi maior que a média.
     *
     * @param args Os argumentos da linha de comando.
     */
    public static void main(String [] args){
        Scanner scan = new Scanner(System.in);
        List<Double> temperaturas = new ArrayList<>();
        List<String> meses = new ArrayList<>(Arrays.asList("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho"));

        verificarTemperatura(meses, temperaturas, scan);
    }

    /**
     * Recebe um valor de temperatura para cada um dos seis primeiros meses do ano, calcula a média
     * da temperatura desses seis meses e exibe o mês e temperatura dos meses que a temperatura foi
     * maior que a média.
     *
     * @param meses Lista dos seis primeiros meses do ano.
     * @param temperaturas Lista das temperaturas dos seis primeiros meses do ano.
     * @param scan Objeto da classe Scanner para extrair uma entrada de dado pelo usuário.
     */
    public static void verificarTemperatura(List<String> meses, List<Double> temperaturas, Scanner scan){
        Double soma = 0d;
        for (int i=0; i < 6; i++){
            System.out.print("Digite a temperatura para o mês de " + meses.get(i) + ": ");
            Double temperatura = scan.nextDouble();
            temperaturas.add(temperatura);
            soma += temperatura;
        }
        
        Double media = soma / temperaturas.size();
        System.out.printf("Média: %.1f", media);
        System.out.println();

        System.out.println("Temperaturas acima da média:");
        for (int i=0; i < 6; i++){
            if(temperaturas.get(i) < media) continue;
            System.out.println(meses.get(i) + " " + temperaturas.get(i));
        }
    }
}