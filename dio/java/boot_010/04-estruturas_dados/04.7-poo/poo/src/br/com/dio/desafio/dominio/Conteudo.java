package br.com.dio.desafio.dominio;

/**
 * Classe abstrata que representa um conteúdo.
 */
public abstract class Conteudo {
    protected static final Double XP_PADRAO = 10d;
    private String titulo;
    private String descricao;

    /**
     * Construtor da classe Conteudo.
     */
    public Conteudo() {

    }

    /**
     * Calcula o XP obtido ao realizar o conteúdo. É um método abstrato
     * e deve ser implementado pelas classes derivadas dessa.
     */
    public abstract double calcularXp();

    /**
     * Obtém o título do conteúdo.
     *
     * @return Título do conteúdo.
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * Define um novo título do conteúdo.
     *
     * @param titulo Novo título do conteúdo.
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * Obtém a descrição do conteúdo.
     *
     * @return Descrição do conteúdo.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * Define uma nova descrição do conteúdo.
     *
     * @param descricao Nova descrição do conteúdo.
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
