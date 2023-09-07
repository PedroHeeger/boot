package br.com.dio.desafio.dominio;

/**
 * Classe que representa um curso.
 */
public class Curso extends Conteudo {
    private int cargaHoraria;

    /**
     * Construtor da classe Curso.
     */
    public Curso() {

    }

    /**
     * Calcula o XP obtido ao realizar o curso.
     *
     * @return XP obtido.
     */
    @Override
    public double calcularXp() {
        return XP_PADRAO * cargaHoraria;
    }

    /**
     * Obtém a carga horária do curso.
     *
     * @return Carga horária do curso.
     */
    public int getCargaHoraria() {
        return cargaHoraria;
    }

    /**
     * Define uma nova carga horária do curso.
     *
     * @param cargaHoraria Nova carga horária do curso.
     */
    public void setCargaHoraria(int cargaHoraria) {
        this.cargaHoraria = cargaHoraria;
    }

    /**
     * Retorna uma representação em formato de String das informações do curso.
     *
     * @return Representação das informações do curso em formato de String.
     */
    @Override
    public String toString() {
        return "Curso [titulo=" + getTitulo() + ", descricao=" + getDescricao() + ", cargaHoraria=" + cargaHoraria + "]";
    }
}
