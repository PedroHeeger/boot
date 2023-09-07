package com.list;

import java.util.List;
import java.util.ArrayList;

/**
 * Classe principal que cria uma list (lista) de carros e executa seus métodos.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo lista,
     * bem como os objetos de carro, e manipula essa estrutura.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados List (Lista)----------");
        // Criando o objeto list de carros
        List<Carro> listCarros = new ArrayList<>();
        // Criando os objetos de carro
        Carro carro1 = new Carro("Ford");
        Carro carro2 = new Carro("Chevrolet");
        Carro carro3 = new Carro("Volskwagen");
        Carro carro4 = new Carro("Fiat");
        Carro carro5 = new Carro("Peugeot");
        
        // Adicionando os carros a lista
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listCarros.add(carro1);
        listCarros.add(carro2);
        listCarros.add(carro3);
        listCarros.add(carro4);
        listCarros.add(carro5);
        System.out.println(listCarros);

        // Verifica se um carro contém na lista
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Contains");
        System.out.println(listCarros.contains(carro3));

        // Exibindo o carro que está no índice 2
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listCarros.get(2));

        // Exibindo em qual índice está o carro procurado
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método indexOf");
        System.out.println(listCarros.indexOf(carro4));

        // Removendo carro da lista pelo índice
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        System.out.println(listCarros.remove(2));
        System.out.println(listCarros);

        // Exibindo se a lista está vazia
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listCarros.isEmpty());
    }
}