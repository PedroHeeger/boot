package com.fila;

/**
 * Classe principal que mostra o funcionamento de uma
 * estrutura de dados do tipo fila com execução dos seus
 * métodos.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo fila
     * adicionando os nós com seus respectivos conteúdos nesta fila e manipula
     * essa estrutura com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Fila----------");
        // Criando a estrutura de dados do tipo fila
        Fila fila = new Fila();
        
        // Executando o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        fila.enqueue(new No(1));
        fila.enqueue(new No(2));
        fila.enqueue(new No(3));
        fila.enqueue(new No(4));

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
        fila.enqueue(new No(99));
        System.out.println(fila);

        // Executando o método first
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método First");
        System.out.println(fila.first());

        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(fila.isEmpty());
    }
}