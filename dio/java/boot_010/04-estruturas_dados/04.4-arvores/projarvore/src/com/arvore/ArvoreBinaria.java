package com.arvore;

/**
 * Classe que representa uma ávore binária
 * (estrutura de dados) genérica.
 * 
 * @param <T> Tipo de dados que esta árvore pode armazenar.
 */
public class ArvoreBinaria<T extends Comparable<T>>{
    private BinNo<T> raiz;

    /**
     * Construtor da classe ArvoreBinaria<T>.
     *
     * @param raiz Nó raíz da árvore binária.
     */
    public ArvoreBinaria(){
        this.raiz = null;
    }

    /**
     * Inseri um nó na árvore, verificando em outro método
     * qual posição este nó vai entrar. Para isso, além do
     * nó que será adicionado é passado para o outro método
     * o nó da raíz. O outro método devolve o novo nó da raíz,
     * que se já houver um nó na raíz, ele é sempre retornado,
     * pois o nó raíz só muda se for removido.
     *
     * @param conteudo Conteúdo do nó a ser inserido na ávore.
     */
    public void insert(T conteudo){
        BinNo<T> novoNo = new BinNo<>(conteudo);
        raiz = insert(raiz, novoNo);
    }

    /**
     * Com o nó atual, que é um nó de nível da árvore, neste caso
     * começa como nó da raíz, e com o nó a ser inserido na árvore,
     * é verificado se o nó atual (ou seja, no nível atual), existe
     * algum nó, se não existir, o novo nó entra neste nível. Se o nó
     * atual não for nulo, vai ser comparado, no método de outra classe,
     * o conteúdo do novo nó com o conteúdo do nó atual (nível atual), se
     * for menor que zero, significa que o novo nó é menor que o nó atual,
     * logo, ele vai ser inserido à esquerda deste nó atual, porém este novo
     * nó vai percorrer todos os níveis da árvore, até que o nó atual seja 
     * null, que é exatamente onde ele entra e em cada nó atual (nível atual)
     * vai ser definido a referência à esquerda dele apontado para o novo nó
     * que entrou entrou à esquerda. Se a comparação não for menor que zero,
     * significa que o novo nó é maior que o nó atual, logo ele vai ser
     * inserido à direita do nó atual, percorrendo exatamente igual para
     * a condição à esquerda. Quando essas duas condições ocorrem, toda a 
     * árvore é percorrida, repetindo este método, até achar a posição para 
     * inserir o novo nó. O novo nó só é inserido quando o nó atual é null.
     * Por fim, o nó atual é retornada para o método anterior alterando o nó 
     * da raíz da árvore, porém este nó será sempre o mesmo nó, pois o nó raíz
     * um vez criado, não muda, a não ser que seja excluído.
     *
     * @param atual Nó no nível atual da árvore, inicia como nó raíz.
     * @param novoNo Novo nó a ser inserido na árvore.
     * @return Nó do nível atual da árvore, que sempre vai ser do primeiro 
     * nível, logo, o nó raíz da árvore.
     */
    private BinNo<T> insert(BinNo<T> atual, BinNo<T> novoNo){
        if(atual == null){
            return novoNo;
        }else if(novoNo.getConteudo().compareTo(atual.getConteudo()) < 0){
            atual.setNoEsq(insert(atual.getNoEsq(), novoNo));
        }else{
            atual.setNoDir(insert(atual.getNoDir(), novoNo));
        }
        return atual;
    }

    /**
     * Aciona o método para exibir a árvore na ordem
     * InOrdem passando o nó raíz.
     */
    public void exibirInOrdem(){
        System.out.println("\n Exibindo InOrdem");
        exibirInOrdem(this.raiz);
    }

    /**
     * Verifica se esta árvore possui algum nó, se possuir,
     * chama novamente o método para percorrer até o último nó 
     * à esquerda e voltar até a raíz exibindo os nós na ordem
     * In-Ordem.
     *
     * @param atual Nó no nível atual da árvore, inicia como nó raíz.
     */
    private void exibirInOrdem(BinNo<T> atual){
        if(atual != null){
            exibirInOrdem(atual.getNoEsq());
            System.out.print(atual.getConteudo() + ", ");
            exibirInOrdem(atual.getNoDir());
        }
    }

