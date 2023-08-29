package desafio;

public class Musica {
    private String titulo;
    private String artista;
    private int duracao;

    // Criar o construtor
    public Musica(String titulo, String artista, int duracao){
        this.titulo=titulo;
        this.artista=artista;
        this.duracao=duracao;
    }
    
    // Método específico para retornar as informações da música
    @Override
    public String toString() {
        return titulo + " - " + artista + " (" + duracao + " segundos)";
    }
}