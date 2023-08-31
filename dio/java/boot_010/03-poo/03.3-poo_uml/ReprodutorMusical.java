/**
 * Classe que representa um reprodutor musical.
 */
public class ReprodutorMusical {
    
    /**
     * Toca a música no reprodutor.
     */
    public void tocar(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método tocar");
        System.out.println("Tocando a música!");
    }

    /**
     * Pausa a música no reprodutor.
     */
    public void pausar(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método pausar");
        System.out.println("Pausando a música!");
    }

    /**
     * Seleciona uma música no reprodutor fornecendo esta música.
     * 
     * @param musica Música que deseja ser selecionada.
     */
    public void selecionarMusica(Musica musica){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método selecionarMusica");
        System.out.println("A música " + musica + " foi selecionada!");
    }
}