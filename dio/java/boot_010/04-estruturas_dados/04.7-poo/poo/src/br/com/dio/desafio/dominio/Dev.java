package br.com.dio.desafio.dominio;

import java.util.LinkedHashSet;
import java.util.Optional;
import java.util.Set;

/**
 * Classe que representa um dev.
 */
public class Dev {
    private String nome;
    private Set<Conteudo> conteudosInscritos = new LinkedHashSet<>();
    private Set<Conteudo> conteudosConcluidos = new LinkedHashSet<>();
    
    /**
     * Construtor da classe Dev.
     */
    public Dev() {

    }

    /**
     * Adiciona todos os conteúdos de um bootcamp que o dev se inscreveu ao
     * conjunto de conteúdos inscritos deste dev.
     *
     * @param bootcamp Bootcamp que o deve se inscreveu.
     */
    public void inscreverBootcamp(Bootcamp bootcamp){
        this.conteudosInscritos.addAll(bootcamp.getConteudos());
        bootcamp.getDevsInscritos().add(this);
    }

    /**
     * Extraí o primeiro conteúdo que o dev está inscrito adiciona para no conjunto
     * de conteúdos concluídos e remove do conjunto de conteúdos inscritos.
     */
    public void progredir() {
        Optional<Conteudo> conteudo = this.conteudosInscritos.stream().findFirst();
        if(conteudo.isPresent()) {
            this.conteudosConcluidos.add(conteudo.get());
            this.conteudosInscritos.remove(conteudo.get());
        }else {
            System.err.println("Você não está matriculado em nenhum conteúdo!");
        }
    }

    /**
     * Calcula o total de XP que o dev obteve.
     *
     * @return Total de XP obtido pelo dev.
     */
    public double calcularTotalXp() {
        // Primeira forma sem expressão Lambda, segunda forma com a expressão Lambda
        // return this.conteudosConcluidos.stream().mapToDouble(conteudo -> conteudo.calcularXp()).sum();
        return this.conteudosConcluidos.stream().mapToDouble(Conteudo::calcularXp).sum();
    }

    /**
     * Obtém o nome do dev.
     *
     * @return Nome do dev.
     */
    public String getNome() {
        return nome;
    }

    /**
     * Define um novo nome do dev.
     *
     * @param titulo Novo nome do dev.
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * Obtém um conjunto de conteúdos que o dev está inscrito.
     *
     * @return Conjunto de conteúdos que o dev está inscrito.
     */
    public Set<Conteudo> getConteudosInscritos() {
        return conteudosInscritos;
    }

    /**
     * Define um novo conjunto de conteúdos que o dev está inscrito.
     *
     * @param titulo Novo conjunto de conteúdos que o dev está inscrito.
     */
    public void setConteudosInscritos(Set<Conteudo> conteudosInscritos) {
        this.conteudosInscritos = conteudosInscritos;
    }

    /**
     * Obtém um conjunto de conteúdos que o dev concluio.
     *
     * @return Conjunto de conteúdos que o dev concluio.
     */
    public Set<Conteudo> getConteudosConcluidos() {
        return conteudosConcluidos;
    }

    /**
     * Define um novo conjunto de conteúdos que o dev concluio.
     *
     * @param titulo Novo conjunto de conteúdos que o dev concluio.
     */
    public void setConteudosConcluidos(Set<Conteudo> conteudosConcluidos) {
        this.conteudosConcluidos = conteudosConcluidos;
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
        result = prime * result + ((conteudosInscritos == null) ? 0 : conteudosInscritos.hashCode());
        result = prime * result + ((conteudosConcluidos == null) ? 0 : conteudosConcluidos.hashCode());
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
        Dev other = (Dev) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        if (conteudosInscritos == null) {
            if (other.conteudosInscritos != null)
                return false;
        } else if (!conteudosInscritos.equals(other.conteudosInscritos))
            return false;
        if (conteudosConcluidos == null) {
            if (other.conteudosConcluidos != null)
                return false;
        } else if (!conteudosConcluidos.equals(other.conteudosConcluidos))
            return false;
        return true;
    }
}
