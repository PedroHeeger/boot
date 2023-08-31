/**
 * Classe que representa um navegador de internet.
 */
public class NavegadorInternet {
    
    /**
     * Exibe uma página da web a partir de uma url.
     *
     * @param url URL da página que será acessada.
     */
    public void exibirPagina(String url){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método exibirPagina");
        System.out.println("A Página " + url + " está sendo exibida!");
    }

    /**
     * Adiciona uma nova aba no navegador.
     */
    public void adicionarNovaAba(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método adicionarNovaAba");
        System.out.println("Nova aba adicionada!");
    }

    /**
     * Atualiza a página do navegador.
     */
    public void atualizarPagina(){
        System.out.println("-----//-----//-----//-----//-----//-----//-----");
        System.out.println("Método atualizarPagina");
        System.out.println("Página atualizada!");
    }
}