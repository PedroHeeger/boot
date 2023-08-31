package banco_digital.src;

/**
 * Classe que representa um banco.
 */
public class Banco {

    private String nome;

    /**
     * Construtor da classe Banco.
     *
     * @param nome Nome do banco.
     */
    public Banco(){
        this.nome = nome;
    }

    /**
     * Obtém o nome do banco atual.
     *
     * @return Nome do banco atual.
     */
    public String getNome(){
        return nome;
    }

    /**
     * Define um novo nome do banco.
     *
     * @param nome Novo nome do banco.
     */
    public void setNome(String nome){
        this.nome = nome;
    }
}