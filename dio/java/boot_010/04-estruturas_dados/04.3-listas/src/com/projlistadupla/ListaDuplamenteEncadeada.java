package com.projlistadupla;

public class ListaDuplamenteEncadeada<T> {
    
    private No<T> primeiroNo;  // Referência na memória
    private No<T> ultimoNo;    // Referência na memória
    private int tamanhoLista;

    // Construtor
    public ListaDuplamenteEncadeada() {
        this.primeiroNo = null;
        this.ultimoNo = null;
        this.tamanhoLista = 0;
    }

    // Métodos para manipucacao de listas encadeadas
    public boolean isEmpty(){
        return tamanhoLista == 0 ? true : false;
    }

    public T get(int index){
        return this.getNo(index).getConteudo();
    }
    
    // Criar um novo nó passando a referência do nó anterior e próximo nó
    public void add(T conteudo){
        No<T> novoNo = new No<>(conteudo);  
        novoNo.setProximoNo(null);
        novoNo.setNoPrevio(ultimoNo);
        if(primeiroNo == null){
            primeiroNo = novoNo;
        }
        if(ultimoNo != null){
            ultimoNo.setProximoNo(novoNo);
        }
        ultimoNo = novoNo;
        tamanhoLista++;
    }

    public void add(int index, T conteudo){
        No<T> noAuxilar = getNo(index);
        No<T> novoNo = new No<>(conteudo);
        novoNo.setProximoNo(noAuxilar);

        if(novoNo.getProximoNo() != null){
            novoNo.setNoPrevio(noAuxilar.getNoPrevio());
            novoNo.getProximoNo().setNoPrevio(novoNo);
        }else{
            novoNo.setNoPrevio(ultimoNo);
            ultimoNo = novoNo;
        }

        if(index == 0){
            primeiroNo = novoNo;
        }else{
            novoNo.getNoPrevio().setProximoNo(novoNo);
        }
        tamanhoLista++;
    }

    public void remove(int index){
        if(index == 0){
            primeiroNo = primeiroNo.getProximoNo();
            if(primeiroNo != null){
                primeiroNo.setNoPrevio(null);
            }
        }else{
            No<T> noAuxiliar = getNo(index);
            noAuxiliar.getNoPrevio().setProximoNo(noAuxiliar.getProximoNo());
            if(noAuxiliar != ultimoNo){
                noAuxiliar.getProximoNo().setNoPrevio(noAuxiliar.getNoPrevio());
            }else{
                ultimoNo = noAuxiliar;
            }
        }
        this.tamanhoLista--;
    }

    // Métodos auxiliares
    private void validaIndice(int index){
        if(index > size()+1){
            int ultimoIndice = size();
            throw new IndexOutOfBoundsException("Não existe conteúdo no índice " + index + " desta lista. Esta lista só vai até o índice " + ultimoIndice + " .");
        }
    }

    private No<T> getNo(int index){
        validaIndice(index);
        No<T> noAuxiliar = primeiroNo;

        for (int i = 0; (i < index) && (noAuxiliar != null); i++){
            noAuxiliar = noAuxiliar.getProximoNo();
        }
        return noAuxiliar;        
    }

    public int size(){
        return tamanhoLista;
    }

    // Método toString para listar a lista duplamente encadeada criada
    @Override
    public String toString() {
        String stringRetorno = "";
        No<T> noAuxiliar = primeiroNo;

        for(int i = 0; i < this.size(); i++){
            stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
            noAuxiliar = noAuxiliar.getProximoNo();
        }
        stringRetorno += "null";
        return stringRetorno;
    }
}