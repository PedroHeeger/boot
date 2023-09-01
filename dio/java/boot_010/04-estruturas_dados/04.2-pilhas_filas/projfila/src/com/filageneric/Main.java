package com.filageneric;

/**
 * Classe principal que mostra o funcionamento de uma
 * estrutura de dados genérica do tipo fila com execução dos seus
 * métodos e com a instaciação da classe No embutida na classe
 * Fila.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo fila, 
     * determinando seu tipo de dado e adicionando os nós com seus respectivos 
     * conteúdos dentro da classe Fila e manipula essa estrutura com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Fila----------");
        // Criando a estrutura de dados do tipo fila
        Fila<String> fila = new Fila();
        
        // Executando o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        fila.enqueue("1");
        fila.enqueue("2");
        fila.enqueue("3");
        fila.enqueue("4");

        // Executando o método toString
        System.out.println(fila);

        // Executando o método dequeue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Dequeue");
        System.out.println(fila.dequeue());
        System.out.println(fila);

        // Executando o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        fila.enqueue("99");
        System.out.println(fila);

        // Executando o método first
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método First");
        System.out.println(fila.first());

        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Metodo isEmpty");
        System.out.println(fila.isEmpty());
    }
}