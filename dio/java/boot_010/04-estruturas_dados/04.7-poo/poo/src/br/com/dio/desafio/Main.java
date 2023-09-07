package br.com.dio.desafio;

import java.time.LocalDate;
import br.com.dio.desafio.dominio.Curso;
import br.com.dio.desafio.dominio.Dev;
import br.com.dio.desafio.dominio.Mentoria;
import br.com.dio.desafio.dominio.Bootcamp;
import br.com.dio.desafio.dominio.Conteudo;

public class Main {
    public static void main (String [] args){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Criando objetos da classe Curso e exibindo seus conteúdos: ");
        Curso curso1 = new Curso();
        curso1.setTitulo("curso Java");
        curso1.setDescricao("descrição curso Java");
        curso1.setCargaHoraria(8);
        System.out.println(curso1);

        Curso curso2 = new Curso();
        curso2.setTitulo("curso JS");
        curso2.setDescricao("descrição curso JS");
        curso2.setCargaHoraria(4);
        System.out.println(curso2);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Criando objetos da classe Mentoria e exibindo seus conteúdos: ");
        Mentoria mentoria1 = new Mentoria();
        mentoria1.setTitulo("mentoria de Java");
        mentoria1.setDescricao("descrição mentoria Java");
        mentoria1.setData(LocalDate.now());
        System.out.println(mentoria1);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Utilizando a classe base para instaciar objetos das classes derivadas (Polimorfismo): ");
        Conteudo curso3 = new Curso();
        curso3.setTitulo("curso Python");
        curso3.setDescricao("descrição curso Python");
        System.out.println(curso3);

        Conteudo mentoria2 = new Mentoria();
        mentoria2.setTitulo("mentoria de Python");
        mentoria2.setDescricao("descrição mentoria Python");
        System.out.println(mentoria2);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Criando um bootcamp e dois devs e exibindo os devs: ");
        Bootcamp bootcamp = new Bootcamp();
        bootcamp.setNome("Bootcamp Java Developer");
        bootcamp.setDescricao("Descrição Bootcamp Java Developer");
        bootcamp.getConteudos().add(curso1);
        bootcamp.getConteudos().add(curso2);
        bootcamp.getConteudos().add(mentoria1);

        Dev devCamila = new Dev();
        devCamila.setNome("Camila");
        Dev devJoao = new Dev();
        devJoao.setNome("João");

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo os conteúdos que eles estão inscritos: ");
        System.out.println("Conteúdos Inscritos Camila: " + devCamila.getConteudosInscritos());
        System.out.println("Conteúdos Inscritos João: " + devJoao.getConteudosInscritos());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Inscrevendo os devs no bootcamp e exibindo os conteúdos que eles estão inscritos: ");
        devCamila.inscreverBootcamp(bootcamp);
        devJoao.inscreverBootcamp(bootcamp);
        System.out.println("Conteúdos Inscritos Camila: " + devCamila.getConteudosInscritos());
        System.out.println("");
        System.out.println("Conteúdos Inscritos João: " + devJoao.getConteudosInscritos());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exibindo os conteúdos concluídos dos devs: ");
        System.out.println("Conteúdos Concluídos Camila: " + devCamila.getConteudosConcluidos());
        System.out.println("Conteúdos Concluídos João: " + devJoao.getConteudosConcluidos());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Concluindo os conteúdos inscritos dos devs: ");
        devCamila.progredir();
        devCamila.progredir();
        devJoao.progredir();
        System.out.println("Conteúdos Concluídos Camila: " + devCamila.getConteudosConcluidos());
        System.out.println("Conteúdos Concluídos João: " + devJoao.getConteudosConcluidos());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Calculando o XP de cada dev: ");
        System.out.println("Total de XP de Camila: " + devCamila.calcularTotalXp());
        System.out.println("Total de XP de João: " + devJoao.calcularTotalXp());
    }
}