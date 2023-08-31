package banco_digital.src;

/**
 * Interface que define operações básicas para uma conta.
 */
public interface IConta {
    
    /**
     * Realiza um saque na conta.
     *
     * @param valor Valor a ser sacado.
     */
    void sacar(double valor);

    /**
     * Realiza um depósito na conta.
     *
     * @param valor Valor a ser depositado.
     */
    void depositar(double valor);

    /**
     * Transfere um valor da conta atual para outra conta.
     *
     * @param valor Valor a ser transferido.
     * @param contaDestino Conta de destino da transferência.
     */
    void transferir(double valor, IConta contaDestino);

    /**
     * Imprime o extrato da conta.
     */
    void imprimirExtrato();
}