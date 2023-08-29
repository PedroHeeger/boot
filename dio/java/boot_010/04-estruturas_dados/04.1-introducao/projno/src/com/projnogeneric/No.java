package com.projnogeneric;

public class No<T> {

    private T conteudo;
    private No<T> proximoNo;

    // Construtor
    public No(T conteudo) {
        this.conteudo = conteudo;
        this.proximoNo = null;
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

    // Método toString
    @Override
    public String toString() {
        return "No {conteudo='" + conteudo + "'}";
    }    
}