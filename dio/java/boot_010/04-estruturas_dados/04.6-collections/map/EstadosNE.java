import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;
import java.util.Collections;
import java.util.Iterator;
import java.text.NumberFormat;
import java.util.Locale;

/**
 * Classe que representa estados do Nordeste e manipula os dados
 * com seus métodos.
 */
public class EstadosNE {

    /**
     * Ponto de entrada do programa. Manipula dados referente aos estados do 
     * Nordeste de uma estrutura do tipo map.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main (String [] args){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        Map<String, Integer> estadosNE = new HashMap<>();
        estadosNE.put("PE", 9616621);
        estadosNE.put("AL", 3351543);
        estadosNE.put("CE", 9187103);
        estadosNE.put("RN", 3534265);
        System.out.println("Exibindo os estados do NE e suas populações: " + estadosNE);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Alterando a população do RN: ");
        estadosNE.put("RN", 3534165);
        System.out.println(estadosNE);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Verificando se o estado PB existe, se não, adicionando ao map: ");
        if(!estadosNE.containsKey("PB")) estadosNE.put("PB", 4039277);      
        System.out.println(estadosNE);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo a população do estado do PE: " + estadosNE.get("PE"));

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo os estados e suas populações na ordem em que foi criado: ");
        Map<String, Integer> estadosNE2 = new LinkedHashMap<>(){{
            put("PE", 9616621);
            put("AL", 3351543);
            put("CE", 9187103);
            put("RN", 3534265);    
        }};
        System.out.println(estadosNE2);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo os estados e suas populações na ordem alfabética: ");
        Map<String, Integer> estadosNE3 = new TreeMap<>(){{
            put("PE", 9616621);
            put("AL", 3351543);
            put("CE", 9187103);
            put("RN", 3534265);    
        }};
        System.out.println(estadosNE3);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo o estado com a menor população: ");
        Integer menorPopulacao = Collections.min(estadosNE.values());
        String estadoMenorPopulacao = "";
        for (Map.Entry<String, Integer> entry: estadosNE.entrySet()) {
            if(entry.getValue().equals(menorPopulacao)) {
                estadoMenorPopulacao = entry.getKey();
                System.out.println(estadoMenorPopulacao + " - " + menorPopulacao);
            }
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo o estado com a maior população: ");
        Integer maiorPopulacao = Collections.max(estadosNE.values());
        String estadoMaiorPopulacao = "";
        for (Map.Entry<String, Integer> entry: estadosNE.entrySet()) {
            if(entry.getValue().equals(maiorPopulacao)) {
                estadoMaiorPopulacao = entry.getKey();
                System.out.println(estadoMaiorPopulacao + " - " + maiorPopulacao);
            }
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo a soma da população dos estados: ");
        Iterator<Integer> iterator = estadosNE.values().iterator();
        Double soma = 0d;
        while(iterator.hasNext()){
            soma += iterator.next();
        }
        NumberFormat formatador = NumberFormat.getInstance(Locale.getDefault());
        String somaFormatada = formatador.format(soma);
        System.out.println(somaFormatada);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo a média da população dos estados: ");
        String media = formatador.format(soma/estadosNE.size());
        System.out.println(media);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Removendo os estados com população menor que 4.000.000: ");
        Iterator<Integer> iterator2 = estadosNE.values().iterator();
        while(iterator2.hasNext()){
            // System.out.println(iterator2.next());
            if(iterator2.next() <= 4000000){
                iterator2.remove();
            }
        }
        System.out.println(estadosNE);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Apagando o dicionario de estados: ");
        estadosNE.clear();

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Confira se o dicionário está vazio: ");
        System.out.println(estadosNE.isEmpty());
    }
}
