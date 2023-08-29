package com.projnogeneric;

public class Main {

    public static void main(String[] args) {
        
        No<String> no1 = new No<String>("Conteudo no1");
        No<String> no2 = new No<String>("Conteudo no2");

        no1.setProximoNo(no2);

        No<String> no3 = new No<String>("Conteudo no3");
        no2.setProximoNo(no3);

        No<String> no4 = new No<String>("Conteudo no4");
        no3.setProximoNo(no4);

        // Resultado: no1 -> no2 -> no3 -> no4 -> null

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println(no1);
        System.out.println(no1.getProximoNo());
        System.out.println(no2);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println(no1);
        System.out.println(no1.getProximoNo());
        System.out.println(no1.getProximoNo().getProximoNo());
        System.out.println(no1.getProximoNo().getProximoNo().getProximoNo());
        System.out.println(no1.getProximoNo().getProximoNo().getProximoNo().getProximoNo());
    }
}