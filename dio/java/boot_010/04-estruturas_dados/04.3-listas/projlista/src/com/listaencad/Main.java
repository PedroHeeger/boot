package com.listaencad;

/**
 * Classe principal que mostra o funcionamento de uma estrutura 
 * de dados genérica do tipo lista encadeada com execução dos seus
 * métodos e com a instaciação da classe No embutida na classe
 * Fila.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo lista encadeada, 
     * determinando seu tipo de dado e adicionando os nós com seus respectivos 
     * conteúdos dentro da classe Fila e manipula essa estrutura com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Lista Encadeada----------");
        // Criando a estrutura de dados do tipo lista encadeada
        ListaEncadeada<String> listaEncadeada = new ListaEncadeada<>();
        
        // Executando o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaEncadeada.add("teste1");
        listaEncadeada.add("teste2");
        listaEncadeada.add("teste3");
        listaEncadeada.add("teste4");

        // Executando o método toString
        System.out.println(listaEncadeada);

        // Executando o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        System.out.println(listaEncadeada.remove(1));
        System.out.println(listaEncadeada);

        // Executando o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaEncadeada.add("teste99");
        System.out.println(listaEncadeada);

        // Executando o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listaEncadeada.get(0));
        System.out.println(listaEncadeada.get(1));
        System.out.println(listaEncadeada.get(2));
        System.out.println(listaEncadeada.get(3));
        
        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listaEncadeada.isEmpty());
    }
}