package com.arvore.model;
import java.util.Objects;

/**
 * Classe que representa um objeto com um valor inteiro e é usada para 
 * armazenamento em estruturas de dados.
 */
public class Obj extends ObjArvore<Obj> {
    Integer meuValor;

    /**
     * Construtor da classe Obj.
     *
     * @param meuValor Valor do objeto.
     */
    public Obj(Integer meuValor){
        this.meuValor = meuValor;
    }

    /**
     * Verifica se este objeto é igual a outro objeto.
     *
     * @param o Objeto a ser comparado com este.
     * @return True se os objetos são iguais, false caso contrário.
     */
    @Override
    public boolean equals(Object o){
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Obj obj = (Obj) o;
        return Objects.equals(meuValor, obj.meuValor);
    }

    /**
     * Calcula o código de hash para este objeto.
     *
     * @return Código de hash do objeto.
     */
    @Override
    public int hashCode(){
        return Objects.hash(meuValor);
    }

    /**
     * Compara este objeto com outro objeto para determinar a ordem.
     *
     * @param outro Objeto a ser comparado com este.
     * @return Um valor negativo se este objeto for menor que o outro,
     *         Um valor positivo se for maior, ou zero se forem iguais.
     */
    @Override
    public int compareTo(Obj outro){
        int i = 0;

        if(this.meuValor > outro.meuValor){
            i = 1;
        }else if(this.meuValor < outro.meuValor){
            i = -1;
        }
        return i;
    }

    /**
     * Retorna uma representação em formato de string deste conteúdo do objeto.
     *
     * @return Uma representação em string do conteúdo do objeto.
     */
    @Override
    public String toString(){
        return meuValor.toString();
    }
}