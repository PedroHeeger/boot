import java.util.concurrent.ThreadLocalRandom;
import java.util.Random;

/**
 * Classe que representa um processo seletivo.
 */
public class ProcessoSeletivo {

    /**
     * Ponto de entrada do programa. Executa uma série de ações relacionadas à seleção de candidatos.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        // Executando o método analisarCandidato
        analisarCandidato(1800.00);
        analisarCandidato(200.00);
        analisarCandidato(2200.00);

        // Executando o método selecionarCandidatos
        selecionarCandidatos();

        // Executando o método imprimirCandidatos
        imprimirCandidatos();

        // Executando o método entrarEmContato com cada candidato da matriz criada
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto"};
        for(String candidato: candidatos){
            entrarEmContato(candidato);
        }
    }

    /**
     * Análisa o salário pretendido pelo candidato se é maior, igual ou menor que o salário base, 
     * determinando se haverá um contato ao candidato, se haverá uma contra proposta ou se será
     * aguardado a pretensão salarial de novos candidatos.
     * 
     * @param salarioPretendido Salário pretendido pelo candidato.
     */
    static void analisarCandidato(double salarioPretendido){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método analisarCandidato");
        double salarioBase = 2000.0;
        if(salarioBase > salarioPretendido){
            System.out.println("Ligar para o candidato");
        } else if(salarioBase == salarioPretendido){
            System.out.println("Ligar para o candidato com contra proposta");
        } else {System.out.println("Aguardando o resultado dos demais candidatos");}
    }    

    /**
     * Cria um array com nomes de candidatos e itera este array, determinando um salario pretendido com o método valorPretendido,
     * formata esse valor, e imprimir quanto cada candidato solicitou de salário, se o salário solicitado for menor ou igual ao 
     * salário base, é exibido que o candidato foi selecionado para a vaga.
     */
    static void selecionarCandidatos(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método selecionarCandidatos");
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto", "Monica", "Fabrício", "Mirela", "Daniela", "Joelma"};

        int candidatosSelecionados = 0;
        int candidatosAtual = 0;
        double salarioBase = 2000.0;

        // Percorrendo o tamanho do array
        while(candidatosSelecionados < 5 && candidatosAtual < candidatos.length){
            String candidato = candidatos[candidatosAtual];
            double salarioPretendido = valorPretendido();
            String salarioFormatado = String.format("%.2f", salarioPretendido);

            // Exibindo quanto cada candidato solicitou de salário e determinando se foi ou não selecionado para a vaga
            System.out.println("O candidato " + candidato + " solicitou este valor de salário " + salarioFormatado);
            if(salarioBase >= salarioPretendido)  {
                System.out.println("O candidato " + candidato + " foi selecionado para a vaga");
                candidatosSelecionados++;
            }
            candidatosAtual++;
        }
    }

    /**
     * Imprimi a lista de candidatos a partir de uma matriz criada com nomes de candidatos de duas maneiras.
     * A primeira iterando com o for e a segunda iterando com o for each.
     */
    static void imprimirCandidatos(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método imprimirCandidatos");
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto"};

        System.out.println("Imprimindo a lista de candidatos informando o índice do elemento");
        for(int indice=0; indice < candidatos.length; indice++){
            System.out.println("O candidato de nº" + (indice+1) + " é o " + candidatos[indice]);
        }

        System.out.println("Imprimindo a lista de candidatos com o for each");
        for(String candidato: candidatos){
            System.out.println("O candidato selecionado foi " + candidato);
        }
    }

    /**
     * Recebe um nome de candidato para tentar entrar em contato e com o valor booleano gerado pelo método
     * atender, é determinado se o candidato atendeu ou não a ligação. Logo, se ele atendeu, não é mais necessário
     * entrar em contato e então é imprimido que o contato foi realizado com sucesso. Caso ele não atenda, é realizada
     * uma quantidade de tentativas determinada. Após atender ou não, é exibindo uma mensagem informando se foi obtido
     * o contato ou não e quantas tentativas foram realizadas.
     */
    static void entrarEmContato(String candidato){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método entrarEmContato");
        int tentativasRealizadas = 1;
        boolean continuarTentando = true;
        boolean atendeu = false;

        // Tentando entrar em contato com o candidato
        do {
            atendeu = atender();
            continuarTentando = !atendeu;
            if(continuarTentando){
                tentativasRealizadas++;
            }else {
                System.out.println("Contato realizado com sucesso");
            }

        }while(continuarTentando && tentativasRealizadas<3);

        // Exibindo mensagens diferentes para os candidatos que atenderam e os que não atenderam
        if(atendeu){
            System.out.println("Conseguimos contato com " + candidato + " na " + tentativasRealizadas + " Tentativa");
        } else {
            System.out.println("Não conseguimos contato com " + candidato + ", número maximo tentativas " + tentativasRealizadas + " Realizada");
        }
    }

    /**
     * Gera um valor randômico com limite definido, sendo esse limite a quantidade de índices a partir de 0.
     * Logo se o limite definido é 3, os números possíveis são 0, 1 e 2. Este valor randômico é utilizado em uma comparação,
     * onde se for igual a um número destes três possíveis é verdadeiro, caso contrário, é falso. O objetivo é criar uma 
     * randomicidade com valores booleanos true e false para determinar se o candidato atendeu ou não o contato.
     * 
     * @return Número booleano para determinar se o candidato atendeu ou não o contato.
     */
    static boolean atender(){
        return new Random().nextInt(3)==1;
    }

    /**
     * Gera um valor randômico entre dois valores determinados para ser utilizado
     * como salário pretendido pelos candidatos
     * 
     * @return Valor pretendido de salário do candidato.
     */
    static double valorPretendido(){
        return ThreadLocalRandom.current().nextDouble(1800, 2200);
    }
}