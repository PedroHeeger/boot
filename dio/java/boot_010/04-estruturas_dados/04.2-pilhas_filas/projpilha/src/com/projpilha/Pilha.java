package com.projpilha;

public class Pilha {
    
    private No refNoEntradaPilha;  // Referência na memória

    // Construtor
    public Pilha() {
        this.refNoEntradaPilha = null;
    }

    // Métodos para manipu;acao de pilhas
    public boolean isEmpty(){
        return refNoEntradaPilha == null ? true : false;
    }

    public No top(){
        return refNoEntradaPilha;
    }

    public void push(No novoNo){
        No refAuxiliar = refNoEntradaPilha;
        refNoEntradaPilha = novoNo;
        refNoEntradaPilha.setRefNo(refAuxiliar);
    }

    public No pop(){
        if(!this.isEmpty()){
            No noPoped = refNoEntradaPilha;
            refNoEntradaPilha = refNoEntradaPilha.getRefNo();
        }
        return null;
    }

    // Método toString para listar a pilha criada
    @Override
    public String toString() {
        String stringRetorno = "----------\n";
        stringRetorno += "        Pilha\n";
        stringRetorno += "----------\n";

        No noAuxiliar = refNoEntradaPilha;

        while (true){
            if(noAuxiliar != null){
                stringRetorno += "[No{dado=" + noAuxiliar.getDado() + "}]\n";
                noAuxiliar = noAuxiliar.getRefNo();
            }else{
                break;
            }
        }

        stringRetorno += "----------\n";
        return stringRetorno;
    }
}