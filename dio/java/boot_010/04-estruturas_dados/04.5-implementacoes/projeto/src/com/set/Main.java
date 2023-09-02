package com.set;

import java.util.Set;
import java.util.HashSet;
import java.util.TreeSet;

/**
 * Classe principal que cria uma set (conjunto) de carros e executa seus métodos.
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo conjunto,
     * bem como os objetos de carro, e manipula essa estrutura.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Set (Conjunto)----------");
        // Criando o objeto hashset de carros
        Set<Carro> hashSetCarros = new HashSet<>();
        // Criando os objetos de carro
        Carro carro1 = new Carro("Ford");
        Carro carro2 = new Carro("Chevrolet");
        Carro carro3 = new Carro("Volskwagen");
        Carro carro4 = new Carro("Fiat");
        Carro carro5 = new Carro("Peugeot");

        // Adicionando os carros a hashset
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add - HashSet");
        hashSetCarros.add(carro1);
        hashSetCarros.add(carro2);
        hashSetCarros.add(carro3);
        hashSetCarros.add(carro4);
        hashSetCarros.add(carro5);
        System.out.println(hashSetCarros);

        // Criando o objeto treeset de carros
        Set<Carro> treeSetCarros = new TreeSet<>();

        // Adicionando os carros a treeset
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add - TreeSet");
        treeSetCarros.add(carro1);
        treeSetCarros.add(carro2);
        treeSetCarros.add(carro3);
        treeSetCarros.add(carro4);
        treeSetCarros.add(carro5);
        System.out.println(treeSetCarros);
    }
}