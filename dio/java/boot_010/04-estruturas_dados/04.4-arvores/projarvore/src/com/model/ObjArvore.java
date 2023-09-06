package com.model;

/**
 * Classe abstrata base para objetos que podem ser armazenados em uma árvore.
 * Implementa os métodos obrigatórios para uso em estruturas de dados.
 *
 * @param <T> O tipo de objeto que será armazenado na árvore.
 */
public abstract class ObjArvore<T> implements Comparable<T>{

    /**
     * Verifica se este objeto é igual a outro objeto.
     *
     * @param o Objeto a ser comparado com este.
     * @return True se os objetos são iguais, false caso contrário.
     */
    public abstract boolean equals(Object o);

    /**
     * Calcula o código de hash para este objeto.
     *
     * @return Código de hash do objeto.
     */
    public abstract int hashCode();

    /**
     * Compara este objeto com outro objeto para determinar a ordem.
     *
     * @param outro Objeto a ser comparado com este.
     * @return Um valor negativo se este objeto for menor que o outro,
     *         Um valor positivo se for maior, ou zero se forem iguais.
     */
    public abstract int compareTo(T outro);

    /**
     * Retorna uma representação em formato de string deste conteúdo do objeto.
     *
     * @return Uma representação em string do conteúdo do objeto.
     */
    public abstract String toString();
}