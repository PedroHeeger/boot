package com.listaencad;

/**
 * Classe que representa uma lista circular (estrutura de dados) genérica.
 * 
 * @param <T> Tipo de dados que esta lista pode armazenar.
 */
public class ListaCircular<T> {
    private No<T> cabeca;
    private No<T> cauda;
    private int tamanhoLista;

    /**
     * Construtor da classe ListaEncadeada<T>.
     *
     * @param cabeca Nó da cabeça da lista, último nó, aponta para a cauda.
     * @param cauda Nó da cauda da lista, primeiro nó, por onde os nós vão entrando.
     * @param tamanhoLista Tamanho da lista.
     */
     public ListaCircular() {
        this.cabeca = null;
        this.cauda = null;
        this.tamanhoLista = 0;
    }

    /**
     * Determina se a lista está vazia ou não.
     *
     * @return Valor booleano indicando se a lista está vazia ou não.
     */
    public boolean isEmpty(){
        return this.tamanhoLista == 0 ? true : false;
    }

    /**
     * Extraí o conteúdo do nó procurado.
     *
     * @param index Índice do nó procurado.
     * @return Conteúdo do nó procurado.
     */
    public T get(int index){
        return getNo(index).getConteudo();
    }

    /**
     * Adiciona um novo nó a lista. Se a lista não tiver nenhum nó, define o 
     * novo nó como a cabeça da lista, a cauda como a cabeça, logo também igual
     * ao novo nó e define o nó de referência na memória da cabeça como o nó da cauda.
     * Neste momento, um único nó na lista é a cabeça e a cauda e aponta para ele mesmo.
     * Caso a lista já tenha nós, é definido o a referência na memória do novo nó como o
     * nó da cauda e a referência do nó da cabeça é apontado para o novo nó, que passa a
     * ser a nova cauda da lista.
     *
     * @param conteudo Conteúdo do novo nó que é adicionado na cauda da lista.
     */
    public void add(T conteudo){
        No<T> novoNo = new No<>(conteudo);
        if(tamanhoLista == 0){
            this.cabeca = novoNo;
            this.cauda = this.cabeca;
            this.cabeca.setRefNo(this.cauda);
        }else{
            novoNo.setRefNo(this.cauda);
            this.cabeca.setRefNo(novoNo);
            this.cauda = novoNo;
        }
        this.tamanhoLista++;
    }

    /**
     * Verifica se o índice é maior que o tamanho da lista, se for,
     * aciona uma exceção que exibe uma mensagem. Se não for, um nó
     * auxiliar armazena o nó da cauda e então é verificado se o índice
     * que se deseja remover é zero (nó da cauda), se for, o nó da cauda
     * é alterado para o próximo nó após ela e o nó da cabeça tem a referência 
     * na memória apontada para nova cauda. Assim o nó que era a antiga cauda
     * não é mais referenciado e é removido da lista. Se o índice for um, a 
     * referência na memória da cauda é definada para o segundo nó após a cauda,
     * pois o primeiro nó após o nó da cauda é removido. Caso seja qualquer outro
     * índice, a lista é percorrida, alterando o nó auxiliar até chegar no nó do
     * índice que deseja ser removido, então a referência na memória deste nó
     * auxiliar é definida para o segundo nó após o nó auxiliar, pulando o primeiro
     * nó, que este não será mais referenciado sendo excluído. Ao final, o tamanho 
     * da lista é diminuindo em um.
     *
     * @param index Índice do nó a ser removido.
     */
    public void remove(int index){
        if(index >= this.tamanhoLista){
            throw new IndexOutOfBoundsException("O índice maior que o tamanho da lista");
        }

        No<T> noAuxiliar = cauda;
        if(index == 0){
            this.cauda = this.cauda.getRefNo();
            this.cabeca.setRefNo(cauda);
        }else if(index == 1){
            this.cauda.setRefNo(this.cauda.getRefNo().getRefNo());
        }else{
            for(int i = 0; i < index-1; i++){
                noAuxiliar = noAuxiliar.getRefNo();
            }
            noAuxiliar.setRefNo(noAuxiliar.getRefNo().getRefNo());
        }
        this.tamanhoLista--;
    }

    /**
     * Verifica se a lista está vazia, caso não esteja, verifica se
     * o índice informado é zero, se for retorna o nó da cauda da lista.
     * Não sendo zero, armazena em um nó auxiliar o nó da cauda, e percorre
     * da cauda até o índice procurado.
     *
     * @param index Índice do nó procurado.
     * @return Nó da cauda da lista.
     * @return Nó procurado.
     */
    private No<T> getNo(int index){
        if(isEmpty())
            throw new IndexOutOfBoundsException("A lista está vazia");
        if(index == 0){
            return this.cauda;
        }

        No<T> noAuxiliar = this.cauda;
        for(int i = 0; (i < index) && (noAuxiliar != null); i++){
            noAuxiliar = noAuxiliar.getRefNo();
        }
        return noAuxiliar;
    }

    /**
     * Retorna o tamanho da lista que já é calculado
     * ao adicionar ou remover um nó.
     *
     * @return Tamanho da lista.
     */
    public int size(){
        return tamanhoLista;
    }

    /**
     * Retorna uma representação em formato de String da estrutura de dados lista circular.
     *
     * @return Representação da estrutura de dados lista circular em formato de String.
     */
    @Override
    public String toString() {
        String stringRetorno = "";
        No<T> noAuxiliar = this.cauda;

        for(int i = 0; i < this.size(); i++){
            stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
            noAuxiliar = noAuxiliar.getRefNo();
        }
        stringRetorno += this.size() != 0 ? "Cabeça (Retorna ao início)" : "[]";
        return stringRetorno;
    }
}