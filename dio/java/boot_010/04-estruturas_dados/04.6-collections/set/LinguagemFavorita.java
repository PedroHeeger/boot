import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import java.util.Comparator;

/**
 * Classe que representa linguagens de programação.
 */
public class LinguagemFavorita implements Comparable<LinguagemFavorita>{
    String nome;
    int anoDeCriacao;
    String ide;

    /**
     * Construtor da classe LinguagemFavorita.
     *
     * @param nome Nome da linguagem de programação.
     * @param anoDeCriacao Ano de criação da linguagem de programação.
     * @param ide IDE utilizada com esta linguagem de programação.
     */
    public LinguagemFavorita(String nome, int anoDeCriacao, String ide) {
        this.nome = nome;
        this.anoDeCriacao = anoDeCriacao;
        this.ide = ide;
    }

    /**
     * Ponto de entrada do programa. Cria vários conjuntos com as mesmas linguagens,
     * ordenando pelos seus atributos com uso da interface Comparator.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String [] args){
        System.out.println("--------\tOrdem Natural: Nome\t--------");
        Set<LinguagemFavorita> minhasLinguagensFavoritas = new HashSet<>();
        minhasLinguagensFavoritas.add(new LinguagemFavorita("Python", 1991, "Pycharm"));
        minhasLinguagensFavoritas.add(new LinguagemFavorita("JavaScript", 1995, "IntelliJ"));
        minhasLinguagensFavoritas.add(new LinguagemFavorita("Java", 1991, "Visual Studio Code"));
        for (LinguagemFavorita linguagem : minhasLinguagensFavoritas) System.out.println(linguagem);

        System.out.println("--------\tOrdem Natural: Nome\t--------");
        Set<LinguagemFavorita> minhasLinguagensFavoritas2 = new TreeSet<>(minhasLinguagensFavoritas);
        for (LinguagemFavorita linguagem : minhasLinguagensFavoritas2) System.out.println(linguagem);

        System.out.println("--------\tOrdem IDE\t--------");
        Set<LinguagemFavorita> minhasLinguagensFavoritas3 = new TreeSet<LinguagemFavorita>(new ComparatorIde());
        minhasLinguagensFavoritas3.addAll(minhasLinguagensFavoritas);
        for (LinguagemFavorita linguagem : minhasLinguagensFavoritas3) System.out.println(linguagem);

        System.out.println("--------\tOrdem Ano de Criacao e Nome\t--------");
        Set<LinguagemFavorita> minhasLinguagensFavoritas4 = new TreeSet<LinguagemFavorita>(new ComparatorAnoDeCriacaoENome());
        minhasLinguagensFavoritas4.addAll(minhasLinguagensFavoritas);
        for (LinguagemFavorita linguagem : minhasLinguagensFavoritas4) System.out.println(linguagem);

        System.out.println("--------\tOrdem Nome - Ano de Criacao - IDE\t--------");
        Set<LinguagemFavorita> minhasLinguagensFavoritas5 = new TreeSet<LinguagemFavorita>(new ComparatorNomeAnoDeCriacaoIde());
        minhasLinguagensFavoritas5.addAll(minhasLinguagensFavoritas);
        for (LinguagemFavorita linguagem : minhasLinguagensFavoritas5) System.out.println(linguagem);
    }

    /**
     * Retorna uma representação em formato de string do conteúdo do objeto.
     *
     * @return Uma representação em string do conteúdo do objeto.
     */
    @Override
    public String toString() {
        return "LinguagemFavorita [nome=" + nome + ", anoDeCriacao=" + anoDeCriacao + ", ide=" + ide + "]";
    }
  
    /**
     * Calcula o código de hash para este objeto.
     *
     * @return Código de hash do objeto.
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((nome == null) ? 0 : nome.hashCode());
        return result;
    }

    /**
     * Verifica se este objeto é igual a outro objeto.
     *
     * @param obj Objeto a ser comparado com este.
     * @return True se os objetos são iguais, false caso contrário.
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        LinguagemFavorita other = (LinguagemFavorita) obj;
        if (nome == null) {
            if (other.nome != null)
                return false;
        } else if (!nome.equals(other.nome))
            return false;
        return true;
    }

    /**
     * Compara o nome de uma linguagem com outra linguagem para ordenar
     * por nome.
     *
     * @param linguagemFavorita Linguagem a ser comparada com a linguagem atual.
     * @return Valor booleano para determinar a ordem entre as linguagens.
     */
    @Override
    public int compareTo(LinguagemFavorita linguagemFavorita) {
        return this.nome.compareTo(linguagemFavorita.nome);
    }
}

/**
 * Classe que realiza uma comparação por ide das lingugens de programação.
 */
class ComparatorIde implements Comparator<LinguagemFavorita>{

    /**
     * Compara a ide de uma linguagem com outra linguagem para
     * ordenar por ide.
     *
     * @param lf1 Linguagem a ser comparada.
     * @param lf2 Linguagem a ser comparada.
     * @return Valor booleano para determinar a ordem entre as linguagens.
     */
    @Override
    public int compare(LinguagemFavorita lf1, LinguagemFavorita lf2){
        return lf1.ide.compareToIgnoreCase(lf2.ide);
    }
}

/**
 * Classe que realiza uma comparação por ano de criação e nome das 
 * lingugens de programação.
 */
class ComparatorAnoDeCriacaoENome implements Comparator<LinguagemFavorita>{

    /**
     * Compara o ano de criação e o nome de uma linguagem com outra linguagem 
     * para ordenar por ano de criação e depois pelo nome.
     *
     * @param lf1 Linguagem a ser comparada.
     * @param lf2 Linguagem a ser comparada.
     * @return Valor booleano para determinar a ordem entre as linguagens.
     */
    @Override
    public int compare(LinguagemFavorita lf1, LinguagemFavorita lf2){
        int anoDeCriacao = Integer.compare(lf1.anoDeCriacao, lf2.anoDeCriacao);
        if(anoDeCriacao != 0) return anoDeCriacao;
        return lf1.nome.compareToIgnoreCase(lf2.nome);
    }
}

/**
 * Classe que realiza uma comparação por nome, ano de criação e ide das
 * linguagens de programação.
 */
class ComparatorNomeAnoDeCriacaoIde implements Comparator<LinguagemFavorita>{

    /**
     * Compara o nome, o ano de criação e a ide de uma linguagem com outra 
     * linguagem para ordenar por nome, depois ano de criação e por último
     * pela ide.
     *
     * @param lf1 Linguagem a ser comparada.
     * @param lf2 Linguagem a ser comparada.
     * @return Valor booleano para determinar a ordem entre as linguagens.
     */
    @Override
    public int compare(LinguagemFavorita lf1, LinguagemFavorita lf2){
        int nome = lf1.nome.compareToIgnoreCase(lf2.nome);
        int anoDeCriacao = Integer.compare(lf1.anoDeCriacao, lf2.anoDeCriacao);
        if(nome != 0) return nome;
        if(anoDeCriacao != 0) return anoDeCriacao;
        return lf1.ide.compareToIgnoreCase(lf2.ide);
    }
}