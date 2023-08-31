package banco_digital.src;

/**
 * Classe que representa uma conta bancária do tipo poupança.
 */
public class ContaPoupanca extends Conta{

    /**
     * Construtor da classe ContaPoupanca.
     *
     * @param nome Nome do cliente.
     * @param nome Nome do banco.
     */
    public ContaPoupanca(Cliente cliente, Banco banco){
        super(cliente, banco);
    }

    /**
     * Imprime o extrato da conta poupança com as informações comuns.
     */
    @Override
    public void imprimirExtrato() {
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("=== Extrato Conta Poupança ===");
        super.imprimirInfosComuns();
    }
}