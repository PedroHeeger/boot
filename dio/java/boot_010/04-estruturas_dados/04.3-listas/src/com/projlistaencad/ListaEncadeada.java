package com.projlistaencad;

public class ListaEncadeada<T> {
    
    No<T> referenciaEntrada;  // Referência na memória

    // Construtor
    public ListaEncadeada() {
        this.referenciaEntrada = null;
    }

    // Métodos para manipucação de listas encadeadas
    public boolean isEmpty(){
        return referenciaEntrada == null ? true : false;
    }

    public void add(T conteudo){
        No<T> novoNo = new No<>(conteudo);
        if(this.isEmpty()){
            referenciaEntrada = novoNo;
            return;
        }

        No<T> noAuxiliar = referenciaEntrada;
        for (int i = 0; i < this.size()-1; i++){
            noAuxiliar = noAuxiliar.getProximoNo();
        }
        noAuxiliar.setProximoNo(novoNo);
    }

    public T get(int index){
        return getNo(index).getConteudo();
    }

    public T remove(int index){
        No<T> noPivo = this.getNo(index);
        if(index == 0){
            referenciaEntrada = noPivo.getProximoNo();
            return noPivo.getConteudo();
        }
        No<T> noAnterior = getNo(index -1);
        noAnterior.setProximoNo(noPivo.getProximoNo());
        return noPivo.getConteudo();
    }

    // Métodos auxiliares
    private void validaIndice(int index){
        if(index >= size()){
            int ultimoIndice = size() - 1;
            throw new IndexOutOfBoundsException("Não existe conteúdo no índice " + index + " desta lista. Esta lista só vai até o índice " + ultimoIndice + " .");
        }
    }

    private No<T> getNo(int index){
        validaIndice(index);
        No<T> noAuxiliar = referenciaEntrada;
        No<T> noRetorno = noAuxiliar;

        for (int i = 0; i <= index; i++){
            noRetorno = noAuxiliar;
            noAuxiliar = noAuxiliar.getProximoNo();
        }
        return noRetorno;        
    }

    public int size(){
        int tamanhoLista = 0;
        No<T> referenciaAux = referenciaEntrada;
        while (true){
            if(referenciaAux != null){
                tamanhoLista++;
                if(referenciaAux.getProximoNo() != null){
                    referenciaAux = referenciaAux.getProximoNo();
                }else{
                    break;
                }
            }else{
                break;
            }
        }
        return tamanhoLista;
    }

    // Método toString para listar a lista encadeada criada
    @Override
    public String toString() {
        String stringRetorno = "";
        No<T> noAuxiliar = referenciaEntrada;

        for(int i = 0; i < this.size(); i++){
            stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
            noAuxiliar = noAuxiliar.getProximoNo();
        }
        stringRetorno += "null";
        return stringRetorno;
    }
}