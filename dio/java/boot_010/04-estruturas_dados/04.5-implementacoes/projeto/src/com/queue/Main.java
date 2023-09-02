package com.queue;

import java.util.LinkedList;
import java.util.Queue;

/**
 * Classe principal que cria uma queue (fila) de carros e executa seus métodos.
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo fila,
     * bem como os objetos de carro, e manipula essa estrutura.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Queue (Fila)----------");
        // Criando o objeto queue de carros
        Queue<Carro> queueCarros = new LinkedList<Carro>();
        // Criando os objetos de carro
        Carro carro1 = new Carro("Ford");
        Carro carro2 = new Carro("Chevrolet");
        Carro carro3 = new Carro("Volskwagen");
        Carro carro4 = new Carro("Fiat");
        Carro carro5 = new Carro("Peugeot");
        
        // Adicionando os carros a queue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        queueCarros.add(carro1);
        queueCarros.add(carro2);
        queueCarros.add(carro3);
        queueCarros.add(carro4);
        System.out.println(queueCarros);

        // Adicionando o carro a queue, caso não consiga adicionar retorna falso
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Offer");
        System.out.println(queueCarros.offer(carro5));
        System.out.println(queueCarros);

        // Exibindo o primeiro carro da queue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Peek");
        System.out.println(queueCarros.peek());
        System.out.println(queueCarros);

        // Removendo o primeir carro da queue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Poll");
        System.out.println(queueCarros.poll());
        System.out.println(queueCarros);

        // Removendo o primeir carro da queue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        System.out.println(queueCarros.remove());
        System.out.println(queueCarros);

        // Exibindo se a queue está vazia
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(queueCarros.isEmpty());
    }
}