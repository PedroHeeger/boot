package com.no;

/**
 * Classe principal que mostra o funcionamento do encadeamento
 * de nó em uma estrutura de dados.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria os nós com seus respectivos conteúdos e
     * define a referência na memória do nó atual apontando para o próximo nó.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        // Criando as instâncias da classe No e definindo a referência na memória do nó atual para o próximo nó
        No no1 = new No("No1");
        No no2 = new No("No2");
        no1.setRefNo(no2);

        No no3 = new No("No3");
        no2.setRefNo(no3);

        No no4 = new No("No4");
        no3.setRefNo(no4);

        // Exibindo a referência na memória do primeiro nó para o próximo nó que é igual ao conteúdo do segundo nó
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo a referência na memória do primeiro nó para o próximo nó que é igual ao conteúdo do segundo nó");
        System.out.println("No1-Conteúdo: " + no1);
        System.out.println("No1-Ref para o No2: " + no1.getRefNo());
        System.out.println("No2-Conteúdo: " + no2);

        // Imprimindo o encadeamento de nó a partir do primeiro nó
        // Resultado: no1 -> no2 -> no3 -> no4 -> null
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Imprimindo o encadeamento de nó a partir do primeiro nó");
        System.out.println(no1);
        System.out.println(no1.getRefNo());
        System.out.println(no1.getRefNo().getRefNo());
        System.out.println(no1.getRefNo().getRefNo().getRefNo());
        System.out.println(no1.getRefNo().getRefNo().getRefNo().getRefNo());
    }
}