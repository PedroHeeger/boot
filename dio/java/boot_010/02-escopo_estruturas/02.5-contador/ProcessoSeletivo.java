import java.util.concurrent.ThreadLocalRandom;

public class ProcessoSeletivo {
    public static void main(String[] args) {
        
        // Método 1:
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        analisarCandidato(1800.00);
        analisarCandidato(200.00);
        analisarCandidato(2200.00);

        // Método 2 e 3:
        selecaoCandidatos();
        imprimirCandidatos();

        // Método 4:
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto"};
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        for(String candidato: candidatos){
            entrandoEmContato(candidato);
        }
    }

    // Entrar em contato com o candidato e verifica se ele atendeu ou não
    static void entrandoEmContato(String candidato){
        int tentativasRealizadas = 1;
        boolean continuarTentando = true;
        boolean atendeu = false;

        do {
            atendeu = atender();
            continuarTentando = !atendeu;
            if(continuarTentando){
                tentativasRealizadas++;
            }else {
                System.out.println("Contato realizado com sucesso");
            }

        }while(continuarTentando && tentativasRealizadas<3);

        if(atendeu){
            System.out.println("Conseguimos contato com " + candidato + " na " + tentativasRealizadas + " Tentativa");
        } else {
            System.out.println("Não conseguimos contato com " + candidato + ", número maximo tentativas " + tentativasRealizadas + " Realizada");
        }
    }

    // Determinar o valor booleano true se o valor randômico foi igual a um, indicando que o contato foi atendido (Método Auxiliar)
    static boolean atender(){
        return new Random().nextInt(3)==1;
    }

    // Exibir de duas formas os candidatos
    static void imprimirCandidatos(){
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto"};

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Imprimindo a lista de candidatos informando o índice do elemento");
        for(int indice=0; indice < candidatos.length; indice++){
            System.out.println("O candidato de nº" + (indice+1) + " é o " + candidatos[indice]);
        }

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Forma abreviada de iteração for each");
        for(String candidato: candidatos){
            System.out.println("O candidato selecionado foi " + candidato);
        }
        
    }

    // Selecionar os candidatos com salário pretendido menor ou igual o salário base e exibí-los
    static void selecaoCandidatos(){
        String [] candidatos = {"Felipe", "Marcia", "Julia", "Paulo", "Augusto", "Monica", "Fabrício", "Mirela", "Daniela", "Joelma"};

        int candidatosSelecionados = 0;
        int candidatosAtual = 0;
        double salarioBase = 2000.0;

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        while(candidatosSelecionados < 5 && candidatosAtual < candidatos.length){
            String candidato = candidatos[candidatosAtual];
            double salarioPretendido = valorPretendido();
            String salarioFormatado = String.format("%.2f", salarioPretendido);

            System.out.println("O candidato " + candidato + " solicitou este valor de salário " + salarioFormatado);
            if(salarioBase >= salarioPretendido)  {
                System.out.println("O candidato " + candidato + " foi selecionado para a vaga");
                candidatosSelecionados++;
            }
            candidatosAtual++;
        }
    }

    // Gerar valores randômicos para o salário pretendido pelos candidatos (Método Auxliar)
    static double valorPretendido(){
        return ThreadLocalRandom.current().nextDouble(1800, 2200);
    }

    // Analisar o candidato com base no salário pretendido
    static void analisarCandidato(double salarioPretendido){
        double salarioBase = 2000.0;
        if(salarioBase > salarioPretendido){
            System.out.println("Ligar para o candidato");
        } else if(salarioBase == salarioPretendido){
            System.out.println("Ligar para o candidato com contra proposta");
        } else {System.out.println("Aguardando o resultado dos demais candidatos");}
    }
}