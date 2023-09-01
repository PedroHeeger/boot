package com.listadupla;

/**
 * Classe que representa uma lista duplamente encadeada
 * (estrutura de dados) genérica.
 * 
 * @param <T> Tipo de dados que esta lista pode armazenar.
 */
public class ListaDuplamenteEncadeada<T> {
    private No<T> primeiroNo;
    private No<T> ultimoNo;
    private int tamanhoLista;

    /**
     * Construtor da classe ListaDuplamenteEncadeada<T>.
     *
     * @param primeiroNo Primeiro nó da lista (inicializa como nulo).
     * @param ultimoNo Último nó da lista (inicializa como nulo).
     * @param tamanhoLista Tamanho da lista.
     */
    public ListaDuplamenteEncadeada() {
        this.primeiroNo = null;
        this.ultimoNo = null;
        this.tamanhoLista = 0;
    }

    /**
     * Determina se a lista está vazia ou não.
     *
     * @return Valor booleano indicando se a lista está vazia ou não.
     */
    public boolean isEmpty(){
        return tamanhoLista == 0 ? true : false;
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
     * Adiciona um novo nó a lista definido a referência na memória do próximo
     * nó como null e do nó prévio como último nó da lista. Verifica se existe
     * o primeiro nó na lista, se não existir, defini o novo nó como primeiro nó.
     * Verifica se existe o último nó, caso exista, referencia o próximo nó do 
     * último nó para este novo nó para que ele entre na lista. Assim, o novo nó
     * passa a ser o último no da lista e o tamanho da lista é aumentado em mais um.
     *
     * @param conteudo Conteúdo do novo nó que é adicionado no final da lista.
     */
    public void add(T conteudo){
        No<T> novoNo = new No<>(conteudo);  
        novoNo.setRefNoProximo(null);
        novoNo.setRefNoPrevio(ultimoNo);
        if(primeiroNo == null){
            primeiroNo = novoNo;
        }
        if(ultimoNo != null){
            ultimoNo.setRefNoProximo(novoNo);
        }
        ultimoNo = novoNo;
        tamanhoLista++;
    }

    /**
     * Define um nó auxiliar que é o nó na posição que o novo nó será
     * adicionado. Adiciona um novo nó definindo a referência de próximo
     * nó desse nó para o nó auxiliar, verificando se este próximo nó do
     * novo nó é null, se não for, define o nó prévio deste nó para o nó
     * prévio do nó auxiliar e alterando o do próximo nó, que no caso, é
     * o nó auxiliar, o seu nó prévio para o novo nó criado. Resumindo, o
     * novo nó empurra o nó auxiliar para frente. Caso o próximo nó do novo
     * nó criado fosse null, o nó prévio do novo nó é definido como último nó
     * existente na lista. Verificando se o índice é zero, se for, define
     * o novo nó como primeiro nó, caso contrário, o nó prévio ao novo nó tem
     * seu próximo nó definido como novo nó, e por fim, a lista contabiliza
     * mais um nó.
     *
     * @param index Índice de onde o novo nó deve ser adicionado a lista.
     * @param conteudo Conteúdo do novo nó que é adicionado no final da lista.
     */
    public void add(int index, T conteudo){
        No<T> noAuxilar = this.getNo(index);
        No<T> novoNo = new No<>(conteudo);
        novoNo.setRefNoProximo(noAuxilar);

        // Verificnado se existe nó após onde o novo nó vai entrar
        if(novoNo.getRefNoProximo() != null){
            novoNo.setRefNoPrevio(noAuxilar.getRefNoPrevio());
            novoNo.getRefNoProximo().setRefNoPrevio(novoNo);
        }else{
            novoNo.setRefNoPrevio(ultimoNo);
            ultimoNo = novoNo;
        }

        // Verificando se o nó vai entrar como primeir nó
        if(index == 0){
            primeiroNo = novoNo;
        }else{
            novoNo.getRefNoPrevio().setRefNoProximo(novoNo);
        }
        tamanhoLista++;
    }

    /**
     * Verifica se o índice do nó a ser removido é zero, sendo zero,
     * o primeiro nó passa ser o próximo nó, no caso, o segundo nó, e
     * então é verificado se existe esse novo primeir nó, se existir,
     * o nó prévio dele é definido como null, assim o primeiro nó antigo
     * não é mais referenciado e saí da lista. Se o índice a ser removido
     * não for o zero, extraí o nó do índice que deseja remover e armazena
     * em um nó auxiliar, onde o nó prévio deste nó que vai ser removido,
     * tem seu próximo nó alterado para o próximo nó do nó auxiliar 
     * (nó que será removido). Em seguida, é verificado sé o nó auxiliar é
     * o último nó, se não for, o próximo nó dele, tem seu nó prévio alterado
     * para o nó previo do nó auxiliar, assim o nó auxiliar não é referenciado
     * nem pelo próximo nem pelo prévio e então é removido da lista. Se o nó
     * auxiliar for o último nó, o último nó é alterado para o nó prévio do
     * nó auxiliar e por fim, é subtraindo um nó no tamanho da lista.     * 
     *
     * @param index Índice do nó a ser removido.
     */
    public void remove(int index){
        if(index == 0){
            primeiroNo = primeiroNo.getRefNoProximo();
            if(primeiroNo != null){
                primeiroNo.setRefNoPrevio(null);
            }
        }else{
            No<T> noAuxiliar = this.getNo(index);
            noAuxiliar.getRefNoPrevio().setRefNoProximo(noAuxiliar.getRefNoProximo());
            if(noAuxiliar != ultimoNo){
                noAuxiliar.getRefNoProximo().setRefNoPrevio(noAuxiliar.getRefNoPrevio());
            }else{
                ultimoNo = noAuxiliar.getRefNoPrevio();
            }
        }
        this.tamanhoLista--;
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
        No<T> noAuxiliar = primeiroNo;

        for (int i = 0; i < index; i++){
            noAuxiliar = noAuxiliar.getRefNoProximo();
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
     * Retorna uma representação em formato de String da estrutura de dados lista duplamente encadeada.
     *
     * @return Representação da estrutura de dados lista duplamente encadeada em formato de String.
     */
    @Override
    public String toString() {
        String stringRetorno = "";
        No<T> noAuxiliar = primeiroNo;

        for(int i = 0; i < this.size(); i++){
            stringRetorno += "[No{conteudo=" + noAuxiliar.getConteudo() + "}]--->";
            noAuxiliar = noAuxiliar.getRefNoProximo();
        }
        stringRetorno += "null";
        return stringRetorno;
    }
}