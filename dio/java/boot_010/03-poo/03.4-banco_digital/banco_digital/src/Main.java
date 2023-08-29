package banco_digital.src;

public class Main {
    
    public static void main(String[] args){
        Cliente venilton = new Cliente();
        venilton.setNome("Venilton");

        Banco banco = new Banco();
        banco.setNome("Bradesco");

        IConta cc = new ContaCorrente(venilton, banco);
        IConta poupanca = new ContaPoupanca(venilton, banco);

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        cc.depositar(200);
        cc.transferir(100, poupanca);
        cc.sacar(50);

        cc.imprimirExtrato();
        poupanca.imprimirExtrato();

        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        poupanca.depositar(100);
        poupanca.transferir(100, cc);
        poupanca.sacar(50);

        cc.imprimirExtrato();
        poupanca.imprimirExtrato();
    }

}