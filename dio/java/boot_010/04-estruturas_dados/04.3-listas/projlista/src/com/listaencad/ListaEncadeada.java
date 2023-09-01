package com.listaencad;

/**
 * Classe que representa uma lista encadeada (estrutura de dados) genérica.
 * 
 * @param <T> Tipo de dados que esta lista pode armazenar.
 */
public class ListaEncadeada<T> {
    No<T> refNoEntrada;

    /**
     * Construtor da classe ListaEncadeada<T>.
     *
     * @param refNoEntrada Referência na memória do nó de entrada (inicializa como nula).
     */
    public ListaEncadeada() {
        this.refNoEntrada = null;
    }

    /**
     * Determina se a lista está vazia ou não.
     *
     * @return Valor booleano indicando se a lista está vazia ou não.
     */
    public boolean isEmpty(){
        return refNoEntrada == null ? true : false;
    }

    /**
     * Extraí o conteúdo do nó procurado.
     *
     * @param index Índice do nó procurado.
     * @return Conteúdo do nó procurado.
     */
    public T get(int index){
        return this.getNo(index).getConteudo();
    }

    /**
     * Adiciona um novo nó a lista e verifica se a lista está vazia,
     * caso esteja, a referência na memória do nó de entrada altera
     * para este novo nó. Caso não esteja, percorre até o último nó da
     * lista e define a referência na memória deste nó para o novo nó criado.
     * Este novo nó já é instanciado apontando para null.
     *
     * @param conteudo Conteúdo do novo nó que é adicionado no final da lista.
     */
    public void add(T conteudo){
        No<T> novoNo = new No<>(conteudo);
        if(this.isEmpty()){
            refNoEntrada = novoNo;
            return;
        }

        // Percorrendo a lista até o último nó
        No<T> noAuxiliar = refNoEntrada;
        for (int i = 0; i < this.size()-1; i++){
            noAuxiliar = noAuxiliar.getRefNo();
        }
        noAuxiliar.setRefNo(novoNo);
    }

    /**
     * Extraí o nó correspondente ao índice determinado, verifica
     * se este índice é zero, ou seja, o primeiro nó da lista, 
     * se for, passa a referência na memória do nó de entrada para o
     * próximo nó após o primeiro nó e retorna o conteúdo desse nó, pois ele 
     * que será o excluído já que ele não é mais referênciado pelo segundo nó.
     * Caso não seja o primeiro nó da lista, extraí o nó do índice anterior
     * a este nó e armazena em nó anterior, definindo a referência deste nó
     * anterior para o nó posterior ao atual, assim o nó atual fica sem ser
     * referenciado e é removido da lista.
     *
     * @param index Índice do nó a ser removido.
     * @return Conteúdo do nó removido, se for o primeiro nó da fila. 
     * @return Conteúdo do nó removido, se for qualquer outro nó da fila.
     */
    public T remove(int index){
        No<T> noPivo = this.getNo(index);
        if(index == 0){
            refNoEntrada = noPivo.getRefNo();
            return noPivo.getConteudo();
        }
        No<T> noAnterior = getNo(index -1);
        noAnterior.setRefNo(noPivo.getRefNo());
        return noPivo.getConteudo();
    }

    /**
     * Verifica se o índice determinado é maior ou igual
     * ao tamanho da lista, se for, significa que a lista
     * não possui nó neste índice, então uma estrutura de
     * exceção é criada exibindo uma mensagem para o usuário
     * que informa que este índice não está contido na lista
     * e o último índice da lista.
     *
     * @param index Índice a ser verificado se existe na lista.
     */
    private void validaIndice(int index){
        if(index >= this.size()){
            int ultimoIndice = this.size() - 1;
            throw new IndexOutOfBoundsException("Não existe conteúdo no índice " + index + " desta lista. Esta lista só vai até o índice " + ultimoIndice + " .");
        }
    }

    /**
     * Verifica se o índice determinado existe na lista, se
     * existir percorre a lista até o nó deste índice.
     *
     * @param index Índice do nó procurado.
     * @return Nó procurado.
     */
    private No<T> getNo(int index){
        validaIndice(index);
        No<T> noAuxiliar = refNoEntrada;
        No<T> noRetorno = noAuxiliar;

        for (int i = 0; i <= index; i++){
            noRetorno = noAuxiliar;
            noAuxiliar = noAuxiliar.getRefNo();
        }
        return noRetorno;        
    }

    /**
     * Percorre a lista, contabilizando a quantidade de nós
     * existentes até chegar no último nó da lista.
     *
     * @return Tamanho da lista.
     */
    public int size(){
        int tamanhoLista = 0;
        No<T> referenciaAux = refNoEntrada;
        while (true){
            if(referenciaAux != null){
                tamanhoLista++;
                if(referenciaAux.getRefNo() != null){
                    referenciaAux = referenciaAux.getRefNo();
                }else{
                    break;
                }
            }else{
                break;
            }
        }
        return tamanhoLista;
    }

    /**
     * Retorna uma representação em formato de String da estrutura de dados lista encadeada.
     *
     * @return Representação da estrutura de dados lista encadeada em formato de String.
     */
    @Override
    public String toString() {
        String stringRetorno = "";
        No<T> noAuxiliar = refNoEntrada;

        for(int i = 0; i < this.size(); i++){
            stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
            noAuxiliar = noAuxiliar.getRefNo();
        }
        stringRetorno += "null";
        return stringRetorno;
    }
}