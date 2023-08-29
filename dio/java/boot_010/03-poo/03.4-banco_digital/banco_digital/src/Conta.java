package banco_digital.src;

public abstract class Conta implements IConta {

    protected int agencia;
    protected int numero;
    protected double saldo;
    protected Cliente cliente;
    protected Banco banco;

    // Criar uma constante para agência e uma variável sequencial para o número da conta
    private static final int AGENCIA_PADRAO = 1;
    private static int SEQUENCIAL = 1;
    
    // Criar o construtor
    public Conta(Cliente cliente, Banco banco){
        this.agencia = AGENCIA_PADRAO;
        this.numero = SEQUENCIAL++;
        this.cliente = cliente;
        this.banco = banco;
    }

    // Criar os métodos da conta
    @Override
    public void sacar(double valor) {
        saldo -= valor;
    }

    @Override
    public void depositar(double valor) {
        saldo += valor;
    }

    @Override
    public void transferir(double valor, IConta contaDestino) {
        this.sacar(valor);
        contaDestino.depositar(valor);
    }

    // Criar método para imprimir informações comuns no extrato da conta
    protected void imprimirInfosComuns() {
        System.out.println(String.format("Titular: %s", this.cliente.getNome()));
        System.out.println(String.format("Banco: %s", this.banco.getNome()));
        System.out.println(String.format("Agência: %d", this.agencia));
        System.out.println(String.format("Conta: %d", this.numero));
        System.out.println(String.format("Saldo: %.2f", this.saldo));
    }



    // Criar os métodos get
    public int getAgencia() {
        return agencia;
    }

    public int getNumero() {
        return numero;
    }

    public double getSaldo() {
        return saldo;
    }
}
