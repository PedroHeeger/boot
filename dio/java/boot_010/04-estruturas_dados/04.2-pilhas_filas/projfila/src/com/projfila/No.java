package com.projfila;

public class No {

    private Object object;      // Conteúdo do objeto
    private No refNo;           // Refereência na memória do objeto

    // Construtor
    public No(Object object) {
        this.refNo = null;
        this.object = object;
    }

    // Métodos Getters e Setters
    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
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
        return "No [object=" + object + "]";
    }    
}