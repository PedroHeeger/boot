package ordem;
/*Dadas as seguintes informações  de id e contato, crie um dicionário e
ordene este dicionário exibindo (Nome id - Nome contato);

id = 1 - Contato = nome: Simba, numero: 2222;
id = 4 - Contato = nome: Cami, numero: 5555;
id = 3 - Contato = nome: Jon, numero: 1111;
*/

import java.util.*;
import java.util.function.Function;

/**
 * Classe que realiza ordenações de estruturas de dados map, com utilização
 * de métodos do Comparator no método de ordenação, com uso de classe anônima
 * e função Lambda.
 */
public class Ordenacao {

    /**
     * Ponto de entrada do programa. Executa os métodos de ordenação para um contexto
     * de contato de telefone, utilizando a classe Contato para criar os objetos de 
     * contato de telefone.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        Map<Integer, Contato> agenda = exibirOrdemAleatoria();
        exibirOrdemInsercao();
        exibirOrdemId(agenda);

        exibirOrdemNumeroTelefone(compararUsandoComparatorNoMetodo(), agenda);
        exibirOrdemNumeroTelefone(compararUsandoClasseAnonima(), agenda);
        exibirOrdemNumeroTelefone(compararUsandoLambda(), agenda);

        exibirOrdemNomeContato(compararUsandoComparatorNoMetodo(), agenda);
        exibirOrdemNomeContato(compararUsandoClasseAnonima(), agenda);
        exibirOrdemNomeContato(compararUsandoLambda(), agenda);
    }

    /**
     * Cria uma estrutura de dados HashMap de número de contatos, adicionando os 
     * contatos criados pela classe Contato e em seguida exibe os elementos em ordem
     * aleatória.
     * 
     * @return HashMap de número de contatos com os contatos adicionados, pois é utilizado
     * em outros métodos.
     */
    public static Map<Integer, Contato> exibirOrdemAleatoria(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("\tExibindo em Ordem: Aleatória\t");
        Map<Integer, Contato> agenda = new HashMap<>() {{
           put(1, new Contato("Simba", 5555));
           put(4, new Contato("Cami", 1111));
           put(3, new Contato("Jon", 2222));
        }};
        System.out.println(agenda);
        for (Map.Entry<Integer, Contato> entry: agenda.entrySet()) {
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }
        return agenda;
    }

    /**
     * Cria uma estrutura de dados LinkedHashMap de número de contatos, adicionando os 
     * contatos criados pela classe Contato e em seguida exibe os elementos em ordem
     * de inserção.
     */
    public static void exibirOrdemInsercao(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("\tExibindo em Ordem: Inserção\t");
        Map<Integer, Contato> agenda = new LinkedHashMap<>() {{
            put(1, new Contato("Simba", 5555));
            put(4, new Contato("Cami", 1111));
            put(3, new Contato("Jon", 2222));
        }};
        System.out.println(agenda);
        for (Map.Entry<Integer, Contato> entry: agenda.entrySet()) {
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }
    }

    /**
     * Cria uma estrutura de dados TreeMap de número de contatos a partir de uma estrutura
     * de dados HashMap com contatos já adicionados, executado no método exibirOrdemAleatoria
     * e em seguida exibe os elementos em ordem de ID.
     * 
     * @param agenda Map (HashMap) de números de contatos com contatos já adicionados.
     */
    public static void exibirOrdemId(Map<Integer, Contato> agenda){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("\tExibindo em Ordem: ID\t");
        Map<Integer, Contato> agenda2 = new TreeMap<>(agenda);
        System.out.println(agenda2);
        for (Map.Entry<Integer, Contato> entry: agenda2.entrySet()) {
            System.out.println(entry.getKey() + " - " + entry.getValue().getNome());
        }
    }

    /**
     * Utiliza a estrutura de dados TreeSet de um Map (Conjunto de dicionários) criada para receber os contatos já 
     * adicionados da estrutura de dados HashMap e exibir os elementos em ordem de número de telefone.
     * 
     * @param agenda Map (HashMap) de números de contatos com contatos já adicionados.
     * @param set TreeSet de um Map (Conjunto de dicionários) vazio que receberá os contatos do HashMap.
     */
    public static void exibirOrdemNumeroTelefone(Set<Map.Entry<Integer, Contato>> set, Map<Integer, Contato>agenda){
        // System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("\tExibindo em Ordem: Número Telefone\t");
        set.addAll(agenda.entrySet());
        for (Map.Entry<Integer, Contato> entry: set) {
            System.out.println(entry.getKey() + " - " + entry.getValue().getNumero() +
                    ": " +entry.getValue().getNome());
        }
    }

