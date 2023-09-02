package com.stack;

import java.util.Stack;

/**
 * Classe principal que cria uma stack (pilha) de carros e executa seus métodos.
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo pilha,
     * bem como os objetos de carro, e manipula essa estrutura.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Stack (Pilha)----------");
        // Criando o objeto stack de carros
        Stack<Carro> stackCarros = new Stack<>();
        // Criando os objetos de carro
        Carro carro1 = new Carro("Ford");
        Carro carro2 = new Carro("Chevrolet");
        Carro carro3 = new Carro("Volskwagen");
        Carro carro4 = new Carro("Fiat");
        
        // Adicionando os carros a stack
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Push");
        stackCarros.push(carro1);
        stackCarros.push(carro2);
        stackCarros.push(carro3);
        stackCarros.push(carro4);
        System.out.println(stackCarros);

        // Removendo os carros da stack
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Pop");
        System.out.println(stackCarros.pop());
        System.out.println(stackCarros);

        // Exibindo o último carro da stack
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Peek");
        System.out.println(stackCarros.peek());
        System.out.println(stackCarros);

        // Exibindo se a stack está vazia
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Empty");
        System.out.println(stackCarros.empty());
    }
}