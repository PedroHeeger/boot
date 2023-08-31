/**
 * Classe que representa uma classe para testes de POO.
 */
public class MinhaClasse {\

    /**
     * Ponto de entrada do programa.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {

        // Imprimindo informação:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Imprimindo informação:");
        System.out.println("Ola turma, sejam bem-vindos");

        // Declarando constantes:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Declarando constantes:");
        final String BR = "Brasil";
        System.out.println(BR);

        // Declarando variáveis:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Declarando variáveis:");
        int anoFabricacao = 2021;
        String meuNome = "Rafael";
        boolean verdadeira = false;
        System.out.println(anoFabricacao + "," + meuNome + "," + verdadeira);

        // Alterando o valor da variável:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Alterando o valor da variável:");
        anoFabricacao = 2022;
        System.out.println(anoFabricacao);

        // Declarando métodos:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Declarando métodos:");
        String primeiroNome = "Paulo";
        String segundoNome = "Sampaio";
        String nomeCompleto = nomeCompleto (primeiroNome, segundoNome);
        System.out.println(nomeCompleto);
    }

    /**
     * Concatena o primeiro e segundo nome de alguém.
     *
     * @param primeiroNome Primeiro nome de alguém.
     * @param segundoNome Segundo nome de alguém.
     * @return Nome completo de alguém.
     */
    public static String nomeCompleto (String primeiroNome, String segundoNome) {
        return primeiroNome.concat(" ").concat(segundoNome);
    }
}