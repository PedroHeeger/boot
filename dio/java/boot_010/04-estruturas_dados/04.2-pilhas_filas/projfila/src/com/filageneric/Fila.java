package com.filageneric;

/**
 * Classe que representa uma fila (estrutura de dados) genérica.
 * 
 * @param <T> Tipo de dados que esta fila pode armazenar.
 */
public class Fila<T> {
    private No<T> refNoEntradaFila;  // Referência na memória

    /**
     * Construtor da classe Fila<T>.
     *
     * @param refNoEntrada Referência na memória do nó de entrada (inicializa como nula).
     */
    public Fila() {
        this.refNoEntradaFila = null;
    }

    /**
     * Determina se a fila está vazia ou não.
     *
     * @return Valor booleano indicando se a fila está vazia ou não.
     */
    public boolean isEmpty(){
        return refNoEntradaFila == null ? true : false;
    }

    /**
     * Verifica se a fila está vazia, se não estiver pecorre o 
     * encadeamento da fila do último até chegar no primeiro nó.
     *
     * @return Primeiro nó.
     * @return Null, se a fila estiver vazia.
     */
    public T first(){
        if(!this.isEmpty()){
            No primeiroNo = refNoEntradaFila;

            // Pecorrendo o encadeamento da fila do nó de entrada até o primeiro nó
            while (true){
                if(primeiroNo.getRefNo() != null){
                    // Alterando para o nó imediatamente inferior
                    primeiroNo = primeiroNo.getRefNo();
                }else{
                    break;
                }
            }
            return (T) primeiroNo.toString();
        }
        return null;
    }

    /**
     * Adiciona um novo nó a fila passando a referência na
     * memória do nó de entrada para este novo nó e armazenando
     * a nova referência de entrada que é este novo nó.
     *
     * @param conteudo Conteúdo do novo nó que é adicionado no final da fila.
     */
    public void enqueue(T conteudo){
        No novoNo = new No(conteudo);
        novoNo.setRefNo(refNoEntradaFila);
        refNoEntradaFila = novoNo;
    }

    /**
     * Verifica se a fila está vazia, se não estiver
     * extraí o último nó da fila armazenando em duas variáveis.
     * Em seguida, percorre a fila, verificando se o existe
     * um próximo nó na fila após o nó atual, se existir
     * significa que o nó atual não é o primeiro elemento da
     * fila, e então passa para o próximo nó, armazenando o nó 
     * atual como nó auxiliar, até chegar no nó que é o primeiro 
     * da fila (cujo próximo nó é null). Assim, quando alcança
     * o primeir nó da fila, o nó auxiliar é o segundo e nele
     * é definido a referência na memória para o próximo nó
     * como null, desvinculando o primeiro nó da fila, sendo assim
     * removido da estrutura.
     *
     * @return Conteúdo do nó removido, se a fila não estiver vazia. 
     * @return Null, se a fila estiver vazia.
     */
    public T dequeue(){
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
            return (T) primeiroNo.getConteudo();
        }
        return null;
    }

    /**
     * Retorna uma representação em formato de String da estrutura de dados fila.
     *
     * @return Representação da estrutura de dados fila em formato de String.
     */
    @Override
    public String toString() {
        String stringRetorno = "";
        No noAuxiliar = refNoEntradaFila;

        // Verificando se a fila é vazia ou não
        if(refNoEntradaFila != null){
            while(true){
                stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
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