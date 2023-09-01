package com.listacirc;

/**
 * Classe principal que mostra o funcionamento de uma estrutura 
 * de dados genérica do tipo lista circular com execução dos seus
 * métodos e com a instaciação da classe No embutida na classe
 * Fila.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo lista circular, 
     * determinando seu tipo de dado e adicionando os nós com seus respectivos 
     * conteúdos dentro da classe Fila e manipula essa estrutura com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Lista Circular----------");
        // Criando a estrutura de dados do tipo lista circular
        ListaCircular<String> listaCircular = new ListaCircular<>();
        
        // Executando o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaCircular.add("teste1");
        listaCircular.add("teste2");
        listaCircular.add("teste3");
        listaCircular.add("teste4");

        // Executando o método toString
        System.out.println(listaCircular);

        // Executando o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        listaCircular.remove(1);
        System.out.println(listaCircular);

        // Executando o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaCircular.add("teste99");
        System.out.println(listaCircular);

        // Executando o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listaCircular.get(0));
        System.out.println(listaCircular.get(1));
        System.out.println(listaCircular.get(2));
        System.out.println(listaCircular.get(3));
        
        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listaCircular.isEmpty());
    }
}