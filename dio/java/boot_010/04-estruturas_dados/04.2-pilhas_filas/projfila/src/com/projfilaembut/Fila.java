package com.projfilaembut;

public class Fila {
    
    private No refNoEntradaFila;  // Referência na memória

    // Construtor
    public Fila() {
        this.refNoEntradaFila = null;
    }

    // Métodos para manipucacao de filas
    public boolean isEmpty(){
        return refNoEntradaFila == null ? true : false;
    }

    public void enqueue(Object obj){
        No novoNo = new No(obj);
        novoNo.setRefNo(refNoEntradaFila);
        refNoEntradaFila = novoNo;
    }

    public Object first(){
        if(!this.isEmpty()){
            No primeiroNo = refNoEntradaFila;

            // Pecorrer o encadeamento da fila do nó de entrada até o primeiro
            while (true){
                if(primeiroNo.getRefNo() != null){
                    // Alterar para o nó imediatamente inferior
                    primeiroNo = primeiroNo.getRefNo();
                }else{
                    break;
                }
            }
            return primeiroNo.getObject();
        }
        return null;
    }

    public Objetct dequeue(){
        if(!this.isEmpty()){
            No primeiroNo = refNoEntradaFila;
            No noAuxiliar = refNoEntradaFila;
            while (true){
                if(primeiroNo.getRefNo() != null){
                    noAuxiliar = primeiroNo;
                    primeiroNo = primeiroNo.getRefNo();
                }else{
                    noAuxiliar.setRefNo(null);
                    break;
                }
            }
            return primeiroNo.getObject();
        }
        return null;
    }

    // Método toString para listar a fila criada
    @Override
    public String toString() {
        String stringRetorno = "";
        No noAuxiliar = refNoEntradaFila;

        if(refNoEntradaFila != null){
            while(true){
                stringRetorno += "[No{objeto=" + noAuxiliar.getObject() + "}]--->";
                if(noAuxiliar.getRefNo() != null){
                    noAuxiliar = noAuxiliar.getRefNo();
                }else{
                    stringRetorno += "null";
                    break;
                }
            }
        }else{
            stringRetorno = "null";
        }
        return stringRetorno;
    }
}