package com.map;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

/**
 * Classe principal que cria um map (dicionário) e executa seus métodos.
 */

public class Main {

    /**
     * Ponto de entrada do programa. Cria uma estrutura de dados do tipo dicionário,
     * e manipula essa estrutura.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        System.out.println("----------Estrutura de Dados Map----------");
        // Criando o objeto map de alunos
        Map<String, String> aluno1 = new HashMap<>();
        Map<String, String> aluno2 = new HashMap<>();
        
        // Adicionando as informações dos alunos
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Put");
        aluno1.put("Nome", "João");
        aluno1.put("Idade", "17");
        aluno1.put("Média", "8.5");
        aluno1.put("Turma", "3a");
        System.out.println(aluno1);

        aluno2.put("Nome", "Maria");
        aluno2.put("Idade", "18");
        aluno2.put("Média", "8.9");
        aluno2.put("Turma", "3b");
        System.out.println(aluno2);

        // Exibindo as chaves do map
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método keySet");
        System.out.println(aluno1.keySet());

        // Exibindo os valores do map
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método Values");
        System.out.println(aluno1.values());

        // Exibindo se o map contém uma chave
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método ContainsKey");
        System.out.println(aluno1.containsKey("Nome"));

        // Criando uma lista de dicionário de alunos
        List<Map<String, String>> listaAlunos = new ArrayList<>();

        // Adicionando os alunos a lista
        listaAlunos.add(aluno1);
        listaAlunos.add(aluno2);

        // Exibindo a lista de alunos
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo a lista de alunos");
        System.out.println(listaAlunos);
    }
}