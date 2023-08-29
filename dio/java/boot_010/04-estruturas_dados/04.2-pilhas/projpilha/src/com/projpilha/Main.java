package com.projpilha;

public class Main {

    public static void main(String[] args) {
        
        Pilha minhaPilha = new Pilha();
        
        // Executar o método push
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Push");
        minhaPilha.push(new No(1));
        minhaPilha.push(new No(2));
        minhaPilha.push(new No(3));
        minhaPilha.push(new No(4));
        minhaPilha.push(new No(5));
        minhaPilha.push(new No(6));

        // Executar o método toString
        System.out.println(minhaPilha);

        // Executar o método pop
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Pop");
        System.out.println(minhaPilha.pop());
        System.out.println(minhaPilha);

        // Executar o método push
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Push");
        minhaPilha.push(new No(99));
        System.out.println(minhaPilha);

        // Executar o método top
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Top");
        System.out.println(minhaPilha.top());

        // Executar o método isEmpty
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Metodo isEmpty");
        System.out.println(minhaPilha.isEmpty());
    }
}