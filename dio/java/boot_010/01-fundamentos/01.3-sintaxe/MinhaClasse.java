public class MinhaClasse {
    public static void main(String[] args) {

        // Imprimindo informação:
        System.out.println("Imprimindo informação:");
        System.out.println("Ola turma, sejam bem-vindos");

        // Declarando Constantes:
        System.out.println("Declarando Constantes:");
        final String BR = "Brasil";
        System.out.println(BR);

        // Declarando Variáveis:
        System.out.println("Declarando Variáveis:");
        int anoFabricacao = 2021;
        String meuNome = "Rafael";
        boolean verdadeira = false;
        System.out.println(anoFabricacao + "," + meuNome + "," + verdadeira);

        // Alterando o valor da variável:
        System.out.println("Alterando o valor da variável:");
        anoFabricacao = 2022;
        System.out.println(anoFabricacao);

        // Declarando métodos:
        System.out.println("Declarando métodos:");
        String primeiroNome = "Paulo";
        String segundoNome = "Sampaio";
        String nomeCompleto = nomeCompleto (primeiroNome, segundoNome);
        System.out.println(nomeCompleto);
    }

    // Declarando métodos:
    public static String nomeCompleto (String primeiroNome, String segundoNome) {
        return primeiroNome.concat(" ").concat(segundoNome);
    }
}