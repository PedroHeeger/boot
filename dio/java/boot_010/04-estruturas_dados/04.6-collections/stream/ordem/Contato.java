package ordem;
import java.util.Objects;

/**
 * Classe que representa contatos de telefone.
 */
public class Contato {
    private String nome;
    private Integer numero;

    /**
     * Construtor da classe Contato.
     *
     * @param nome Nome do contato.
     * @param numero Número do telefone de contato.
     */
    public Contato(String nome, Integer numero) {
        this.nome = nome;
        this.numero = numero;
    }

    /**
     * Obtém o nome do contato.
     *
     * @return Nome do contato.
     */
    public String getNome() {
        return nome;
    }

    /**
     * Obtém o número de contato.
     *
     * @return Número de contato.
     */
    public Integer getNumero() {
        return numero;
    }

/**
 * Compara este objeto Contato com outro objeto para determinar se são iguais.
 *
 * @param o O objeto a ser comparado com este Contato.
 * @return true se os objetos forem iguais; false caso contrário.
 */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Contato contato = (Contato) o;
        return nome.equals(contato.nome) && numero.equals(contato.numero);
    }

    /**
     * Gera um codigo hash para o objeto com o atributo especifico.
     *
     * @return Codigo hash do objeto com o atributo especifico.
     */
    @Override
    public int hashCode() {
        return Objects.hash(nome, numero);
    }

    /**
     * Retorna uma representação em formato de String da marca do carro.
     *
     * @return Representação da marca do carro em formato de String.
     */
    @Override
    public String toString() {
        return "Contato{" +
                "nome='" + nome + '\'' +
                ", numero='" + numero + '\'' +
                '}';
    }
}