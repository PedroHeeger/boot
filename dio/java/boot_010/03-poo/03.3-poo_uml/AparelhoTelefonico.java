/**
 * Classe que representa um aparelho telefônico.
 */
public class AparelhoTelefonico {
    private String numeroTelefone;
    private ReprodutorMusical[] reprodutores;
    private NavegadorInternet[] navegadores;

    /**
     * Construtor da classe AparelhoTelefonico.
     *
     * @param numeroTelefone Número do telefone associado ao aparelho.
     * @param reprodutores Reprodutores musicais disponíveis no aparelho.
     * @param navegadores Navegadores de internet disponíveis no aparelho.
     */
    public AparelhoTelefonico(String numeroTelefone, ReprodutorMusical[] reprodutores, NavegadorInternet[] navegadores){
        this.numeroTelefone = numeroTelefone;
        this.reprodutores = reprodutores;
        this.navegadores = navegadores;
    }

    /**
     * Ponto de entrada do programa. Cria instâncias de reprodutores musicais, navegadores de internet, 
     * aparelho de telefones, músicas, e realiza operações.
     *
     * @param args Os argumentos da linha de comando (não são utilizados neste exemplo).
     */
    public static void main(String[] args) {
        // Criando os objetos para execução dos métodos
        ReprodutorMusical reprodutor1 = new ReprodutorMusical();
        NavegadorInternet navegador1 = new NavegadorInternet();

        // Criando os arrays, pois o aparelho pode ter mais de um navegador de internet e reprodutor musical
        ReprodutorMusical[] reprodutores = { reprodutor1 };
        NavegadorInternet[] navegadores = { navegador1 };

        // Criando os objetos para execução dos métodos
        AparelhoTelefonico aparelho = new AparelhoTelefonico("123456789", reprodutores, navegadores);
        Musica musica = new Musica("Música A", "Artista A", 180);

        // Executando todos os métodos:
        aparelho.ligar("987654321");
        aparelho.atender();
        aparelho.iniciarCorreioVoz();
        reprodutor1.tocar();
        reprodutor1.selecionarMusica(musica);
        reprodutor1.pausar();
        navegador1.exibirPagina("https://www.exmple.com");
        navegador1.adicionarNovaAba();
        navegador1.atualizarPagina();
    }

    /**
     * Liga para um número de destino informado.
     * 
     * @param numeroDestino Número de destino que deseja ligar. 
     */
    public void ligar(String numeroDestino){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método ligar");
        System.out.println("Ligando para..." + numeroDestino);
    }

    /**
     * Atende uma ligação.
     */
    public void atender(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método atender");
        System.out.println("Ligação atendida!");
    }

    /**
     * Inicia um correio de voz
     */
    public void iniciarCorreioVoz(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método iniciarCorreioVoz");
        System.out.println("Correio de voz iniciado");
    }
}
