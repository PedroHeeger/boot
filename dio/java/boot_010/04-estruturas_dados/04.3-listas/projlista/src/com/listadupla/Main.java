package com.listadupla;

/**
 * Classe principal que mostra o funcionamento de uma estrutura 
 * de dados genérica do tipo lista duplamente encadeada com execução
 * dos seus métodos e com a instaciação da classe No embutida na 
 * classe Fila.
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo lista 
     * duplamente encadeada, determinando seu tipo de dado e adicionando os nós com 
     * seus respectivos conteúdos dentro da classe Fila e manipula essa estrutura 
     * com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Lista Duplamente Encadeada----------");
        // Criando a estrutura de dados do tipo lista duplamente encadeada
        ListaDuplamenteEncadeada<String> listaDuplamenteEncadeada = new ListaDuplamenteEncadeada<>();
        
        // Executando o método add
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        listaDuplamenteEncadeada.add("teste1");
        listaDuplamenteEncadeada.add("teste2");
        listaDuplamenteEncadeada.add("teste3");
        listaDuplamenteEncadeada.add("teste4");
        listaDuplamenteEncadeada.add("teste5");

        // Executando o método toString
        System.out.println(listaDuplamenteEncadeada);

        // Executando o método remove
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        listaDuplamenteEncadeada.remove(3);
        System.out.println(listaDuplamenteEncadeada);

        // Executando o método add (index)
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add (index)");
        listaDuplamenteEncadeada.add(3, "teste99");
        System.out.println(listaDuplamenteEncadeada);

        // Executando o método get
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Get");
        System.out.println(listaDuplamenteEncadeada.get(0));
        System.out.println(listaDuplamenteEncadeada.get(1));
        System.out.println(listaDuplamenteEncadeada.get(2));
        System.out.println(listaDuplamenteEncadeada.get(3));
        
        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método isEmpty");
        System.out.println(listaDuplamenteEncadeada.isEmpty());
    }
}