package banco_digital.src;

/**
 * Classe que representa uma conta bancária.
 */
public abstract class Conta implements IConta {

    // Definindo todos atributos acessíveis apenas pela família
    protected int agencia;
    protected int numero;
    protected double saldo;
    protected Cliente cliente;
    protected Banco banco;

    // Criando uma constante para agência e uma variável sequencial para o número da conta
    private static final int AGENCIA_PADRAO = 1;
    private static int squencial = 1;
    
    /**
     * Construtor da classe Conta.
     *
     * @param agencia Número da agência bancária.
     * @param numero Número da conta bancária.
     * @param nome Nome do cliente.
     * @param nome Nome do banco.
     */
    public Conta(Cliente cliente, Banco banco){
        this.agencia = AGENCIA_PADRAO;
        this.numero = squencial++;
        this.cliente = cliente;
        this.banco = banco;
    }

    /**
     * Realiza um depósito na conta.
     *
     * @param valor Valor a ser sacado.
     */
    @Override
    public void sacar(double valor) {
        saldo -= valor;
    }

    /**
     * Aumenta do saldo o valor depositado.
     *
     * @param valor Valor a ser depositado.
     */
    @Override
    public void depositar(double valor) {
        saldo += valor;
    }

    /**
     * Transfere um valor da conta atual para outra conta.
     *
     * @param valor Valor a ser transferido.
     * @param contaDestino Conta de destino da transferência.
     */
    @Override
    public void transferir(double valor, IConta contaDestino) {
        this.sacar(valor);
        contaDestino.depositar(valor);
    }

    /**
     * Imprime informações comuns a qualquer tipo de conta.
     */
    protected void imprimirInfosComuns() {
        System.out.println(String.format("Titular: %s", this.cliente.getNome()));
        System.out.println(String.format("Banco: %s", this.banco.getNome()));
        System.out.println(String.format("Agência: %d", this.agencia));
        System.out.println(String.format("Conta: %d", this.numero));
        System.out.println(String.format("Saldo: %.2f", this.saldo));
    }

    /**
     * Obtém o número da agência.
     *
     * @return Número da agência.
     */
    public int getAgencia() {
        return agencia;
    }

    /**
     * Obtém o número da conta.
     *
     * @return Número da conta.
     */
    public int getNumero() {
        return numero;
    }

    /**
     * Obtém o saldo da conta.
     *
     * @return Saldo da conta.
     */
    public double getSaldo() {
        return saldo;
    }
}
