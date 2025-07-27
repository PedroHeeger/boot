# Modelo de Relatório Técnico – Lab Segmentação de Rede

**Autor:** Pedro Heeger Costa  
**Data:** 25/07/25 
**Versão:** 1.0

## Sumário Executivo

[Breve descrição da rede, principais achados e recomendações.]

## Objetivo
Realizar uma análise técnica da rede corporativa segmentada, com foco na identificação de todos os hosts acessíveis, mapeamento dos endereços IP atribuídos, detecção das sub-redes existentes e suas respectivas funções, bem como a avaliação da exposição de serviços, dos riscos de comunicação entre redes e das falhas de segmentação, visando à proposição de medidas de mitigação e melhoria da segurança.

## Escopo
Esta análise abrange um ambiente de rede corporativa simulado, implementado por meio de containers Docker, composto por múltiplos hosts distribuídos em sub-redes segmentadas. Dentro desse contexto, foram considerados o mapeamento de dispositivos acessíveis, a identificação de serviços expostos, a análise das comunicações entre sub-redes e a avaliação da arquitetura de segmentação da rede. Aspectos como segurança física, autenticação de usuários e funcionalidades específicas das aplicações presentes nos dispositivos não foram contemplados nesta análise.

## Metodologia
A análise foi conduzida utilizando abordagens de coleta ativa de dados, explorando as interfaces de rede disponíveis e realizando varreduras detalhadas nos segmentos identificados. Foram utilizadas ferramentas como netdiscover, arp-scan, ping e ip addr para detecção de sub-redes e dispositivos ativos, além de nmap e rustscan para inspeção de serviços expostos, portas abertas e características dos hosts.

Todos os procedimentos foram executados manualmente, com registro dos comandos utilizados, evidências coletadas e organização sistemática das descobertas. A documentação resultante inclui o inventário técnico dos hosts descobertos, diagrama da topologia de rede e análise estruturada dos achados de segurança, apresentados neste relatório técnico.

## Diagrama de Rede

[Inserir aqui ou referenciar anexo .drawio/.png]

## Diagnóstico (Achados)

### Sub-redes Identificadas

O container Analyst possuí três interfaces de rede, cada uma pertencente a uma sub-rede distinta da rede corporativa interna:

<div align="center">
    <table style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">Nome da rede</th>
                <th style="padding: 5px; text-align: center;">Interface</th>
                <th style="padding: 5px; text-align: center;">IP do Container</th>
                <th style="padding: 5px; text-align: center;">Sub-rede</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><div align="center">corp_net</div></td>
                <td><div align="center">eth0</div></td>
                <td><div align="center">10.10.10.2</div></td>
                <td><div align="center">10.10.10.0/24</div></td>
            </tr>
            <tr>
                <td><div align="center">infra_net</div></td>
                <td><div align="center">eth1</div></td>
                <td><div align="center">10.10.50.5</div></td>
                <td><div align="center">10.10.50.0/24</div></td>
            </tr>
            <tr>
                <td><div align="center">guest_net</div></td>
                <td><div align="center">eth2</div></td>
                <td><div align="center">10.10.30.2</div></td>
                <td><div align="center">10.10.30.0/24</div></td>
            </tr>
        </tbody>
    </table>
</div>

Essa configuração permite ao Analyst visibilidade e capacidade de análise em múltiplos segmentos da rede, facilitando o levantamento dos ativos e a avaliação de segmentação e riscos.

### Hosts e Serviços Identificados

