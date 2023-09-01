package com.projatribuicao;

/**
 * Classe que representa um Objeto na POO.
 */
public class MeuObj {
    Integer num;

    /**
     * Construtor da classe MeuObj.
     *
     * @param num Número de identificação da instância (objeto) desta classe.
     */
    public MeuObj(Integer num) {
        this.num = num;
    }

    /**
     * Define um novo número de identificação do objeto.
     *
     * @param num Novo número de identificação da instância (objeto) desta classe.
     */
    public void setNum(Integer num){
        this.num = num;
    }

    /**
     * Retorna uma representação em formato de String do número de identificação do objeto.
     *
     * @return Representação do número de identificação do objeto em formato de String.
     */
    @Override
    public String toString() {
        return this.num.toString();
    }
}