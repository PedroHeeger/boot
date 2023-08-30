package com.projlistaencad;

public class No<T> {

    private T conteudo;             // Conteúdo do objeto
    private No proximoNo;           // Referência na memória do objeto

    // Construtores - Criou três mais não teve problema
    public No() {
        this.proximoNo = null;
    }

    public No(T conteudo){
        this.proximoNo = null;
        this.conteudo = conteudo;
    }

    public No(T conteudo, No proximoNo) {
        this.conteudo = conteudo;
        this.proximoNo = proximoNo;
    }

    // Métodos Getters e Setters
    public T getConteudo() {
        return conteudo;
    }

    public void setConteudo(T conteudo) {
        this.conteudo = conteudo;
    }

    public No getProximoNo() {
        return proximoNo;
    }

    public void setProximoNo(No proximoNo) {
        this.proximoNo = proximoNo;
    }    

    // Métodos toString
    @Override
    public String toString() {
        return "No [conteudo=" + conteudo + "]";
    }

    public String toStringEncadeado(){
        String str = "No [conteudo=" + conteudo + "]";

        if(proximoNo != null){
            str += "->" + proximoNo.toString();
        }else{
            str += "->null";
        }
        return str;
    }
}