package com.pilha;

/**
 * Classe principal que mostra o funcionamento de uma
 * estrutura de dados do tipo pilha com execução dos seus
 * métodos.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo pilha
     * adicionando os nós com seus respectivos conteúdos nesta pilha e manipula
     * essa estrutura com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Pilha----------");
        // Criando a estrutura de dados do tipo pilha
        Pilha pilha = new Pilha();
        
        // Executando o método push
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Push");
        pilha.push(new No(1));
        pilha.push(new No(2));
        pilha.push(new No(3));
        pilha.push(new No(4));
        pilha.push(new No(5));
        pilha.push(new No(6));

        // Executando o método toString
        System.out.println(pilha);

        // Executando o método pop
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Pop");
        System.out.println(pilha.pop());
        System.out.println(pilha);

        // Executando o método push
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Push");
        pilha.push(new No(99));
        System.out.println(pilha);

        // Executando o método top
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Top");
        System.out.println(pilha.top());

        // Executando o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Metodo isEmpty");
        System.out.println(pilha.isEmpty());
    }
}