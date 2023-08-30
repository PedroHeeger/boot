package com.projfila;

public class Main {

    public static void main(String[] args) {
        
        Fila minhaFila = new Fila();
        
        // Executar o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        minhaFila.enqueue(new No(1));
        minhaFila.enqueue(new No(2));
        minhaFila.enqueue(new No(3));
        minhaFila.enqueue(new No(4));

        // Executar o método toString
        System.out.println(minhaFila);

        // Executar o método dequeue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Dequeue");
        System.out.println(minhaFila.dequeue());
        System.out.println(minhaFila);

        // Executar o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        minhaFila.enqueue(new No(99));
        System.out.println(minhaFila);

        // Executar o método first
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método First");
        System.out.println(minhaFila.first());

        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(minhaFila.isEmpty());
    }
}