package com.projlistadupla;

public class No<T> {

    private T conteudo;             // Conteúdo do objeto
    private No<T> proximoNo;        // Referência na memória do objeto
    private No<T> noPrevio;         // Referência na memória do objeto

    // Construtor
    public No(T conteudo){
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

    public No<T> getNoPrevio() {
        return noPrevio;
    }

    public void setNoPrevio(No<T> noPrevio) {
        this.noPrevio = noPrevio;
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