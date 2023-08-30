package com.projfilageneric;

public class No<T> {

    private Object object;          // Conteúdo do objeto
    private No<T> refNo;           // Referência na memória do objeto

    // Construtor
    public No(T object) {
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