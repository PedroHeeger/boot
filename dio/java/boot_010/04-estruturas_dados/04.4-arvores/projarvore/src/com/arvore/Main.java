package com.arvore;
import com.model.Obj;

/**
 * Classe principal que mostra o funcionamento de uma estrutura 
 * de dados genérica do tipo árvore binária com execução
 * dos seus métodos.
 */
public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo árvore 
     * binária, determinando seu tipo de dado e adicionando os nós com 
     * seus respectivos conteúdos dentro da classe Fila e manipula essa estrutura 
     * com seus métodos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Ávore Binária----------");
        // Criando a estrutura de dados do tipo árvore binária
        ArvoreBinaria<Obj> arvoreBinaria = new ArvoreBinaria<>();
        
        // Executando o método inserir
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Add");
        arvoreBinaria.insert(new Obj(14));
        arvoreBinaria.insert(new Obj(10));
        arvoreBinaria.insert(new Obj(25));
        arvoreBinaria.insert(new Obj(2));
        arvoreBinaria.insert(new Obj(12));
        arvoreBinaria.insert(new Obj(20));
        arvoreBinaria.insert(new Obj(31));
        arvoreBinaria.insert(new Obj(29));
        arvoreBinaria.insert(new Obj(32));

        // Executando os métodos de exibição
        arvoreBinaria.exibirInOrdem();
        arvoreBinaria.exibirPreOrdem();
        arvoreBinaria.exibirPosOrdem();

        // Executando o método remove
        System.out.println("\n-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Remove");
        Obj objetoParaRemover = new Obj(32);
        System.out.println(objetoParaRemover.toString());
        arvoreBinaria.remove(objetoParaRemover);

        // Executando os métodos de exibição
        arvoreBinaria.exibirInOrdem();
        arvoreBinaria.exibirPreOrdem();
        arvoreBinaria.exibirPosOrdem();
        System.out.println("\n");
    }
}