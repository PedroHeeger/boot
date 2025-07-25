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
</div>




<!-- ### Hosts e Serviços Identificados

- **[Host/IP]** - **[Serviço]** - **[Porta]**  
- **Risco identificado:** Descrever o risco encontrado relacionado a esse host/serviço.  
- **Evidência:** Inserir trecho do output do scan, captura ou referência ao arquivo com evidências.   -->



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
    - [corp_net](./outputs/corp_net/):
        - [arp-netdiscover.txt](./outputs/networks/corp_net/arp-netdiscover.txt)
        - [nmap.txt](./outputs/networks/corp_net/nmap.txt)
        - [rustscan.txt](./outputs/networks/corp_net/rustscan.txt)
    - [guest_net](./outputs/guest_net/):
        - [arp-netdiscover.txt](./outputs/networks/guest_net/arp-netdiscover.txt)
        - [nmap.txt](./outputs/networks/guest_net/nmap.txt)
        - [rustscan.txt](./outputs/networks/guest_net/rustscan.txt)
    - [infra_net](./outputs/infra_net/):
        - [arp-netdiscover.txt](./outputs/networks/infra_net/arp-netdiscover.txt)
        - [nmap.txt](./outputs/networks/infra_net/nmap.txt)
        - [rustscan.txt](./outputs/networks/infra_net/rustscan.txt)
- [tools](./outputs/tools/):
    - [arp-netdiscover.txt](./outputs/tools/arp-netdiscover.txt)
    - [nmap-rustscan.txt](./outputs/tools/nmap-rustscan.txt)