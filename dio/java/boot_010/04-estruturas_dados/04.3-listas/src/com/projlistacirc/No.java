package com.projlistacirc;

public class No<T> {

    private T conteudo;                // Conteúdo do objeto
    private No<T> proximoNo;           // Referência na memória do objeto

    // Construtor
    public No(T conteudo){
        this.proximoNo = null;
        this.conteudo = conteudo;
    }

    // Métodos Getters e Setters
    public T getConteudo() {
        return conteudo;
    }

    public void setConteudo(T conteudo) {
        this.conteudo = conteudo;
    }

    public No<T> getProximoNo() {
        return proximoNo;
    }

    public void setProximoNo(No<T> proximoNo) {
        this.proximoNo = proximoNo;
    }    

    // Métodos toString
    @Override
    public String toString() {
        return "No [conteudo=" + conteudo + "]";
    }
}