/**
 * Classe que representa uma música.
 */
public class Musica {
    private String titulo;
    private String artista;
    private int duracao;

    /**
     * Construtor da classe Musica.
     *
     * @param titulo Título da música.
     * @param artista Artista da música.
     * @param duracao Duração da música.
     */
    public Musica(String titulo, String artista, int duracao){
        this.titulo=titulo;
        this.artista=artista;
        this.duracao=duracao;
    }
    
    /**
     * Retorna uma representação em formato de String das informações da música.
     *
     * @return Representação das informações da música em formato de String.
     */
    @Override
    public String toString() {
        return titulo + " - " + artista + " (" + duracao + " segundos)";
    }
}