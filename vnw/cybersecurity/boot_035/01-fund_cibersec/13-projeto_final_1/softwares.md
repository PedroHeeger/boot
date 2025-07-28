# Softwares / Ferramentas

Este documento apresenta uma lista das principais ferramentas e comandos utilizados para análise e diagnóstico da rede. Cada item traz uma breve descrição, função, instruções para instalação e uso, além de dicas importantes para aproveitar melhor cada ferramenta durante o processo de auditoria e monitoramento.

### `ip a` / `ip addr` / `ip address`:
- 🧩 **Descrição:** é um comando do utilitário ip, que faz parte da ferramenta **iproute2**.
- 🔧 **Função:**
    - Exibe todas as interfaces de rede do sistema (ex: eth0, eth1, lo, etc.)
    - Mostra: Nome da interface; IP atribuído (IPv4 e IPv6); Estado da interface (UP/DOWN); MAC address; Máscara (ex: /24); MTU.
- ⚙️ **Instalação:** `apt install iproute2`.
- 📦 **Verificar se está instalado:** `ip -V`.
- 📝 **Principais flags:**
- 📝 **Principais flags:**
    - `a` (ou `addr` / `address`): Exibe todas as interfaces de rede e seus endereços IP configurados no sistema.


### `ifconfig`:
- 🧩 **Descrição:** é um comando legado do pacote **net-tools** para gerenciamento e visualização de interfaces de rede em sistemas Linux.
- 🔧 **Função:** Exibe informações sobre interfaces de rede, incluindo IP, estado e endereço MAC.
- ⚙️ **Instalação:** `apt install net-tools`.
- 📦 **Verificar se está instalado:** `ifconfig -V`.
- 📝 **Principais flags:**
    - `interface`: exibe ou configura informações específicas de uma interface (ex: `ifconfig eth0`).
    - `up`: ativa uma interface de rede (ex: `ifconfig eth0 up`).
    - `down`: desativa uma interface de rede (ex: `ifconfig eth0 down`).
    - `promisc`: coloca a interface em modo promíscuo, capturando todos os pacotes (ex: `ifconfig eth0 promisc`).
    - `netmask`: define a máscara de sub-rede da interface (ex: `ifconfig eth0 netmask 255.255.255.0`).
    - `mtu`: define o tamanho máximo da unidade de transmissão (ex: `ifconfig eth0 mtu 1400`).


### `ping`:
- 🧩 **Descrição:** comando para testar a conectividade entre hosts na rede enviando pacotes ICMP Echo Request e aguardando respostas Echo Reply. Faz parte do pacote **iputils**.
- 🔧 **Função:** verifica se um host está acessível e mede o tempo de resposta.
- ⚙️ **Instalação:** `apt install iputils-ping`.
- 📦 **Verificar se está instalado:** `ping -V` ou `ping --version`.
- 📝 **Principais flags:**
    - `-c 3`: envia apenas 3 pacotes ICMP e encerra o comando (útil para testes rápidos).
    - `-i 1`: define o intervalo de 1 segundo entre os pacotes enviados.
    - `-s 64`: especifica o tamanho do payload em bytes (excluindo cabeçalhos ICMP/IP).
    - `-W 2`: define o tempo máximo (timeout) de espera por resposta, em segundos.


### `arp`
- 🧩 **Descrição:** utilitário do pacote legado **net-tools** para exibir e manipular a tabela ARP (Address Resolution Protocol) local, que mantém mapeamentos entre endereços IP e endereços MAC de dispositivos com os quais a máquina já se comunicou.
- 🔧 **Função:**
  - Exibe a tabela ARP do sistema (cache ARP).
  - Mostra IPs, endereços MAC e nomes de host (se resolvidos).
  - Auxilia na identificação de dispositivos já detectados pela máquina na rede.
- ⚙️ **Instalação:** geralmente já vem instalada junto com o pacote **net-tools**. Se necessário: `apt install net-tools`.
- 📦 **Verificar se está instalado:** `arp -V`
- 📝 **Principais flags:**
  - `-a`: mostra todos os mapeamentos ARP disponíveis em formato legível (IP, MAC e nome de host).
  - `-n`: exibe a tabela ARP sem resolver nomes de host (mais rápido).
  - `-d <IP>`: remove manualmente uma entrada específica da tabela ARP.
  - `-s <IP> <MAC>`: adiciona manualmente uma entrada estática à tabela ARP.
