package com.projpilha;

public class No {

    private int dado;         // Conteúdo do objeto
    private No refNo = null;  // Referência na memória do objeto

    // Construtor
    public No(int dado) {
        this.dado = dado;
    }

    // Métodos Getters e Setters
    public int getDado() {
        return dado;
    }

    public void setDado(int dado) {
        this.dado = dado;
    }

    public No getRefNo() {
        return refNo;
    }

    public void setRefNo(No refNo) {
        this.refNo = refNo;
    }

    // Método toString
    @Override
    public String toString() {
        return "No [dado=" + dado + "]";
    }    
}
