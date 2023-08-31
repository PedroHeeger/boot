package banco_digital.src;

/**
 * Classe que representa uma conta bancária do tipo corrente.
 */
public class ContaCorrente extends Conta{

    /**
     * Construtor da classe ContaCorrente.
     *
     * @param nome Nome do cliente.
     * @param nome Nome do banco.
     */
    public ContaCorrente(Cliente cliente, Banco banco){
        super(cliente, banco);
    }

    /**
     * Imprime o extrato da conta corrente com as informações comuns.
     */
    @Override
    public void imprimirExtrato() {
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("=== Extrato Conta Corrente ===");
        super.imprimirInfosComuns();
    }
}