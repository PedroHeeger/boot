package banco_digital.src;

/**
 * Classe que representa um cliente.
 */
public class Cliente {

    private String nome;

    /**
     * Construtor da classe Cliente.
     *
     * @param nome Nome do cliente.
     */
    public Cliente(){
        this.nome = nome;
    }

    /**
     * Obtém o nome do cliente.
     *
     * @return Nome do cliente.
     */
    public String getNome(){
        return nome;
    }

    /**
     * Define um novo nome do cliente.
     *
     * @param nome Novo nome do cliente.
     */
    public void setNome(String nome){
        this.nome = nome;
    }
}