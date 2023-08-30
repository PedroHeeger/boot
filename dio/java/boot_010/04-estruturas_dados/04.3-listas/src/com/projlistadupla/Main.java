package com.projlistadupla;

public class Main {

    public static void main(String[] args) {
        
        ListaDuplamenteEncadeada<String> listaDuplamenteEncadeada = new ListaDuplamenteEncadeada<>();
        
        // Executar o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaDuplamenteEncadeada.add("c1");
        listaDuplamenteEncadeada.add("c2");
        listaDuplamenteEncadeada.add("c3");
        listaDuplamenteEncadeada.add("c4");
        listaDuplamenteEncadeada.add("c5");
        listaDuplamenteEncadeada.add("c6");
        listaDuplamenteEncadeada.add("c7");

        // Executar o método toString
        System.out.println(listaDuplamenteEncadeada);

        // Executar o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        listaDuplamenteEncadeada.remove(3);
        System.out.println(listaDuplamenteEncadeada);

        // Executar o método add (index)
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add (index)");
        listaDuplamenteEncadeada.add(3, "c99");
        System.out.println(listaDuplamenteEncadeada);

        // Executar o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listaDuplamenteEncadeada.get(0));
        System.out.println(listaDuplamenteEncadeada.get(1));
        System.out.println(listaDuplamenteEncadeada.get(2));
        System.out.println(listaDuplamenteEncadeada.get(3));
        System.out.println(listaDuplamenteEncadeada.get(4));
        System.out.println(listaDuplamenteEncadeada.get(5));
        System.out.println(listaDuplamenteEncadeada.get(6));
        
        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listaDuplamenteEncadeada.isEmpty());
    }
}