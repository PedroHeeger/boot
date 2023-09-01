package com.projatribuicao;

/**
 * Classe principal que mostra a diferença das atribuições
 * entre os tipos primitivos e os objetos.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria instâncias da classe MeuObj, realiza
     * atribuições de tipos primitivos a variáveis e de objetos a variáveis.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        
        // Atribuição aos tipos primitivos
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Atribuição aos tipos primitivos");
        int intA = 1;
        int intB = intA;
        System.out.println("intA=" + intA + " intB=" + intB);

        intA = 2;
        System.out.println("intA=" + intA + " intB=" + intB);

        // Atribuição aos objetos
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Atribuição aos objetos");
        MeuObj objA = new MeuObj(1);
        MeuObj objB = objA;
        System.out.println("objA=" + objA + " objB=" + objB);

        objA.setNum(2);
        System.out.println("objA=" + objA + " objB=" + objB);
    }
}