import java.util.*;

class ExemploList {
    public static void main(String[] args) {
        // Formas de criar uma lista:
        // List notas = new ArrayList(); //antes do java 5 (A melhor forma)
        // ArrayList<Double> notas = new ArrayList<>();
        // List<Double> notas = new ArrayList<>(Arrays.asList(7d, 8.5, 9.3, 5d, 7d, 0d, 3.6));
        
        // Esses dois exemplos sao imutáveis, não é possível adicionar ou remover elementos da lista
        // List<Double> notas = Arrays.asList(7d, 8.5, 9.3, 5d, 7d, 0d, 3.6);
        // notas.add(10d);
        // System.out.println(notas);

        // List<Double> notas = List.of(7d, 8.5, 9.3, 5d, 7d, 0d, 3.6);
        // notas.add(1d);
        // notas.remove(5d);
        // System.out.println(notas);

        // Dada uma lista com 7 notas de um aluno [7, 8.5, 9.3, 5, 7, 0, 3.6], faça:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Crie uma lista e adicione as sete notas: ");
        List<Double> notas = new ArrayList<Double>(); //Generics(jdk 5) - Diamond Operator(jdk 7)
        notas.add(7.0);
        notas.add(8.5);
        notas.add(9.3);
        notas.add(5.0);
        notas.add(7.0);
        notas.add(0.0);
        notas.add(3.6);
        System.out.println(notas.toString());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba a posição da nota 5.0: " + notas.indexOf(5d));

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Adicione na lista a nota 8.0 na posição 4: ");
        notas.add(4, 8d);
        System.out.println(notas);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Substitua a nota 5.0 pela nota 6.0: ");
        notas.set(notas.indexOf(5d), 6.0);
        System.out.println(notas);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Confira se a nota 5.0 está na lista: " + notas.contains(5d));

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba todas as notas na ordem em que foram informados: ");
        for (Double nota : notas) System.out.println(nota);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba a terceira nota adicionada: " + notas.get(2));
        System.out.println(notas.toString());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba a menor nota: " + Collections.min(notas));
        System.out.println("Exiba a maior nota: " + Collections.max(notas));

        // Calculando a soma dos elementos da lista
        Iterator<Double> iterator = notas.iterator();
        Double soma = 0d;
        while(iterator.hasNext()){
            Double next = iterator.next();
            soma += next;
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba a soma dos valores: " + soma);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba a média das notas: " + (soma/notas.size()));

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Remova a nota 0: ");
        notas.remove(0d);
        System.out.println(notas);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Remova a nota da posição 0");
        notas.remove(0);
        System.out.println(notas);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Remova as notas menores que 7 e exiba a lista: ");
        Iterator<Double> iterator1 = notas.iterator();
        while(iterator1.hasNext()) {
            Double next = iterator1.next();
            if(next < 7) iterator1.remove();
        }
        System.out.println(notas);

        // System.out.println("-----//-----//-----//-----//-----//-----//-----");
        // System.out.println("Apague toda a lista");
        // notas.clear();
        // System.out.println(notas);
        
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Confira se a lista está vazia: " + notas.isEmpty());

/*
Para você: Resolva esses exercícios utilizando os métodos da implementação LinkedList:

        System.out.println("Crie uma lista chamada notas2 " +
                "e coloque todos os elementos da list Arraylist nessa nova lista: ");

        System.out.println("Mostre a primeira nota da nova lista sem removê-lo: ");

        System.out.println("Mostre a primeira nota da nova lista removendo-o: ");
*/
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Implementando a LinkedList com os elementos da ArrayList");
        List<Double> notas2 = new LinkedList<>();
        Iterator<Double> iterator2 = notas.iterator();
        while(iterator2.hasNext()) {
            Double next = iterator2.next();
            notas2.add(next);
        }
        System.out.println(notas2.toString());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Primeiro elemento da LinkedList: " + notas2.get(0));
        System.out.println(notas2.toString());
        
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Removendo primeiro elemento da LinkedList: " + notas2.remove(0));
        System.out.println(notas2);
    }
}