- ⚠️ **Observações:**
  - A tabela ARP só contém hosts com os quais já houve comunicação recente.
  - Não realiza descoberta ativa; funciona apenas como leitura passiva da cache ARP.
  - Requer permissões elevadas (sudo) para adicionar ou remover entradas.


### `arp-scan`:
- 🧩 **Descrição:** ferramenta para descoberta ativa de hosts na rede local usando pacotes ARP. Permite mapear rapidamente dispositivos conectados à sub-rede.
- 🔧 **Função:**
    - Envia requisições ARP para todos os IPs dentro da sub-rede local.
    - Retorna uma lista de IPs ativos, seus endereços MAC e, quando possível, o fabricante do dispositivo (via OUI do MAC).
- ⚙️ **Instalação:** `apt install arp-scan`.
- 📦 **Verificar se está instalado:** `arp-scan --version`.
- 📝 **Principais flags:**
    - `--interface=eth0`: especifica qual interface de rede será usada para a varredura.
    - `--localnet`: faz a varredura automática de todos os IPs pertencentes à sub-rede da interface especificada.
- ⚠️ **Observações:**
    - Requer privilégios de root (sudo).
    - Funciona apenas para redes Ethernet (não faz varredura em redes Wi-Fi usando esse método).


### `netdiscover`:
- 🧩 **Descrição:** ferramenta para descoberta de hosts na rede local usando principalmente pacotes ARP, que pode operar em modo passivo (escutando tráfego) ou ativo (enviando sondagens).
- 🔧 **Função:**
    - Escuta o tráfego ARP da rede para identificar hosts ativos (modo passivo).
    - Pode enviar sondagens ARP para mapear IPs e MACs na sub-rede (modo ativo).
    - Fornece uma lista de IPs ativos, seus endereços MAC e, quando possível, informações do fabricante.
- ⚙️ **Instalação:** `apt install netdiscover`.
- 📦 **Verificar se está instalado:** `netdiscover -h` ou `netdiscover --version`.
- 📝 **Principais flags:**
    - `-i eth0`: especifica a interface de rede a ser utilizada na varredura.
    - `-r 10.10.10.0/24`: define o range de IPs (sub-rede) a ser escaneado.
    - `-p`: modo passivo — escuta o tráfego ARP sem enviar sondagens.
    - `-s`: modo ativo — envia sondagens ARP para descoberta ativa dos hosts.
    - `-c 1`: define quantos ciclos de varredura serão feitos (1 é o mínimo).
    - `-P`: desativa o modo interativo (tela cheia) — ou seja, remove a interface curses.
    - `-N`: não mostra cabeçalhos ou banners (opcional, útil em scripts).
- ⚠️ **Observações:**
    - Requer privilégios de root (sudo) para modo ativo.
    - Pode ser usado em modo passivo para redes onde o envio de pacotes é restrito.


### `nmap`:
- 🧩 **Descrição:** ferramenta poderosa para varredura de redes, utilizada para identificar hosts ativos, portas abertas, serviços e sistemas operacionais.
- 🔧 **Função:**
    - Detecta hosts ativos na rede.
    - Escaneia portas TCP/UDP para identificar quais estão abertas.
    - Identifica versões dos serviços em execução.
    - Pode tentar detectar o sistema operacional do host.
- ⚙️ **Instalação:** `apt install nmap`.
- 📦 **Verificar se está instalado:** `nmap --version`.
- 📝 **Principais flags:**
    - `-sn`: faz uma varredura apenas de descoberta de hosts (ping scan), sem escanear portas.
    - `-T4`: define a velocidade da varredura como agressiva (mais rápida, mas mais ruidosa).
    - `-sV`: realiza detecção de versão dos serviços nas portas abertas.
    - `-O`: tenta identificar o sistema operacional do host.
    - `-Pn`: desativa o ping antes da varredura; útil quando o host não responde a ICMP.
    - `-p`: especifica quais portas escanear (ex: `-p 22,80,443` ou `-p-` para todas).
    - `--script ftp-anon`: verifica se o servidor FTP permite login anônimo.
    - `--script mysql-info`: coleta informações básicas de um servidor MySQL.
    - `--script ldap-rootdse`: extrai dados do root DSE de um serviço LDAP.
    - `--script smb-os-discovery,smb-enum-shares`: detecta o SO via SMB e enumera compartilhamentos disponíveis.
    - `-A`: ativa detecção de OS, versão, script scanning e traceroute (modo "completo").
    - `-sC`: executa os scripts padrão do Nmap (semelhante a `--script=default`).
    - `-sS`: realiza varredura TCP SYN (stealth scan), requer privilégios de root.
    - `-sU`: realiza varredura de portas UDP. 
