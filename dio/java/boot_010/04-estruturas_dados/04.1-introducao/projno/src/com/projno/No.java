package com.projno;

public class No {

    private String conteudo;
    private No proximoNo;

    // Construtor
    public No(String conteudo) {
        this.conteudo = conteudo;
        this.proximoNo = null;
    }

    // Métodos Getters e Setters
    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }

    public No getProximoNo() {
        return proximoNo;
    }

    public void setProximoNo(No proximoNo) {
        this.proximoNo = proximoNo;
    }

    // Método toString
    @Override
    public String toString() {
        return "No {conteudo='" + conteudo + "'}";
    }
}