    /**
     * Cria uma estrutura de dados TreeSet de número de contatos a partir de uma estrutura
     * de dados HashMap com contatos já adicionados, executado no método exibirOrdemAleatoria
     * e em seguida exibe os elementos em ordem de ID.
     * 
     * @param agenda Map de números de contatos com contatos já adicionados.
     */
    public static void exibirOrdemNomeContato(Set<Map.Entry<Integer, Contato>> set, Map<Integer, Contato>agenda){
        // System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("\tExibindo em Ordem: Nome de Contato\t");
        //precisamos organizar os valores. Logo:
        // Set<Map.Entry<Integer, Contato>> set1 = new TreeSet<>(Comparator.comparing(
        //         cont -> cont.getValue().getNome()));
        set.addAll(agenda.entrySet());
        // Imprimindo usando forEach
        set.forEach(entry -> System.out.println(entry.getKey() + " - " + entry.getValue().getNome()));
    }

    // MÉTODOS DE COMPARAÇÃO PARA ORDENAÇÃO:

    /**
     * Cria um TreeSet de um Map (Conjunto de dicionários) vazio, sendo que a comparação entre os
     * elementos será realizada pelo método da classe Comparator que já é embutido neste método. 
     * 
     * @return TreeSet de um Map (Conjunto de dicionários) vazio.
     */
    public static Set<Map.Entry<Integer, Contato>> compararUsandoComparatorNoMetodo(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Utilizando a classe Comparator dentro do método: ");
        Set<Map.Entry<Integer, Contato>> set = new TreeSet<>(new Comparator<Map.Entry<Integer, Contato>>() {
            // Inserido o método da classe Comparator direto dentro da estrutura de dados
            @Override
            public int compare(Map.Entry<Integer, Contato> cont1, Map.Entry<Integer, Contato> cont2) {
                return Integer.compare(cont1.getValue().getNumero(), cont2.getValue().getNumero());
            }
        });
        return set;
    }

    /**
     * Cria um TreeSet de um Map (Conjunto de dicionários) vazio, sendo que a comparação entre os
     * elementos será realizada pelo uso de uma classe anônima.
     * 
     * @return TreeSet de um Map (Conjunto de dicionários) vazio.
     */
    public static Set<Map.Entry<Integer, Contato>> compararUsandoClasseAnonima(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Utilizando a classe anônima: ");
        Set<Map.Entry<Integer, Contato>> set = new TreeSet<>(Comparator.comparing(
                new Function<Map.Entry<Integer, Contato>, Integer>() {
                    @Override
                    public Integer apply(Map.Entry<Integer, Contato> cont) {
                        return cont.getValue().getNumero();
                    }
                }));
        return set;
    }

    /**
     * Cria um TreeSet de um Map (Conjunto de dicionários) vazio, sendo que a comparação entre os
     * elementos será realizada pelo uso de uma função Lambda.
     * 
     * @return TreeSet de um Map (Conjunto de dicionários) vazio.
     */
    public static Set<Map.Entry<Integer, Contato>> compararUsandoLambda(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Utilizando o Lambda: ");
        Set<Map.Entry<Integer, Contato>> set = new TreeSet<>(Comparator.comparing(
                cont -> cont.getValue().getNumero()));
        return set;
    }

}


// CLASSES EXTERNAS: Não foram utilizadas pois os métodos já foram implementados dentro dos métodos da classe anterior.

// /**
//  * Uma classe que implementa a interface Comparator para comparar pares chave-valor
//  * de um mapa onde os valores são objetos do tipo Contato, com base no número de telefone.
//  */
// class ComparatorOrdemNumeroTelefone implements Comparator<Map.Entry<Integer, Contato>> {
//     /**
//      * Compara dois pares chave-valor com base no número de telefone dos contatos.
//      *
//      * @param cont1 O primeiro par chave-valor a ser comparado.
//      * @param cont2 O segundo par chave-valor a ser comparado.
//      * @return Um valor negativo se o número de telefone de 'cont1' for menor que o de 'cont2',
//      *         um valor positivo se for maior e 0 se forem iguais.
//      */
//     @Override
//     public int compare(Map.Entry<Integer, Contato> cont1, Map.Entry<Integer, Contato> cont2) {
//         return Integer.compare(cont1.getValue().getNumero(), cont2.getValue().getNumero());
//     }
// }

// /**
//  * Uma classe que implementa a interface Comparator para comparar pares chave-valor
//  * de um mapa onde os valores são objetos do tipo Contato, com base no nome do contato.
//  */
// class ComparatorOrdemNomeContato implements Comparator<Map.Entry<Integer, Contato>> {
//     /**
//      * Compara dois pares chave-valor com base no nome dos contatos, ignorando diferenças de maiúsculas e minúsculas.
//      *
//      * @param cont1 O primeiro par chave-valor a ser comparado.
//      * @param cont2 O segundo par chave-valor a ser comparado.
//      * @return Um valor negativo se o nome de 'cont1' for alfabeticamente menor que o de 'cont2',
//      *         um valor positivo se for maior e 0 se forem iguais.
//      */
//     @Override
//     public int compare(Map.Entry<Integer, Contato> cont1, Map.Entry<Integer, Contato> cont2) {
//         return cont1.getValue().getNome().compareToIgnoreCase(cont2.getValue().getNome());
//     }
// }