    /**
     * Aciona o método para exibir a árvore na ordem
     * PosOrdem passando o nó raíz.
     */
    public void exibirPosOrdem(){
        System.out.println("\n Exibindo PosOrdem");
        exibirPosOrdem(this.raiz);
    }

    /**
     * Verifica se esta árvore possui algum nó, se possuir,
     * chama novamente o método para percorrer até o último nó 
     * à esquerda e voltar até a raíz exibindo os nós na ordem
     * Pos-Ordem.
     *
     * @param atual Nó no nível atual da árvore, inicia como nó raíz.
     */
    private void exibirPosOrdem(BinNo<T> atual){
        if(atual != null){
            exibirPosOrdem(atual.getNoEsq());
            exibirPosOrdem(atual.getNoDir());
            System.out.print(atual.getConteudo() + ", ");
        }
    }

    /**
     * Aciona o método para exibir a árvore na ordem
     * PreOrdem passando o nó raíz.
     */
    public void exibirPreOrdem(){
        System.out.println("\n Exibindo PreOrdem");
        exibirPreOrdem(this.raiz);
    }

    /**
     * Verifica se esta árvore possui algum nó, se possuir,
     * chama novamente o método para percorrer até o último nó 
     * à esquerda já exibindo os nós na ordem Pre-Ordem (Diagonal).
     *
     * @param atual Nó no nível atual da árvore, inicia como nó raíz.
     */
    private void exibirPreOrdem(BinNo<T> atual){
        if(atual != null){
            System.out.print(atual.getConteudo() + ", ");
            exibirPreOrdem(atual.getNoEsq());
            exibirPreOrdem(atual.getNoDir());
        }
    }

    public void remove(T conteudo){
        try{
            BinNo<T> atual = this.raiz;
            BinNo<T> pai = null;
            BinNo<T> filho = null;
            BinNo<T> temp = null;

            // Percorrendo para procurar o nó a ser excluído
            while (atual != null && !atual.getConteudo().equals(conteudo)){
                pai = atual;
                if(conteudo.compareTo(atual.getConteudo()) < 0){
                    atual = atual.getNoEsq();
                }else {
                    atual = atual.getNoDir();
                }
            }


            if(atual == null){
                System.out.println("Conteúdo não encontrado. Bloco Try");
            }

            if(pai == null){
                if(atual.getNoDir() == null){
                    this.raiz = atual.getNoEsq();
                }else if (atual.getNoEsq() == null){
                    this.raiz = atual.getNoDir();
                }else{
                    for(temp = atual, filho = atual.getNoEsq();
                        filho.getNoDir() != null;
                        temp = filho, filho = filho.getNoEsq()
                        ){
                            if(filho != atual.getNoEsq()){
                                temp.setNoDir(filho.getNoEsq());
                                filho.setNoEsq(raiz.getNoEsq());
                            }
                    }
                    filho.setNoDir(raiz.getNoDir());
                    raiz = filho;
                }
            }else if (atual.getNoDir() == null){
                if(pai.getNoEsq() == atual){
                    pai.setNoEsq(atual.getNoEsq());
                }else{
                    pai.setNoDir(atual.getNoEsq());
                }
            }else if (atual.getNoEsq() == null){
                if(pai.getNoEsq() == atual){
                    pai.setNoEsq(atual.getNoDir());
                }else{
                    pai.setNoDir(atual.getNoDir());
                }
            }else{
                for(
                    temp = atual, filho = atual.getNoEsq();
                    filho.getNoDir() != null;
                    temp = filho, filho = filho.getNoDir())
                    {
                    if(filho != atual.getNoEsq()){
                        temp.setNoDir(filho.getNoEsq());
                        filho.setNoEsq(atual.getNoEsq());
                    }
                    filho.setNoDir(atual.getNoDir());
                    if(pai.getNoEsq() == atual){
                        pai.setNoEsq(filho);
                    }else{
                        pai.setNoDir(filho);
                    }
                }
            }

        }catch (NullPointerException erro){
            System.out.println("Conteúdo não encontrado. Bloco Catch");
        }
    }
}