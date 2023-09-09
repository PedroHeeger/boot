package televisao.src;

/**
 * Classe que representa uma smart TV.
 */
public class SmartTv {
    boolean ligada=false;
    int canal=1;
    int volume=25;

    /**
     * Aumenta o canal da televisão para o próximo superior.
     */
    public void aumentarCanal(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método aumentarCanal:");
        canal++;
        System.out.println("Aumentando o canal para: " + canal);
    }

    /**
     * Diminui o canal da televisão para o próximo inferior.
     */
    public void diminuirCanal(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método diminuirCanal:");
        canal--;
        System.out.println("Diminuindo o canal para: " + canal);
    }

    /**
     * Altera o canal da televisão para o canal determinado.
     * 
     * @param novoCanal Canal ao qual se deseja acessar.
     */
    public void mudarCanal(int novoCanal){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método mudarCanal:");
        canal = novoCanal;
        System.out.println("Alterando o canal para: " + canal);
    }

    /**
     * Aumenta o volume da televisão para o próximo superior.
     */
    public void aumentarVolume(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método aumentarVolume:");
        volume++;
        System.out.println("Aumentando o volume para: " + volume);
    }

    /**
     * Diminui o canal da televisão para o próximo inferior.
     */
    public void diminuirVolume(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método diminuirVolume:");
        volume--;
        System.out.println("Diminuindo o volume para: " + volume);
    }

    /**
     * Liga a televisão.
     */
    public void ligar(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método ligar:");
        ligada=true;
        System.out.println("Ligando a TV");
    }

    /**
     * Desliga a televisão.
     */
    public void desligar(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método desligar:");
        ligada=false;
        System.out.println("Desligando a TV");
    }
}