<div align="center">
    <h3>Sub-rede 10.10.10.0/24 (corp_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Host</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">SO</th>
            </tr>
        </thead>
        <tbody align="center">
            <tr><td>10.10.10.1</td><td>ip-10-10-10-1.ec2.internal</td><td>Acesso Remoto Seguro</td><td>Linux 4.15-5.19 (Ubuntu) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.10.2</td><td>81961e6c169a</td><td>Varredura e Análise de Rede</td><td>Kali GNU/Linux</td></tr>
            <tr><td>10.10.10.10</td><td>WS_001.projeto_final_opcao_1_corp_net</td><td>Estação de Trabalho 1</td><td>-</td></tr>
            <tr><td>10.10.10.101</td><td>WS_002.projeto_final_opcao_1_corp_net</td><td>Estação de Trabalho 2</td><td>-</td></tr>
            <tr><td>10.10.10.127</td><td>WS_003.projeto_final_opcao_1_corp_net</td><td>Estação de Trabalho 3</td><td>-</td></tr>
            <tr><td>10.10.10.222</td><td>WS_004.projeto_final_opcao_1_corp_net</td><td>Estação de Trabalho 4</td><td>-</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.30.0/24 (guest_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Host</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">SO</th>
            </tr>
        </thead>
        <tbody>
            <tr><td>10.10.30.1</div></td><td>ip-10-10-30-1.ec2.internal</td><td>Acesso Remoto Seguro</td><td>Linux 4.15-5.19 (Ubuntu) / MikroTik RouterOS 7.2-7.5 (Linux 5.6.3) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.2</div></td><td>81961e6c169a</td><td>Varredura e Análise de Rede</td><td>Kali GNU/Linux</td></tr>
            <tr><td>10.10.30.10</div></td><td>ftp-server.projeto_final_opcao_1_infra_net</td><td>Transferência de Arquivos</td><td>Linux 4.15-5.19 / MikroTik RouterOS 7.2-7.5 (Linux 5.6.3) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.11</div></td><td>mysql-server.projeto_final_opcao_1_infra_net</td><td>Banco de Dados</td><td>Linux 4.15-5.19 / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.15</div></td><td>samba-server.projeto_final_opcao_1_infra_net</td><td>Compartilhamento de Arquivos</td><td>Linux 4.15-5.19 / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.17</div></td><td>openldap.projeto_final_opcao_1_infra_net</td><td>Diretório e Autenticação</td><td>Linux 4.15-5.19 / MikroTik RouterOS 7.2-7.5 (Linux 5.6.3) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.117</div></td><td>zabbix-server.projeto_final_opcao_1_infra_net</td><td>Servidor Web / Monitoramento de Redes</td><td>Linux 4.15-5.19 / MikroTik RouterOS 7.2-7.5 (Linux 5.6.3) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.30.227</div></td><td>legacy-server.projeto_final_opcao_1_infra_net</td><td>Servidor Legado</td><td>-</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.50.0/24 (infra_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Host</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">SO</th>
            </tr>
        </thead>
        <tbody align="center">
            <tr><td>10.10.50.1</td><td>ip-10-10-50-1.ec2.internal</td><td>Acesso Remoto Seguro</td><td>Linux 4.15-5.19 (Ubuntu) / MikroTik RouterOS 7.2-7.5 (Linux 5.6.3) / OpenWrt 21.02 (Linux 5.4)</td></tr>
            <tr><td>10.10.50.2</td><td>notebook-carlos.projeto_final_opcao_1_guest_net</td><td>Dispositivo Pessoal (Notebook de Carlos)</td><td>-</td></tr>
            <tr><td>10.10.50.3</td><td>macbook-aline.projeto_final_opcao_1_guest_net</td><td>Dispositivo Pessoal (Macbook de Aline)</td><td>-</td></tr>
            <tr><td>10.10.50.4</td><td>laptop-luiz.projeto_final_opcao_1_guest_net</td><td>Dispositivo Pessoal (Laptop de Luiz)</td><td>-</td></tr>
            <tr><td>10.10.50.5</td><td>laptop-vastro.projeto_final_opcao_1_guest_net</td><td>Dispositivo Pessoal (Laptop Vastro)</td><td>-</td></tr>
            <tr><td>10.10.50.6</td><td>81961e6c169a</td><td>Varredura e Análise de Rede</td><td>Kali GNU/Linux</td></tr>
        </tbody>
    </table>
</div>





### Portas Abertas e Riscos Identificadas

<div align="center">
    <h3>Sub-rede 10.10.10.0/24 (corp_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Porta</th>
                <th style="padding: 5px; text-align: center;">Protocolo</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody align="center">
            <tr><td>10.10.10.1</td><td>22</td><td>SSH</td><td>OpenSSH 9.6</td><td>Porta SSH aberta pode ser vetor para ataques se não estiver bem configurada (ex: senhas fracas).</td><td>Roteador ou Máquina Linux que atua como roteador</td></tr>
            <tr><td>10.10.10.2</td><td>37820; 40754; 45072; 56622; 59102</td><td>Portas Efêmeras/Dinâmicas</td><td>Nmap / Rustscan</td><td>Nenhum risco identificado. Essas portas são utilizadas em varreduras de rede iniciadas a partir do container.</td><td>-</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.30.0/24 (guest_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Porta</th>
                <th style="padding: 5px; text-align: center;">Protocolo</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody align="center">
            <tr><td>10.10.30.1</td><td>22</td><td>SSH</td><td>OpenSSH 9.6</td><td>Porta SSH aberta pode ser vetor para ataques se não estiver bem configurada (ex: senhas fracas).</td><td>Roteador ou Máquina Linux que atua como roteador</td></tr>
            <tr><td>10.10.30.2</td><td>37820; 40754; 45072; 56622; 59102</td><td>Portas Efêmeras/Dinâmicas</td><td>Nmap / Rustscan</td><td>Nenhum risco identificado. Essas portas são utilizadas em varreduras de rede iniciadas a partir do container.</td><td>-</td></tr>
            <tr><td>10.10.30.10</td><td>21</td><td>FTP</td><td>Pure-FTPd</td><td>FTP é um protocolo inseguro, transmite dados e senhas em texto claro, pode ser vetor para ataques. Não foi identificado login anônimo permitido no serviço.</td><td>21-FTP</td></tr>
            <tr><td>10.10.30.11</td><td>3306</td><td>MySQL</td><td>MySQL 8.0.43</td><td>Porta MySQL aberta pode ser vetor para ataques se não estiver protegida (ex: sem autenticação forte, sem firewall). Informações detalhadas do serviço foram obtidas via script mysql-info do Nmap, indicando possibilidade de coleta de informações internas.</td><td>3306-MySQL</td></tr>
            <tr><td>10.10.30.15</td><td>139</td><td>SMB via NetBIOS</td><td>Samba smbd 4</td><td>Porta NetBIOS 139 aberta pode ser vetor para ataques, permitindo exploração de vulnerabilidades no SMB e acesso indevido a compartilhamentos. Presença da porta 139 junto com a 445 amplia a superfície de ataque. Deve ser revisada a configuração para restringir acessos e evitar exposição desnecessária.</td><td>139-SMB</td></tr>
            <tr><td>10.10.30.15</td><td>445</td><td>SMB via TCP</td><td>Samba smbd 4</td><td>Portas SMB abertas podem ser vetor para ataques, como exploração de vulnerabilidades conhecidas no protocolo SMB e serviços Samba. Foi identificado acesso anônimo ao compartilhamento especial IPC$, o que pode indicar má configuração de permissões e possibilitar enumeração de usuários e recursos, representando risco de exposição e acesso indevido.</td><td>445-SMB</td></tr>
            <tr><td>10.10.30.17</td><td>389</td><td>LDAP (Lightweight Directory Access Protocol)</td><td>LDAP</td><td>Porta LDAP aberta permite consultas anônimas RootDSE, expondo informações da estrutura e capacidades do diretório. Isso pode facilitar reconhecimento e mapeamento para ataques posteriores, caso não haja restrições adequadas.</td><td>389-LDAP</td></tr>
            <tr><td>10.10.30.17</td><td>636</td><td>LDAP via SSL/TLS (LDAP seguro)</td><td>LDAPS</td><td>Comunicação segura via SSL/TLS; importante para proteger dados sensíveis.</td><td>636-LADPS</td></tr>
            <tr><td>10.10.30.117</td><td>80</td><td>HTTP</td><td>Nginx</td><td>Porta HTTP aberta pode ser vetor para ataques se o servidor web (nginx) ou PHP não estiverem atualizados ou estiverem mal configurados (ex: vulnerabilidades conhecidas, exposição de informações sensíveis, ataques de injeção, CSRF, XSS). Além disso, a interface web de monitoramento pode ser alvo para tentativas de brute-force ou exploração de falhas específicas do Zabbix.</td><td>80-Nginx</td></tr>
            <tr><td>10.10.30.117</td><td>10051</td><td>Zabbix</td><td>Zabbix Server</td><td>Porta usada para coleta de dados. Pode ser alvo de exploração se mal configurada, sem autenticação forte, permitindo coleta indevida de dados ou injeção de comandos remotos.</td><td>10051-Zabbix Server</td></tr>
            <tr><td>10.10.30.117</td><td>10052</td><td>Zabbix</td><td>Zabbix Proxy</td><td>Porta aberta para proxy, riscos similares ao serviço Zabbix Server, potencial para manipulação de dados, falhas de autenticação ou interceptação de comunicação.</td><td>10052-Zabbix Proxy</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.50.0/24 (infra_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">IP</th>
                <th style="padding: 5px; text-align: center;">Porta</th>
                <th style="padding: 5px; text-align: center;">Protocolo</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody align="center">
            <tr><td>10.10.50.1</td><td>22</td><td>SSH</td><td>OpenSSH 9.6</td><td>Porta SSH aberta pode ser vetor para ataques se não estiver bem configurada (ex: senhas fracas).</td><td>Roteador ou Máquina Linux que atua como roteador</td></tr>
            <tr><td>10.10.50.6</td><td>37820; 40754; 45072; 56622; 59102</td><td>Portas Efêmeras/Dinâmicas</td><td>Nmap / Rustscan</td><td>Nenhum risco identificado. Essas portas são utilizadas em varreduras de rede iniciadas a partir do container.</td><td>-</td></tr>
        </tbody>
    </table>
</div>
















## Recomendações

- Descrever ações específicas e justificativas

## Plano de Ação (80/20)

| Ação                   | Impacto | Facilidade | Prioridade |
|------------------------|---------|------------|------------|
| Isolar printer         | Alto    | Média      | Alta       |
| Remover porta 21       | Médio   | Alta       | Alta       |

## Conclusão

[Resumo da exposição geral e próximos passos.]

## Anexos
- Comandos utilizados
- Saída dos scans
- Prints de ferramentas
- Diagrama da rede

Outputs:
- [docker.txt](./outputs/docker.txt)
- [nets](./outputs/nets/):
    - [ping.txt](./outputs/nets/ping.txt)
    - [port22.txt](./outputs/nets/port22.txt)
    - [recon-ip_maps.txt](./outputs/nets/recon-ip_maps.txt)
    - [recon-redes.txt](./outputs/nets/recon-redes.txt)
    - [versions.txt](./outputs/nets/versions.txt)
    - [corp_net](./outputs/corp_net/):
        - [corp_net_ips.txt](./outputs/nets/corp_net/corp_net_ips.txt)
        - [corp_net_ips_hosts.txt](./outputs/nets/corp_net/corp_net_ips_hosts.txt)
        - [corp_net_ips_ports.txt](./outputs/nets/corp_net/corp_net_ips_ports.txt)
    - [guest_net](./outputs/guest_net/):
        - [guest_net_ips.txt](./outputs/nets/guest_net/guest_net_ips.txt)
        - [guest_net_ips_hosts.txt](./outputs/nets/guest_net/guest_net_ips_hosts.txt)
        - [guest_net_ips_ports.txt](./outputs/nets/guest_net/guest_net_ips_ports.txt)
        - [rustscan.txt](./outputs/nets/guest_net/rustscan.txt)
    - [infra_net](./outputs/infra_net/):
        - [infra_net_ips.txt](./outputs/nets/infra_net/infra_net_ips.txt)
        - [infra_net_ips_hosts.txt](./outputs/nets/infra_net/infra_net_ips_hosts.txt)
        - [infra_net_ips_ports.txt](./outputs/nets/infra_net/infra_net_ips_ports.txt)









































<!-- 
### Hosts e Serviços Identificados

<div align="center">
    <h3>Sub-rede 10.10.10.0/24 (corp_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">Host/IP</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody>
            <tr><td><div align="center">10.10.10.1</div></td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
            <tr><td><div align="center">10.10.10.10</div></td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
            <tr><td><div align="center">10.10.10.101</div></td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
            <tr><td><div align="center">10.10.10.127</div></td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
            <tr><td><div align="center">10.10.10.222</div></td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.30.0/24 (guest_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">Host/IP</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody>
            <tr><td><div align="center">10.10.30.1</div></td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
            <tr><td><div align="center">10.10.30.10</div></td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
            <tr><td><div align="center">10.10.30.11</div></td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
            <tr><td><div align="center">10.10.30.15</div></td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
            <tr><td><div align="center">10.10.30.17</div></td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
            <tr><td><div align="center">10.10.30.117</div></td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
            <tr><td><div align="center">10.10.30.227</div></td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
        </tbody>
    </table>
</div>

<div align="center">
    <h3>Sub-rede 10.10.50.0/24 (infra_net)</h3>
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">Host/IP</th>
                <th style="padding: 5px; text-align: center;">Serviço</th>
                <th style="padding: 5px; text-align: center;">Risco identificado</th>
                <th style="padding: 5px; text-align: center;">Evidência</th>
            </tr>
        </thead>
        <tbody>
            <tr><td><div align="center">10.10.50.1</div></td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
            <tr><td><div align="center">10.10.50.2</div></td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
            <tr><td><div align="center">10.10.50.3</div></td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
            <tr><td><div align="center">10.10.50.4</div></td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
            <tr><td><div align="center">10.10.50.6</div></td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
        </tbody>
    </table>
</div> -->