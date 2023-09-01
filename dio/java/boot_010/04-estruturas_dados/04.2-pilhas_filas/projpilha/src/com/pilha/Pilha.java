package com.pilha;

/**
 * Classe que representa uma pilha (estrutura de dados).
 */
public class Pilha {
    private No refNoEntrada;

    /**
     * Construtor da classe Pilha.
     *
     * @param refNoEntrada Referência na memória do nó de entrada (inicializa como nula).
     */
    public Pilha() {
        this.refNoEntrada = null;
    }

    /**
     * Determina se a pilha está vazia ou não.
     *
     * @return Valor booleano indicando se a pilha está vazia ou não.
     */
    public boolean isEmpty(){
        return refNoEntrada == null ? true : false;
    }

    /**
     * Determina o último nó da pilha.
     *
     * @return Referência na memória do último nó de entrada.
     */
    public No top(){
        return refNoEntrada;
    }

    /**
     * Adiciona um novo nó a pilha passando a referência na
     * memória do nó de entrada para este novo nó.
     *
     * @param novoNo Novo nó que é adicionado no final da pilha.
     */
    public void push(No novoNo){
        No refAuxiliar = refNoEntrada;
        refNoEntrada = novoNo;
        refNoEntrada.setRefNo(refAuxiliar);
    }

    /**
     * Verifica se a pilha está vazia, se não estiver
     * extraí o último nó da pilha e passa a referência
     * na memória do nó de entrada para o próximo inferior.
     * Como o último o nó não é referenciado pelo nó anterior,
     * já que o nó anterior aponta para null, ele é excluído.
     *
     * @return Nó removido, se a pilha não estiver vazia. 
     * @return Null, se a pilha estiver vazia.
     */
    public No pop(){
        if(!this.isEmpty()){
            No noPoped = refNoEntrada;
            refNoEntrada = refNoEntrada.getRefNo();
            return noPoped;
        }
        return null;
    }

    /**
     * Retorna uma representação em formato de String da estrutura de dados pilha.
     *
     * @return Representação da estrutura de dados pilha em formato de String.
     */
    @Override
    public String toString() {
        String stringRetorno = "";
        No noAuxiliar = refNoEntrada;

        while (true){
            if(noAuxiliar != null){
                stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
                noAuxiliar = noAuxiliar.getRefNo();
            }else{
                break;
            }
        }
        stringRetorno += "null";
        return stringRetorno;
    }
}