package com.projlistaencad;

public class Main {

    public static void main(String[] args) {
        
        ListaEncadeada<String> minhaListaEncadeada = new ListaEncadeada<>();
        
        // Executar o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        minhaListaEncadeada.add("teste1");
        minhaListaEncadeada.add("teste2");
        minhaListaEncadeada.add("teste3");
        minhaListaEncadeada.add("teste4");

        // Executar o método toString
        System.out.println(minhaListaEncadeada);

        // Executar o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        System.out.println(minhaListaEncadeada.remove(1));
        System.out.println(minhaListaEncadeada);

        // Executar o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        minhaListaEncadeada.add("teste99");
        System.out.println(minhaListaEncadeada);

        // Executar o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(minhaListaEncadeada.get(0));
        System.out.println(minhaListaEncadeada.get(1));
        System.out.println(minhaListaEncadeada.get(2));
        System.out.println(minhaListaEncadeada.get(3));
        
        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(minhaListaEncadeada.isEmpty());
    }
}