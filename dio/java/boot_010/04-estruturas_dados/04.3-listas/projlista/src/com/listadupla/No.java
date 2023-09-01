package com.listadupla;

/**
 * Classe que representa um nó (elemento em estrutura de dados)
 * em uma estrutura de dados genérica.
 * 
 * @param <T> Tipo de dados que este nó pode armazenar.
 */
public class No<T> {
    private T conteudo;
    private No<T> refNoProximo;
    private No<T> refNoPrevio;

    /**
     * Construtor da classe No<T>.
     *
     * @param conteudo Conteúdo armazenado no nó.
     * @param refNoProximo Referência na memória do nó para o próximo nó.
     * @param refNoPrevio Referência na memória do nó para o nó anterior.
     */
    public No(T conteudo){
        this.conteudo = conteudo;
        this.refNoProximo = refNoProximo;
        this.refNoPrevio = refNoPrevio;
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
     * Obtém a referência na memória do nó para o próximo nó.
     *
     * @return Referência na memória do nó para o próximo nó.
     */
    public No<T> getRefNoProximo() {
        return refNoProximo;
    }

    /**
     * Define uma nova referência na memória do nó para o próximo nó.
     *
     * @param refNoProximo Nova referência na memória do nó para o próximo nó.
     */
    public void setRefNoProximo(No<T> refNoProximo) {
        this.refNoProximo = refNoProximo;
    }

    /**
     * Obtém a referência na memória do nó para o nó anterior.
     *
     * @return Referência na memória do nó para o nó anterior.
     */
    public No<T> getRefNoPrevio() {
        return refNoPrevio;
    }

    /**
     * Define uma nova referência na memória do nó para o nó anterior.
     *
     * @param refNoPrevio Nova referência na memória do nó para o nó anterior.
     */
    public void setRefNoPrevio(No<T> refNoPrevio) {
        this.refNoPrevio = refNoPrevio;
    }

    /**
     * Retorna uma representação em formato de String do conteúdo do nó.
     *
     * @return Representação do conteúdo do nó em formato de String.
     */
    @Override
    public String toString() {
        return "[No{conteudo=" + conteudo + "}]";
    }
}