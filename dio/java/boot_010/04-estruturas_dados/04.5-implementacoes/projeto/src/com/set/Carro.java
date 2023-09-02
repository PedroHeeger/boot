package com.set;

import java.util.Objects;

/**
 * Classe que representa um carro.
 */
public class Carro implements Comparable<Carro>{
    String marca;

    /**
     * Construtor da classe Carro.
     *
     * @param marca Marca do carro.
     */
    public Carro(String marca) {
        this.marca = marca;
    }

    /**
     * Obtém a marca do carro.
     *
     * @return Marca do carro.
     */
    public String getMarca() {
        return marca;
    }

    /**
     * Define uma nova marca do carro.
     *
     * @param marca Nova marca do carro.
     */
    public void setMarca(String marca) {
        this.marca = marca;
    }

    /**
     * Retorna uma representação em formato de String da marca do carro.
     *
     * @return Representação da marca do carro em formato de String.
     */
    @Override
    public String toString() {
        return "Carro [marca=" + marca + "]";
    }

    /**
     * Compara se a marca desse carro tem o mesmo tamanho de caracteres
     * em relação a marca de outro carro, se tiver, considera iguais.
     *
     * @return Valor -1 determina que marca deste carro é menor que do outro.
     * @return Valor 1 determina que marca deste carro é maior ou igual que a do outro.
     * @return Valor 0 quando nenhuma das condições atenderem.
     */
    // @Override
    // public int compareTo(Carro o){
    //     if(this.marca.length() < o.marca.length()){
    //         return -1;
    //     }else if(this.marca.length() >= o.marca.length()){
    //         return 1;
    //     }
    //     return 0;
    // }

    /**
     * Compara a marca desse carro com de outro carro por ordem
     * alfabética.
     *
     * @return Carro cuja marca é primeira na ordem alfabética.
     */
    @Override
    public int compareTo(Carro o){
        return this.getMarca().compareTo(o.getMarca());
    }

    /**
     * Gera um codigo hash para o objeto com o atributo especifico.
     *
     * @return Codigo hash do objeto com o atributo especifico.
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((this.marca == null) ? 0 : this.marca.hashCode());
        return result;
    }

    /**
     * Verifica se os objetos são iguais, verifica se o objeto que
     * se deseja comparar é nulo, verifica se as classes desses objetos 
     * são diferentes. Então verifica se o atributo desse objeto é null,
     * se for, verifica se a do outro objeto também é null, se não for, 
     * os atributos não são iguais. Caso o atributo desse objeto não seja
     * null, verifica se o atributo deste objeto não é igual ao do outro
     * objeto, se essa condição for atendida, os atributos não são iguais,
     * caso contrário, são iguais.
     *
     * @param obj Objeto a ser comparado com este objeto.
     * @return True se os objetos forem iguais.
     * @return False se os objetos não forem iguais.
     * @return False se as classes dos objetos forem diferentes.
     * @return Valor booleano da comparação do atributo dos objetos.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        Carro other = (Carro) obj;
        if (this.marca == null) {
            if (other.marca != null)
                return false;
        } else if (!this.marca.equals(other.marca))
            return false;
        return true;
    }

    /**
     * Verifica se os objetos são iguais, verifica se o objeto que
     * se deseja comparar é nulo ou se as classes desses objetos são
     * diferentes, e então realiza a comparação do atributo dos dois 
     * objetos acionando um outro método equals da classe Objects.
     *
     * @param o Objeto a ser comparado com este objeto.
     * @return True se os objetos forem iguais.
     * @return False se os objetos não forem iguais ou as classes dos objetos
     * forem diferentes.
     * @return Valor booleano da comparação do atributo dos objetos.
     */
    public boolean equals2(Object o){
        if(this == o) return true;
        if (o == null || this.getClass() != o.getClass()) return false;
        Carro carro = (Carro) o;
        return Objects.equals(this.marca, carro.marca);
    }

    /**
     * Gera um código hash para o objeto com o atributo específico.
     *
     * @return Código hash do objeto com o atributo específico.
     */
    public int hashCode2(){
        return Objects.hash(marca);
    }
}