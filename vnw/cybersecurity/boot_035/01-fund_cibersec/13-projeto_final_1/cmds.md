# Comandos Utilizados

Este documento apresenta os principais comandos e técnicas empregados durante a análise de rede e varredura dos hosts conectados à máquina Analyst. As etapas são organizadas em duas fases principais: o reconhecimento inicial das interfaces e dispositivos ativos, seguido pela varredura detalhada para identificação dos serviços, versões e possíveis vulnerabilidades. Cada seção inclui uma explicação dos objetivos, o raciocínio por trás da escolha dos comandos e exemplos práticos utilizados no processo.

## 1 Reconhecimento Inicial
### 1.1 Identificação de Interfaces e Sub-redes
- Explicação: Visualização das interfaces de rede ativas na máquina Analyst, com seus endereços IP, para identificar a quais sub-redes esse host estava conectado.
- Raciocínio: Como cada interface possui um endereço IP com dois primeiros octetos iguais, é possível inferir que elas estão conectadas a diferentes sub-redes dentro de uma mesma rede corporativa. A identificação dessas interfaces é essencial para direcionar os próximos passos de varredura e descoberta.
- Comandos Utilizados:
    - `ip`:
        - `ip a` / `ip addr` / `ip address`: Comando moderno usado para exibir informações sobre as interfaces de rede no sistema, incluindo endereços IP, status (UP/DOWN), MAC address, etc. É parte do pacote `iproute2` e substitui comandos mais antigos como `ifconfig`.
        - `ip a | grep inet > recon-redes.txt`: Executa o comando `ip a`, filtra apenas as linhas que contêm endereços IP (`inet`) e redireciona a saída para o arquivo `recon-redes.txt`. Isso ajuda a registrar apenas os IPs atribuídos às interfaces de rede, ignorando outras informações.
    - `ifconfig`: Comando legado que mostra informações sobre as interfaces de rede, como IP, máscara de sub-rede e estado da interface. Ainda está presente em algumas distribuições, mas foi substituído pelo `ip` em sistemas mais recentes.
    - `ping`:  
        - `ping -c 3 10.10.10.1`: Envia 3 pacotes ICMP para o IP `10.10.10.1` para verificar se o host está acessível e medir o tempo de resposta.
        - `ping -c 3 10.10.30.1`: Envia 3 pacotes ICMP para o IP `10.10.30.1` para testar a conectividade e latência.
        - `ping -c 3 10.10.50.1`: Envia 3 pacotes ICMP para o IP `10.10.50.1` com o objetivo de verificar se o destino está ativo e responderá aos pacotes.