- ⚠️ **Observações:**
    - Requer privilégios de root (sudo) para varreduras detalhadas e detecção de SO.
    - Pode gerar muito tráfego, usar com cuidado em redes sensíveis.


### `rustscan`:
- 🧩 **Descrição:** scanner rápido de portas que serve como complemento ao nmap, realizando a varredura inicial das portas abertas para depois detalhar com nmap.
- 🔧 **Função:**
    - Varre rapidamente as portas de um host ou faixa IP.
    - Pode passar os resultados para o nmap para análise detalhada.
- ⚙️ **Instalação:** `cargo install rustscan`.
- 📦 **Verificar se está instalado:** `rustscan --version`.
- 📝 **Principais flags:**
    - `-a 10.10.10.1-254`: Define o alvo a ser escaneado, podendo ser um IP único ou um intervalo de IPs no formato início-fim.
    - `--`: Indica o fim dos argumentos do rustscan e o início dos parâmetros que serão passados para o nmap.
- ⚠️ **Observações:**
    - Requer privilégios de root (sudo) para varreduras detalhadas.
    - É mais rápido que o nmap puro, ideal para grandes redes.
    - Não entende a notação CIDR `.0/24`, por isso tem que passar assim `1-254`.


### `curl`:
- 🧩 **Descrição:** ferramenta de linha de comando para transferências de dados com suporte a diversos protocolos, sendo amplamente utilizada para interações HTTP e HTTPS, como testes de disponibilidade e análise de headers.
- 🔧 **Função:**
    - Realiza requisições HTTP/HTTPS para identificar se um serviço web está ativo.
    - Permite inspecionar headers de resposta, conteúdos HTML e status HTTP.
    - Útil para confirmar a presença de aplicações web, como servidores Zabbix, Apache, etc.
- ⚙️ **Instalação:** `apt install curl`.
- 📦 **Verificar se está instalado:** `curl --version`
- 📝 **Principais flags:**
    - `-I`: Realiza uma requisição HEAD e exibe apenas os headers da resposta (ideal para verificar status HTTP e servidor).
    - `-L`: Segue redirecionamentos automaticamente (útil quando a página redireciona para outra URL).
    - `-s`: Modo silencioso, oculta barra de progresso e mensagens (deixa a saída mais limpa).
    - `-o <arquivo>`: Salva a resposta da requisição em um arquivo.
- ⚠️ **Observações:**
    - Muito útil para verificar rapidamente se um serviço web está ativo sem precisar abrir um navegador.
    - Permite testar endpoints específicos, autenticações e conteúdo de APIs REST.
    - Pode ser combinado com ferramentas como `grep`, `head` ou `less` para análises rápidas em linha de comando.  


## Softwares / Ferramentas não utilizados
A seguir, uma pequena lista de ferramentas não utilizadas mas que podem ser utéis em análises de rede:

### `whois`:
- 🧩 **Descrição:** consulta informações públicas de registro de domínios e IPs na internet.
- 🔧 **Função:** obtém dados do proprietário, contato, servidor DNS e status do domínio/IP.
- ⚙️ **Instalação:** `apt install whois`.
- 📦 **Verificar se está instalado:** `whois --version`.
- 📝 **Uso comum:** `whois exemplo.com`.
- ⚠️ **Observações:** útil para identificar responsáveis por domínios e analisar reputação.


### `dig`:
- 🧩 **Descrição:** ferramenta para consultas DNS, usada para resolver nomes e investigar registros DNS.
- 🔧 **Função:** obtém registros A, MX, NS, TXT, entre outros, para domínios.
- ⚙️ **Instalação:** `apt install dnsutils`.
- 📦 **Verificar se está instalado:** `dig -v`.
- 📝 **Uso comum:** `dig exemplo.com`.
- ⚠️ **Observações:** importante para diagnóstico de problemas e configuração de DNS.


### `traceroute`:
- 🧩 **Descrição:** identifica o caminho que pacotes seguem até um destino na rede, mostrando cada salto intermediário.
- 🔧 **Função:** ajuda a detectar onde ocorrem atrasos ou falhas na rota.
- ⚙️ **Instalação:** `apt install traceroute`.
- 📦 **Verificar se está instalado:** `traceroute --version`.
- 📝 **Uso comum:** `traceroute exemplo.com`.
- ⚠️ **Observações:** útil para troubleshooting de conectividade e latência.