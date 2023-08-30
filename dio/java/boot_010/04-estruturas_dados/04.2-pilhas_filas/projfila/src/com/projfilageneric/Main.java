package com.projfilageneric;

public class Main {

    public static void main(String[] args) {
        
        Fila<String> minhaFila = new Fila();
        
        // Executar o método enqueue
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Enqueue");
        minhaFila.enqueue("1");
        minhaFila.enqueue("2");
        minhaFila.enqueue("3");
        minhaFila.enqueue("4");

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
        minhaFila.enqueue("99");
        System.out.println(minhaFila);

        // Executar o método first
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método First");
        System.out.println(minhaFila.first());

        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Metodo isEmpty");
        System.out.println(minhaFila.isEmpty());
    }
}