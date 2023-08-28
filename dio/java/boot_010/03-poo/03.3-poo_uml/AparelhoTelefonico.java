package desafio;

public class AparelhoTelefonico {
    private String numeroTelefone;
    private ReprodutorMusical[] reprodutores;
    private NavegadorInternet[] navegadores;

    // Criar o construtor
    public AparelhoTelefonico(String numeroTelefone, ReprodutorMusical[] reprodutores, NavegadorInternet[] navegadores){
        this.numeroTelefone = numeroTelefone;
        this.reprodutores = reprodutores;
        this.navegadores = navegadores;
    }

    public static void main(String[] args) {
        // Criar os objetos para execução dos métodos
        ReprodutorMusical reprodutor1 = new ReprodutorMusical();
        NavegadorInternet navegador1 = new NavegadorInternet();

        // Criar os arrays
        ReprodutorMusical[] reprodutores = { reprodutor1 };
        NavegadorInternet[] navegadores = { navegador1 };

        // Criar os objetos para execução dos métodos
        AparelhoTelefonico aparelho = new AparelhoTelefonico("123456789", reprodutores, navegadores);
        Musica musica = new Musica("Música A", "Artista A", 180);

        // Executar todos os métodos:
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

    // Métodos
    public void ligar(String numeroDestino){
        System.out.println("Ligando para..." + numeroDestino);
    }

    public void atender(){
        System.out.println("Ligação Atendida!");
    }
    public void iniciarCorreioVoz(){
        System.out.println("Correio de Voz Iniciado");
    }
}
