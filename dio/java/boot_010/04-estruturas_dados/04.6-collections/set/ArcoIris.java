import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;
import java.util.LinkedHashSet;
import java.util.Collections;

/**
 * Classe que utiliza seu método para manipular cores do arco-íris.
 */
public class ArcoIris{

    /**
     * Ponto de entrada do programa. Aciona o seu único método.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String [] args){
        executarArcoIris();
    }

    /**
     * Realiza várias manipulações com a estrutura de dados Set e suas
     * estruturas derivadas manipulando suas cores.
     *
     */
    public static void executarArcoIris(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Crie uma conjunto contendo as cores do arco-íris: ");
        Set<String> coresArcoIris = new HashSet<>(){{
            add("violeta");
            add("anil");
            add("azul");
            add("verde");
            add("amarelo");
            add("laranja");
            add("vermelho");
        }};

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba todas as cores o arco-íris uma abaixo da outra: ");
        for (String cor : coresArcoIris){
            System.out.println(cor);
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("A quantidade de cores que o arco-íris tem: " + coresArcoIris.size());

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba as cores em ordem alfabética: ");
        Set<String> coresArcoIris2 = new TreeSet<>(coresArcoIris);
        System.out.println(coresArcoIris2);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba as cores na ordem inversa da que foi informada ");
        Set<String> coresArcoIris3 = new LinkedHashSet<>(Arrays.asList("violeta", "anil", "azul", "verde", "amarelo", "laranja", "vermelho"));
        System.out.println(coresArcoIris3);
        List<String> coresArcoIrisList = new ArrayList<>(coresArcoIris3);
        Collections.reverse(coresArcoIrisList);
        System.out.println(coresArcoIrisList);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Exiba todas as cores que começam com a letra ”v”: ");
        for (String cor : coresArcoIris){
            if(cor.startsWith("v")) System.out.println(cor);
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Remova todas as cores que não começam com a letra “v”: ");
        Set<String> copiaCoresArcoIris = new HashSet<>(coresArcoIris);
        for (String cor : copiaCoresArcoIris){
            if(!cor.startsWith("v")) {
                coresArcoIris.remove(cor);
            }else{
                continue;
            }
        }
        System.out.println(coresArcoIris);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Limpe o conjunto: ");
        coresArcoIris.clear();

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Confira se o conjunto está vazio: " + coresArcoIris.isEmpty());
    }
}