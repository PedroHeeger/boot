package com.arvore;

/**
 * Classe que representa um nó (elemento em estrutura de dados)
 * em uma estrutura de dados genérica.
 * 
 * @param <T> Tipo de dados que este nó pode armazenar.
 */
public class BinNo<T extends Comparable<T>> {
    private T conteudo;
    private BinNo<T> noEsq;
    private BinNo<T> noDir;

    /**
     * Construtor da classe No<T>.
     *
     * @param conteudo Conteúdo armazenado no nó.
     * @param noEsq Referência na memória do nó à esquerda.
     * @param noDir Referência na memória do nó à direita.
     */
    public BinNo(T conteudo){
        this.conteudo = conteudo;
        this.noEsq = this.noDir = null;
    }

    /**
     * Obtém o conteúdo armazenado no nó.
     *
     * @return Conteúdo armazenado no nó.
     */
    public T getConteudo() {
        return conteudo;
    }

    /**
     * Define um novo conteúdo armazenado no nó.
     *
     * @param conteudo Novo conteúdo armazenado no nó.
     */
    public void setConteudo(T conteudo) {
        this.conteudo = conteudo;
    }

    /**
     * Obtém a referência na memória do nó à esquerda.
     *
     * @return Referência na memória do nó à esquerda.
     */
    public BinNo<T> getNoEsq() {
        return noEsq;
    }

    /**
     * Define uma nova referência na memória do nó à esquerda.
     *
     * @param noEsq Nova referência na memória do nó à esquerda.
     */
    public void setNoEsq(BinNo<T> noEsq) {
        this.noEsq = noEsq;
    }

    /**
     * Obtém a referência na memória do nó à direita.
     *
     * @return Referência na memória do nó à direita.
     */
    public BinNo<T> getNoDir() {
        return noDir;
    }

    /**
     * Define uma nova referência na memória do nó à direita.
     *
     * @param noDir Nova referência na memória do nó à direita.
     */
    public void setNoDir(BinNo<T> noDir) {
        this.noDir = noDir;
    }

    /**
     * Retorna uma representação em formato de String do conteúdo do nó.
     *
     * @return Representação do conteúdo do nó em formato de String.
     */
    @Override
    public String toString() {
        return "[BinNo{conteudo=" + conteudo + "}]";
    }
}