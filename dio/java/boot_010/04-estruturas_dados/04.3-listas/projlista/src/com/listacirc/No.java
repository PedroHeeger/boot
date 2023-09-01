package com.listacirc;

/**
 * Classe que representa um nó (elemento em estrutura de dados)
 * em uma estrutura de dados genérica.
 * 
 * @param <T> Tipo de dados que este nó pode armazenar.
 */
public class No<T> {
    private T conteudo;
    private No<T> refNo;

    /**
     * Construtor da classe No<T>.
     *
     * @param conteudo Conteúdo armazenado no nó.
     * @param refNo Referência na memória do nó.
     */
    public No(T conteudo){
        this.conteudo = conteudo;
        this.refNo = null;
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
     * Obtém a referência na memória do nó.
     *
     * @return Referência na memória do nó.
     */
    public No<T> getRefNo() {
        return refNo;
    }

    /**
     * Define uma nova referência na memória do nó.
     *
     * @param refNo Nova referência na memória do nó.
     */
    public void setRefNo(No<T> refNo) {
        this.refNo = refNo;
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