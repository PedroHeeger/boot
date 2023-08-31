package banco_digital.src;

/**
 * Classe principal que demonstra o uso de diferentes tipos de contas em um banco.
 */
public class Main {
    
    /**
     * Ponto de entrada do programa. Cria instâncias de clientes, bancos e contas, e realiza operações.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args){

        // Criando os objetos e definindo o valor dos seus atributos
        Cliente venilton = new Cliente();
        venilton.setNome("Venilton");
        Banco banco = new Banco();
        banco.setNome("Bradesco");

        // Criando os objetos para os tipos de conta utilizando os objetos de cliente e banco
        IConta cc = new ContaCorrente(venilton, banco);
        IConta poupanca = new ContaPoupanca(venilton, banco);

        // Realizando operações
        cc.depositar(200);
        cc.transferir(100, poupanca);
        cc.sacar(50);
        // Imprimindo extratos
        cc.imprimirExtrato();
        poupanca.imprimirExtrato();

        // Realizando operações
        poupanca.depositar(100);
        poupanca.transferir(100, cc);
        poupanca.sacar(50);
        // Imprimindo extratos
        cc.imprimirExtrato();
        poupanca.imprimirExtrato();
    }
}