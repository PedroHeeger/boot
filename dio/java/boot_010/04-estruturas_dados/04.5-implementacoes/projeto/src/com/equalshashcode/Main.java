package com.equalshashcode;

import java.util.ArrayList;
import java.util.List;

/**
 * Classe principal que cria uma lista de carros e executa seus métodos
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo lista,
     * bem como os objetos de carro, adiciona esses objetos a lista, utiliza-se
     * métodos já existentes da lista e os métodos criados de equals e hashCode.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Metodo equals e hashCode----------");
        // Criando o objeto lista de carros
        List<Carro> listaCarros = new ArrayList<>();
        
        // Executando o método inserir
        System.out.println("-----//-----//-----//-----//-----//-----//-----");

        // Criando os objetos de carro
        Carro carro1 = new Carro("Ford");
        Carro carro2 = new Carro("Chevrolet");
        Carro carro3 = new Carro("Volskwagen");
        Carro carro4 = new Carro("Ford");

        // Adicionando os carros a lista
        listaCarros.add(carro1);
        listaCarros.add(carro2);
        listaCarros.add(carro3);

        // Verificando se um carro esta na lista
        System.out.println(listaCarros.contains(carro1));

        // Exibindo os hashCode dos objetos de carro
        System.out.println(carro1.hashCode());
        System.out.println(carro4.hashCode());
        System.out.println(carro2.hashCode());
        System.out.println(carro3.hashCode());

        // Verificando se um carro e igual ao outro
        System.out.println(carro1.equals(carro2));
        System.out.println(carro1.equals(carro4));
    }
}