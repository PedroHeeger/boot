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

### Sub-redes Identificadas no Container Analyst

O container Analyst está conectado a três interfaces de rede, cada uma pertencente a uma sub-rede distinta da rede corporativa interna:

<table align="center" style="border-collapse: collapse;">
  <tr>
    <th style="text-align:center;">Interface</th>
    <th style="text-align:center;">IP do Container</th>
    <th style="text-align:center;">Sub-rede</th>
  </tr>
  <tr>
    <td style="text-align:center;">eth0</td>
    <td style="text-align:center;">10.10.10.2</td>
    <td style="text-align:center;">10.10.10.0/24</td>
  </tr>
  <tr>
    <td style="text-align:center;">eth1</td>
    <td style="text-align:center;">10.10.50.5</td>
    <td style="text-align:center;">10.10.50.0/24</td>
  </tr>
  <tr>
    <td style="text-align:center;">eth2</td>
    <td style="text-align:center;">10.10.30.2</td>
    <td style="text-align:center;">10.10.30.0/24</td>
  </tr>
</table>

Essa configuração permite ao Analyst visibilidade e capacidade de análise em múltiplos segmentos da rede, facilitando o levantamento dos ativos e a avaliação de segmentação e riscos.

## Diagnóstico (Achados)

### Sub-rede 10.10.10.0/24

<table border="1" style="margin-left:auto; margin-right:auto; border-collapse: collapse; text-align: center;">
    <thead>
        <tr>
            <th style="padding: 5px; text-align: center;">Host/IP</th>
            <th style="padding: 5px; text-align: center;">Serviço</th>
            <th style="padding: 5px; text-align: center;">Risco identificado</th>
            <th style="padding: 5px; text-align: center;">Evidência</th>
        </tr>
    </thead>
    <tbody>
        <!-- Sub-rede 10.10.10.0/24 -->
        <tr><td>IP 1</td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
        <tr><td>IP 2</td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
        <tr><td>IP 3</td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
        <tr><td>IP 4</td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
        <tr><td>IP 5</td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
    </tbody>
</table><br>
<table border="1" style="margin-left:auto; margin-right:auto; border-collapse: collapse; text-align: center;">
    <thead>
        <tr>
            <th style="padding: 5px; text-align: center;">Host/IP</th>
            <th style="padding: 5px; text-align: center;">Serviço</th>
            <th style="padding: 5px; text-align: center;">Risco identificado</th>
            <th style="padding: 5px; text-align: center;">Evidência</th>
        </tr>
    </thead>
    <tbody>
        <!-- Sub-rede 10.10.30.0/24 -->
        <tr><td>IP 1</td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
        <tr><td>IP 2</td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
        <tr><td>IP 3</td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
        <tr><td>IP 4</td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
        <tr><td>IP 5</td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
    </tbody>
</table><br>
<table border="1" style="margin-left:auto; margin-right:auto; border-collapse: collapse; text-align: center;">
    <thead>
        <tr>
            <th style="padding: 5px; text-align: center;">Host/IP</th>
            <th style="padding: 5px; text-align: center;">Serviço</th>
            <th style="padding: 5px; text-align: center;">Risco identificado</th>
            <th style="padding: 5px; text-align: center;">Evidência</th>
        </tr>
    </thead>
    <tbody>
        <!-- Sub-rede 10.10.50.0/24 -->
        <tr><td>IP 1</td><td>Serviço X</td><td>Descrever risco do host 1</td><td>Referência ao output ou trecho 1</td></tr>
        <tr><td>IP 2</td><td>Serviço X</td><td>Descrever risco do host 2</td><td>Referência ao output ou trecho 2</td></tr>
        <tr><td>IP 3</td><td>Serviço X</td><td>Descrever risco do host 3</td><td>Referência ao output ou trecho 3</td></tr>
        <tr><td>IP 4</td><td>Serviço X</td><td>Descrever risco do host 4</td><td>Referência ao output ou trecho 4</td></tr>
        <tr><td>IP 5</td><td>Serviço X</td><td>Descrever risco do host 5</td><td>Referência ao output ou trecho 5</td></tr>
    </tbody>
</table>





### Hosts e Serviços Identificados

- **[Host/IP]** - **[Serviço]** - **[Porta]**  
- **Risco identificado:** Descrever o risco encontrado relacionado a esse host/serviço.  
- **Evidência:** Inserir trecho do output do scan, captura ou referência ao arquivo com evidências.  



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
- [environments](./outputs/environments/):
    - [docker_containers.txt](./outputs/environments/docker_containers.txt)
    - [docker_networks.txt](./outputs/environments/docker_networks.txt)
- [networks](./outputs/networks/):
    - [network_interfaces.txt](./outputs/networks/network_interfaces.txt)
    - [eth0](./outputs/eth0/):
        - [arp-netdiscover_eth0.txt](./outputs/networks/eth0/arp-netdiscover_eth0.txt)
        - [nmap_eth0.txt](./outputs/networks/eth0/nmap_eth0.txt)
        - [rustscan_eth0.txt](./outputs/networks/eth0/rustscan_eth0.txt)
    - [eth1](./outputs/eth1/):
        - [arp-netdiscover_eth1.txt](./outputs/networks/eth1/arp-netdiscover_eth1.txt)
        - [nmap_eth1.txt](./outputs/networks/eth1/nmap_eth1.txt)
        - [rustscan_eth1.txt](./outputs/networks/eth1/rustscan_eth1.txt)
    - [eth2](./outputs/eth2/):
        - [arp-netdiscover_eth2.txt](./outputs/networks/eth2/arp-netdiscover_eth2.txt)
        - [nmap_eth2.txt](./outputs/networks/eth2/nmap_eth2.txt)
        - [rustscan_eth2.txt](./outputs/networks/eth2/rustscan_eth2.txt)
- [tools](./outputs/tools/):
    - [arp-netdiscover.txt](./outputs/tools/arp-netdiscover.txt)
    - [nmap-rustscan.txt](./outputs/tools/nmap-rustscan.txt)