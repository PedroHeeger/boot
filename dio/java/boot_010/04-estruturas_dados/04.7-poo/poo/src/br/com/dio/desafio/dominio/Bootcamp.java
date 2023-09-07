package br.com.dio.desafio.dominio;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.HashSet;
import java.util.Set;

/**
 * Classe que representa um bootcamp.
 */
public class Bootcamp {
    private String nome;
    private String descricao;
    private final LocalDate dataInicial = LocalDate.now();
    private final LocalDate dataFinal = dataInicial.plusDays(45);
    private Set<Dev> devsInscritos = new HashSet<>();
    private Set<Conteudo> conteudos = new LinkedHashSet<>();

    /**
     * Construtor da classe Bootcamp.
     */
    public Bootcamp() {

    }

    /**
     * Obtém o nome do bootcamp.
     *
     * @return Nome do bootcamp.
     */
    public String getNome() {
        return nome;
    }

    /**
     * Define um novo nome do bootcamp.
     *
     * @param titulo Novo nome do bootcamp.
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Obtém a descrição do bootcamp.
     *
     * @return Descrição do bootcamp.
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * Define uma nova descrição do bootcamp.
     *
     * @param descricao Nova descrição do bootcamp.
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * Obtém a data inicial do bootcamp.
     *
     * @return Data inicial do bootcamp.
     */
    public LocalDate getDataInicial() {
        return dataInicial;
    }

    /**
     * Obtém a data final do bootcamp.
     *
     * @return Data final do bootcamp.
     */
    public LocalDate getDataFinal() {
        return dataFinal;
    }

    /**
     * Obtém um conjunto de devs inscritos no bootcamp.
     *
     * @return Conjunto de devs inscritos no bootcamp.
     */
    public Set<Dev> getDevsInscritos() {
        return devsInscritos;
    }

    /**
     * Define um novo conjunto de devs inscritos no bootcamp.
     *
     * @param descricao Novo conjunto de devs inscritos no bootcamp.
     */
    public void setDevsInscritos(Set<Dev> devsInscritos) {
        this.devsInscritos = devsInscritos;
    }

    /**
     * Obtém um conjunto de conteúdos que contém no bootcamp.
     *
     * @return Conjunto de conteúdos que contém no bootcamp.
     */
    public Set<Conteudo> getConteudos() {
        return conteudos;
    }

    /**
     * Define um novo conjunto de conteúdos que contém no bootcamp.
     *
     * @param descricao Novo conjunto de conteúdos que contém no bootcamp.
     */
    public void setConteudos(Set<Conteudo> conteudos) {
        this.conteudos = conteudos;
    }

    /**
     * Retorna um valor de código hash para este objeto.
     *
     * @return Valor de código hash calculado com base nos atributos do objeto.
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        result = prime * result + ((descricao == null) ? 0 : descricao.hashCode());
        result = prime * result + ((dataInicial == null) ? 0 : dataInicial.hashCode());
        result = prime * result + ((dataFinal == null) ? 0 : dataFinal.hashCode());
        result = prime * result + ((devsInscritos == null) ? 0 : devsInscritos.hashCode());
        result = prime * result + ((conteudos == null) ? 0 : conteudos.hashCode());
        return result;
    }

    /**
     * Compara este objeto com outro objeto para determinar se são iguais.
     *
     * @param obj O objeto a ser comparado com este objeto.
     * @return true se os objetos forem iguais; false caso contrário.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Bootcamp other = (Bootcamp) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (descricao == null) {
            if (other.descricao != null)
                return false;
        } else if (!descricao.equals(other.descricao))
            return false;
        if (dataInicial == null) {
            if (other.dataInicial != null)
                return false;
        } else if (!dataInicial.equals(other.dataInicial))
            return false;
        if (dataFinal == null) {
            if (other.dataFinal != null)
                return false;
        } else if (!dataFinal.equals(other.dataFinal))
            return false;
        if (devsInscritos == null) {
            if (other.devsInscritos != null)
                return false;
        } else if (!devsInscritos.equals(other.devsInscritos))
            return false;
        if (conteudos == null) {
            if (other.conteudos != null)
                return false;
        } else if (!conteudos.equals(other.conteudos))
            return false;
        return true;
    }
}
