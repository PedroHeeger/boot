package com.fila;

/**
 * Classe que representa um nó (elemento em estrutura de dados).
 */
public class No {
    private Object conteudo;
    private No refNo;

    /**
     * Construtor da classe No.
     *
     * @param conteudo Conteúdo armazenado no nó.
     * @param refNo Referência na memória do nó (inicializa como nula).
     */
    public No(Object conteudo) {
        this.conteudo = conteudo;
        this.refNo = null;
    }

    /**
     * Obtém o conteúdo armazenado no nó.
     *
     * @return Conteúdo armazenado no nó.
     */
    public Object getConteudo() {
        return conteudo;
    }

    /**
     * Define um novo conteúdo armazenado no nó.
     *
     * @param conteudo Novo conteúdo armazenado no nó.
     */
    public void setConteudo(Object conteudo) {
        this.conteudo = conteudo;
    }

    /**
     * Obtém a referência na memória do nó.
     *
     * @return Referência na memória do nó.
     */
    public No getRefNo() {
        return refNo;
    }

    /**
     * Define uma nova referência na memória do nó.
     *
     * @param refNo Nova referência na memória do nó.
     */
    public void setRefNo(No refNo) {
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