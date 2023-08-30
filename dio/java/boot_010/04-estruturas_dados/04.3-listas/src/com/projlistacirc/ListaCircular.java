package com.projlistaencad;

public class Main {

    public static void main(String[] args) {
        
        ListaCircular<String> listaCircular = new ListaCircular<>();

        // Executar o método toString
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método toString");
        System.out.println(listaCircular);

        // Executar o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaCircular.add("c0");
        listaCircular.add("c1");
        listaCircular.add("c2");
        System.out.println(listaCircular);

        // Executar o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        listaCircular.remove(0);
        System.out.println(listaCircular);

        // Executar o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaCircular.add("c2");
        System.out.println(listaCircular);

        // Executar o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listaCircular.get(0));
        System.out.println(listaCircular.get(1));
        System.out.println(listaCircular.get(2));  // A partir de agora, a lista vai repetir
        System.out.println(listaCircular.get(3));
        System.out.println(listaCircular.get(4));
        System.out.println(listaCircular.get(5));
        
        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listaCircular.isEmpty());
    }
}