### 1.2 Descoberta de Hosts na Rede Local
- Explicação: Nesta etapa, são identificados os dispositivos que estão ativos nas redes locais conectadas a máquina de análise. Para isso, utilizam-se técnicas que enviam mensagens especiais para descobrir quais máquinas respondem, usando protocolos como ARP (que mapeia endereços IP para endereços físicos, como o MAC) e ICMP (protocolo usado pelo comando ping).
- Raciocínio: Ao analisar cada sub-rede separadamente, é possível criar uma lista precisa dos dispositivos presentes, incluindo seus endereços IP, nomes (quando disponíveis) e endereços físicos (MAC). Esse inventário inicial é essencial para entender o ambiente de rede e direcionar as próximas análises, garantindo que os serviços e potenciais vulnerabilidades de cada host sejam investigados.
- Comandos Utilizados:
    - `nmap`:
        - Comando Base: `nmap -sn -T4 10.10.10.0/24`; `nmap -sn -T4 10.10.30.0/24`; `nmap -sn -T4 10.10.50.0/24`: Realiza uma varredura rápida de ping (ping scan) nas redes especificadas para identificar hosts ativos.
        - IPs:
            - `nmap -sn -T4 10.10.10.0/24 -oG - | awk '/Up$/{print $2}' | tee corp_net_ips.txt`: Faz uma varredura rápida de ping na rede `10.10.10.0/24`, extrai os IPs ativos e salva no arquivo `corp_net_ips.txt`.
            - `nmap -sn -T4 10.10.30.0/24 -oG - | awk '/Up$/{print $2}' | tee guest_net_ips.txt`: Repete o mesmo processo na rede `10.10.30.0/24`, salvando os IPs ativos em `guest_net_ips.txt`.
            - `nmap -sn -T4 10.10.50.0/24 -oG - | awk '/Up$/{print $2}' | tee infra_net_ips.txt`: Faz uma varredura rápida de ping na rede `10.10.50.0/24`, armazenando os IPs dos hosts ativos em `infra_net_ips.txt`.
        - IPs + Hosts:
            - `nmap -sn -T4 10.10.10.0/24 -oG - | awk '/Up$/{print $2, $3}' | tee corp_net_ips_hosts.txt`: Faz a mesma varredura rápida na rede `10.10.10.0/24`, mas extrai tanto o IP quanto o nome do host (quando disponível) e salva em `corp_net_ips_hosts.txt`.
            - `nmap -sn -T4 10.10.30.0/24 -oG - | awk '/Up$/{print $2, $3}' | tee guest_net_ips_hosts.txt`: Extrai IP e nome do host da rede `10.10.30.0/24`, salvando no arquivo `guest_net_ips_hosts.txt`.
            - `nmap -sn -T4 10.10.50.0/24 -oG - | awk '/Up$/{print $2, $3}' | tee infra_net_ips_hosts.txt`: Realiza o mesmo para a rede `10.10.50.0/24`, com IPs e nomes de hosts, armazenando em `infra_net_ips_hosts.txt`.
    - `arp-scan`:
        - `arp-scan --interface=eth0 --localnet`: Realiza uma varredura ARP na rede local diretamente conectada à interface `eth0`, identificando todos os hosts ativos e seus endereços MAC sem precisar especificar a faixa de IP, pois o comando detecta automaticamente a sub-rede associada à interface.
        - `arp-scan --interface=eth2 --localnet`: Executa a varredura ARP na rede local vinculada à interface `eth2`, descobrindo dispositivos ativos na sub-rede dessa interface e exibindo seus endereços físicos (MAC).
        - `arp-scan --interface=eth1 --localnet`: Efetua a varredura ARP na sub-rede local da interface `eth1`, listando os hosts conectados e seus respectivos endereços MAC, sem necessidade de informar o intervalo de IPs explicitamente.
    - `netdiscover`:
        - `netdiscover -i eth0 -r 10.10.10.0/24 -P`: Executa uma varredura ARP na sub-rede `10.10.10.0/24` utilizando a interface de rede `eth0`, identificando os hosts ativos e seus respectivos endereços MAC. A flag `-P` desativa o modo interativo (curses), imprimindo a saída diretamente no terminal.
        - `netdiscover -i eth2 -r 10.10.30.0/24 -P`: Realiza a mesma varredura ARP na sub-rede `10.10.30.0/24` pela interface `eth2`, listando os dispositivos ativos e seus endereços MAC. A opção `-P` garante a execução fora do modo interativo, com saída direta no terminal.
        - `netdiscover -i eth1 -r 10.10.50.0/24 -P`: Executa a varredura ARP na sub-rede `10.10.50.0/24` pela interface `eth1`, identificando hosts conectados e seus endereços físicos (MAC). O uso da flag `-P` evita o modo interativo, facilitando o redirecionamento ou processamento da saída.
    - `arp`:
        - `arp -a > recon_ip_maps.txt`: Exibe a tabela ARP local, listando os IPs e seus respectivos endereços MAC já conhecidos pelo sistema, e salva essa informação no arquivo `recon_ip_maps.txt`.


