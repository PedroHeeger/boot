package televisao.src;

/**
 * Classe que representa um usuário da smart TV.
 */
public class Usuario {

    /**
     * Ponto de entrada do programa. Permite a manipulação de uma smart TV.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) throws Exception {
        SmartTv smartTv = new SmartTv();

        // Imprimindo os status da TV
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Imprimindo Status da TV:");
        System.out.println("TV Ligada? " + smartTv.ligada);
        System.out.println("Canal Atual? " + smartTv.canal);
        System.out.println("Volume Atual? " + smartTv.volume);

        // Diminuindo e aumentando o volume da TV
        smartTv.diminuirVolume();
        smartTv.diminuirVolume();
        smartTv.diminuirVolume();
        smartTv.aumentarVolume();

        // Alterando o canal da TV para o canal determinado
        smartTv.mudarCanal(13);
        smartTv.aumentarCanal();
        smartTv.aumentarCanal();
        smartTv.diminuirCanal();

        // Ligando a TV
        smartTv.ligar();

        // Desligando a TV
        smartTv.desligar();

        // Imprimindo os status da TV
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Imprimindo Status da TV:");
        System.out.println("TV Ligada? " + smartTv.ligada);
        System.out.println("Canal Atual? " + smartTv.canal);
        System.out.println("Volume Atual? " + smartTv.volume);
    }
}