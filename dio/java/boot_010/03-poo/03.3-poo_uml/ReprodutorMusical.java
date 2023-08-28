package desafio;

public class ReprodutorMusical {
    
    // Métodos
    public void tocar(){
        System.out.println("Tocando a música!");
    }

    public void pausar(){
        System.out.println("Pausando a música!");
    }

    public void selecionarMusica(Musica musica){
        System.out.println("A música " + musica + " foi selecionada!");
    }
}