## 2 Varredura Detalhada
### 2.1 Mapeamento de Serviços e Sistemas Operacionais
- Explicação: Nesta etapa, é feita uma análise detalhada dos dispositivos encontrados para descobrir quais “portas” de comunicação estão abertas, quais serviços estão rodando nelas, suas versões e, quando possível, qual sistema operacional o dispositivo utiliza.
- Raciocínio: Usando ferramentas como **nmap** e **rustscan**, é possível obter informações precisas sobre as tecnologias e serviços ativos em cada dispositivo. Esses dados ajudam a entender melhor os equipamentos na rede, identificar possíveis pontos fracos e avaliar o nível de exposição a riscos.
- Comandos Utilizados:
    - `rustscan`:
        - `rustscan -a 'corp_net_ips.txt' | grep Open > corp_net_ips_ports.txt`: Executa o **Rustscan** nos IPs listados no arquivo `corp_net_ips.txt`, filtra apenas as linhas com portas abertas (`Open`) e salva o resultado no arquivo `corp_net_ips_ports.txt`.
        - `rustscan -a 'guest_net_ips.txt' | grep Open > guest_net_ips_ports.txt`: Executa o **Rustscan** nos IPs listados no arquivo `guest_net_ips.txt`, filtra apenas as linhas com portas abertas e salva o resultado em `guest_net_ips_ports.txt`.
        - `rustscan -a 'infra_net_ips.txt' | grep Open > infra_net_ips_ports.txt`: Executa o **Rustscan** nos IPs listados no arquivo `infra_net_ips.txt`, filtra as portas abertas e salva em `infra_net_ips_ports.txt`.
    - `nmap`:
        - `nmap -sV -O -Pn 10.10.10.0/24`: Realiza uma varredura detalhada na rede `10.10.10.0/24` sem usar ping (`-Pn`), escaneando portas abertas, identificando serviços e suas versões (`-sV`) e detectando o sistema operacional dos hosts (`-O`).
        - `nmap -sV -O -Pn 10.10.30.0/24`: Executa a mesma varredura detalhada na rede `10.10.30.0/24`, escaneando portas e coletando informações sobre serviços, versões e sistemas operacionais, sem a fase de ping.
        - `nmap -sV -O -Pn 10.10.50.0/24`: Faz a varredura completa na rede `10.10.50.0/24` com os mesmos parâmetros, identificando portas abertas, serviços, versões e sistema operacional, ignorando a etapa de ping.


### 2.2 Enumeração de Serviços em Portas Específicas
- Explicação: Depois de descobrir quais portas estão abertas, são usados scripts especializados para coletar mais detalhes sobre serviços específicos (como FTP, SMB, LDAP e sites web).
- Raciocínio: Esses scripts e ferramentas como **nmap** e **curl** ajudam a identificar configurações incorretas, acessos abertos ao público ou informações sensíveis expostas, facilitando a avaliação dos riscos e definindo o que deve ser corrigido com prioridade.
- Comandos Utilizados:
    - `nmap`:
        - `nmap -p 21 --script ftp-anon 10.10.30.10 > guest_net_servico_ftp-anon.txt`: Utilizado para verificar se o serviço FTP permite login anônimo. Essa informação pode indicar uma possível falha de configuração que permita acesso não autorizado a arquivos.
        - `nmap -p 3306 --script mysql-info 10.10.30.11 > guest_net_servico_mysql-info.txt`: Identifica informações do serviço MySQL em execução, como versão e configurações de autenticação, que podem ser exploradas posteriormente.
        - `nmap -p 389 --script ldap-rootdse 10.10.30.17 > guest_net_servico_ldap-rootdse.txt`: Obtém informações do diretório LDAP, como a base DN (Distinguished Name) e o esquema de autenticação, úteis para enumeração de usuários e estrutura do domínio.
        - `nmap -p 445 --script smb-os-discovery,smb-enum-shares 10.10.30.15 > guest_net_servico_smb.txt`: Faz a enumeração do sistema operacional remoto via SMB e descobre compartilhamentos acessíveis na rede, o que pode abrir caminhos para exploração.
    - `curl`:
        - `curl -I http://10.10.30.117 > guest_net_servico_webserver.txt`: Captura apenas os cabeçalhos HTTP para descobrir o tipo de servidor web, status da resposta e possíveis redirecionamentos.
        - `curl http://10.10.30.117 > guest_net_servico_zabbix.txt`: Recupera o conteúdo da página web, permitindo identificar visualmente aplicações hospedadas (como o painel do Zabbix) e avaliar o grau de exposição da interface.