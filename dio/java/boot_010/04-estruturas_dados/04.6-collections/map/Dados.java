import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Random;

/**
 * Classe que representa um jogo onde é calculado o número de 
 * ocorrências de um mesmo dado.
 */
public class Dados {

    /**
     * Ponto de entrada do programa. Cria um jogo que calcula o número de 
     * ocorrências de um mesmo dado.
     * 
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        int quantLancamentos = 100;

        // Gerando valores randômicos (1 a 6) e adicionando a uma lista
        List<Integer> valores = new ArrayList<>();
        Random geradorDeLancamento = new Random();
        for (int i = 0; i < quantLancamentos; i++){
            int numero = geradorDeLancamento.nextInt(6) + 1;
            valores.add(numero);
        }

        // Adicionando os valores da lista a um dicionário e contabilizando o número de ocorrências
        Map<Integer, Integer> lancamentos = new HashMap();
        for(Integer resultado : valores){
            if(lancamentos.containsKey(resultado)){
                lancamentos.put(resultado, lancamentos.get(resultado) + 1);
            } else {
                lancamentos.put(resultado, 1);
            }
        }

        // Criando um pequena animação antes de exibir os resultados
        System.out.println("Jogando");
        for (int i = 0; i < 3; i++){
            try {
                Thread.sleep(3000);
                System.out.println(".");
            } catch (InterruptedException e){
                e.printStackTrace();
            }
        }
        
        // Imprimindo o dicionário com os dados e o número de ocorrências
        System.out.println("\nValor " + " Quant. de vezes.");
        for(Map.Entry<Integer, Integer> entry : lancamentos.entrySet()){
            System.out.printf("%3d %10d\n", entry.getKey(), entry.getValue());
        }
    }
}
