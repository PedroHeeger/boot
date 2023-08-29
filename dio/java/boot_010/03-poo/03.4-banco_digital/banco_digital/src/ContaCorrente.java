package banco_digital.src;

public class ContaCorrente extends Conta{

    public ContaCorrente(Cliente cliente, Banco banco){
        super(cliente, banco);
    }

    // Criar o método para imprimir extrato com o método da impressão das informações
    @Override
    public void imprimirExtrato() {
        System.out.println("=== Extrato Conta Corrente ===");
        super.imprimirInfosComuns();
    }
}