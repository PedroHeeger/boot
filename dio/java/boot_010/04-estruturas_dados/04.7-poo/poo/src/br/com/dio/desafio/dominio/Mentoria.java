package br.com.dio.desafio.dominio;

import java.time.LocalDate;

/**
 * Classe que representa uma mentoria.
 */
public class Mentoria extends Conteudo{
    private LocalDate data;

    /**
     * Construtor da classe Mentoria.
     */
    public Mentoria() {

    }

    /**
     * Calcula o XP obtido ao realizar o curso.
     *
     * @return XP obtido.
     */
    @Override
    public double calcularXp() {
        return XP_PADRAO + 20d;
    }

    /**
     * Obtém a data da mentoria.
     *
     * @return Data da mentoria.
     */
    public LocalDate getData() {
        return data;
    }

    /**
     * Define uma nova data da mentoria.
     *
     * @param data Nova data da mentoria.
     */
    public void setData(LocalDate data) {
        this.data = data;
    }

    /**
     * Retorna uma representação em formato de String das informações da mentoria.
     *
     * @return Representação das informações da mentoria em formato de String.
     */
    @Override
    public String toString() {
        return "Mentoria [titulo=" + getTitulo() + ", descricao=" + getDescricao() + ", data=" + data + "]";
    }   
}
