import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

/**
 * Classe principal que a partir de uma lista de questionamentos e de respostas
 * verifica se a pessoa investigada tem participação em um crime.
 */
public class Crime{

    /**
     * Ponto de entrada do programa. Cria duas listas, uma de questionamentos e outra
     * de respostas desses questionamentos para verificar se a pessoa investigada tem 
     * participação em um crime.
     *
     * @param args Os argumentos da linha de comando.
     */
    public static void main(String [] args){
        Scanner scan = new Scanner(System.in);
        List<String> respostas = new ArrayList<>();
        List<String> questionamentos = new ArrayList<>(Arrays.asList("Telefonou para a vítima: ", "Esteve no local do crime: ", "Mora perto da vítima: ", "Devia para a vítima: ", "Já trabalhou com a vítima: "));
        
        investigarCrime(respostas, questionamentos, scan);
    }

    /**
     * Recebe um valor de resposta para cada questionamento realizado, em seguida contabiliza
     * quantas respostas foram positivas e verifica qual grau de participação de uma pessoa em
     * um crime.
     * 
     * @param respostas Lista de respostas dos questionamentos.
     * @param questionamentos Lista de questionamentos a ser feito.
     * @param scan Objeto da classe Scanner para extrair uma entrada de dado pelo usuário.
     */
    public static void investigarCrime(List<String> respostas, List<String> questionamentos, Scanner scan){
        System.out.println("Digite Y para sim e N para não.");
        for(String questionamento : questionamentos){
            System.out.print(questionamento);
            String resposta = scan.next();
            if(resposta.equals("y") || resposta.equals("Y")){
                resposta = "Y";
                respostas.add(resposta);
            }else if(resposta.equals("n") || resposta.equals("N")){
                resposta = "N";
                respostas.add(resposta);
            }else{
                System.out.println("Opção inválida, resposta marcada como não.");
            }
        }

        // Verificando o grau de participação da pessoa em um crime
        int respostaPositiva = Collections.frequency(respostas, "Y");
        if(respostaPositiva == 5){
            System.out.println("Assassina");
        }else if (respostaPositiva == 3 || respostaPositiva == 4){
            System.out.println("Cúmplice");
        }else if (respostaPositiva == 2){
            System.out.println("Suspeita");            
        }else{
            System.out.println("Inocente"); 
        }
    }
}