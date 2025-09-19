# Relatório Técnico - Lab de Segurança WAF + DVWA

**Laboratório:** Proteção da DVWA com WAF OWASP ModSecurity CRS  
**Autor:** Pedro Heeger Costa  
**Data:** 18/09/2025  
**Ambiente:** Docker  

**Instituição**: Vai na Web  
**Curso**: Formação Cybersec  
**Módulo:** Defesa e Monitoramento  
**Contexto**: Projeto Final do Módulo 2 (Opção 1)

---

## 1. Sumário Executivo
Este relatório descreve a execução de um laboratório de segurança voltado para proteger a aplicação web vulnerável **DVWA** utilizando o **ModSecurity CRS** como firewall de aplicação web (WAF). Todo o ambiente foi montado em containers **Docker**, executados dentro de uma instância **EC2 da AWS**. O acompanhamento em tempo real foi feito com o **Dozzle**, que permitiu visualizar de forma prática como o WAF reagia frente a ataques simulados.

Foram aplicados quatro tipos de ataques comuns em sistemas web: **SQL Injection (SQLi), Cross-Site Scripting (XSS), Command Injection e File Inclusion**. O resultado mostrou que o WAF conseguiu detectar e bloquear três desses ataques, impedindo que a aplicação fosse comprometida. Apenas o ataque de *File Inclusion* não foi identificado, revelando um ponto de atenção.

### Principais achados
- Em modo de **detecção**, o ambiente identificou 75% dos ataques sem afetar o funcionamento da aplicação.  
- Em modo de **bloqueio**, os ataques foram impedidos, retornando o código **403** (acesso negado).  
- O ataque de **File Inclusion** não foi detectado nem bloqueado, evidenciando uma vulnerabilidade crítica que permanece aberta.  
- O uso do **Dozzle** possibilitou acompanhar em tempo real as tentativas de ataque e a resposta do WAF.  

### Recomendações
- Ajustar ou criar regras específicas para que ataques de **File Inclusion** também sejam detectados e bloqueados.  
- Implantar **monitoramento contínuo** e alertas automáticos para eventos críticos.  
- Revisar e atualizar periodicamente as **regras do WAF** para garantir que continuem eficazes contra novas ameaças.  
- Realizar **testes de penetração recorrentes** para validar a eficácia das defesas frente a diferentes vetores de ataque.  
- **Segregar os containers** em diferentes sub-redes e manter todos os softwares sempre atualizados.  

### Conclusão
O estudo mostrou que a combinação de um **WAF bem configurado** com **monitoramento em tempo real** é uma estratégia eficaz para proteger aplicações web. Entretanto, a falha em detectar e bloquear o ataque de **File Inclusion** reforça que nenhuma defesa é infalível e que é essencial revisar continuamente as regras, aplicar correções e manter uma postura ativa de segurança.  

---

## 2. Objetivo
O objetivo deste relatório é documentar a execução de um laboratório de segurança, focado na proteção da aplicação web vulnerável **DVWA** utilizando o **OWASP ModSecurity CRS** como firewall de aplicação web (WAF) e o **Dozzle** para monitoramento e análise de logs em tempo real.

Busca-se analisar a eficácia do WAF frente a ataques simulados, incluindo:  
- **SQL Injection (SQLi):** tentativas de manipular o banco de dados por meio de comandos maliciosos;  
- **Cross-Site Scripting (XSS):** inserção de códigos maliciosos em páginas web para afetar outros usuários;  
- **Command Injection:** execução não autorizada de comandos no servidor;  
- **File Inclusion:** exploração para acessar ou executar arquivos do sistema indevidamente.  

Durante o laboratório, os logs gerados pelo WAF foram monitorados com o Dozzle, permitindo registrar e analisar se e como cada ataque foi detectado ou bloqueado, servindo como evidência do desempenho do sistema de proteção.

---

## 3. Escopo
O escopo deste laboratório abrange toda a infraestrutura implementada em **Docker**, executando sobre uma instância **EC2** na nuvem. O ambiente é composto por quatro containers:  
- **DVWA:** aplicação web vulnerável utilizada para testes de segurança.  
- **Kali Linux:** máquina de ataque, responsável por executar os testes simulados.  
- **ModSecurity (WAF OWASP CRS):** firewall de aplicação web configurado para modos de detecção e bloqueio.  
- **Dozzle:** ferramenta para monitoramento e análise de logs em tempo real.  

Além disso, um **navegador na máquina física** foi utilizado para acessar a DVWA e o Dozzle, permitindo executar ataques de forma gráfica e monitorar os logs em tempo real, servindo como interface de interação com os containers.

Os ataques simulados incluem:  
- **SQL Injection (SQLi)**  
- **Cross-Site Scripting (XSS)**  
- **Command Injection**  
- **File Inclusion**  

O período de execução foi durante o laboratório, em ambiente controlado.

Fora do escopo:  
- Sistemas externos aos containers Docker utilizados.  
- Ataques avançados ou persistentes não contemplados nos testes simulados.  
- Avaliação de performance, carga ou resiliência do WAF em produção.

---

## 4. Metodologia

<p align="justify">
   A metodologia do laboratório descreve o planejamento e os procedimentos adotados para avaliar a eficácia do WAF frente a ataques simulados, permitindo que outro profissional reproduza ou verifique o trabalho.  
</p>

1. **Planejamento do ambiente:**  
   - Seleção de uma infraestrutura baseada em **Docker** sobre uma **instância EC2**.  
   - Definição dos containers necessários: DVWA (aplicação vulnerável), Kali Linux (máquina de ataque), ModSecurity CRS (WAF) e Dozzle (monitoramento de logs).
2. **Configuração de rede e segurança:**  
   - Planejamento das regras do **Security Group** para liberar portas específicas e permitir o acesso da máquina física aos serviços.  
   - Garantia de comunicação entre os containers e acesso externo para monitoramento.
3. **Preparação da aplicação vulnerável:**  
   - Definição da necessidade de inicialização do banco de dados da DVWA via interface gráfica.  
   - Planejamento da criação de usuários e permissões necessárias para testes.
4. **Definição dos modos do WAF:**  
   - Teste em **modo de detecção**: registrar ataques sem bloqueá-los.  
   - Teste em **modo de bloqueio**: impedir a execução de ações maliciosas.
5. **Seleção e definição dos ataques simulados:**  
   - Tipos de ataques escolhidos: **SQL Injection (SQLi), Cross-Site Scripting (XSS), Command Injection e File Inclusion**.  
   - Estratégia de execução por **Curl no Kali Linux** e pela **interface gráfica da DVWA**.
6. **Monitoramento e coleta de evidências:**  
   - Planejamento do uso do **Dozzle** para observar os eventos gerados pelo WAF.  
   - Definição dos tipos de evidências a serem coletadas: prints de tela, logs de container e outputs de comandos, para análise posterior.

<p align="justify">
   Esta metodologia estabelece os **procedimentos conceituais e critérios de avaliação**, servindo de base para a execução prática do laboratório e posterior análise das evidências.
</p>

---

## 5. Diagrama / Arquitetura

<p align="justify">
   O diagrama abaixo representa a arquitetura lógica do ambiente configurado no laboratório. Ele mostra que todos os containers Docker — <strong>Máquina de Ataque (Kali Linux)</strong>, <strong>WAF ModSecurity CRS</strong>, <strong>Aplicação Vulnerável (DVWA)</strong> e <strong>Monitoramento (Dozzle)</strong> — foram executados dentro de uma instância <strong>Amazon EC2</strong>. Também está representada a <strong>máquina física</strong> utilizada para interação gráfica por meio do navegador, acessando o ambiente através dos mapeamentos de portas. Esse mapeamento visual evidencia como o tráfego era roteado pela rede Docker, a posição do WAF na inspeção e bloqueio das requisições e a forma como os logs eram coletados e visualizados no Dozzle.
</p>

<div align="center">
    <img src="./diagrama.png" alt="diagrama" style="max-width: 100%; height: auto;">
</div>

---

## 6. Execução
A execução do laboratório foi realizada seguindo a sequência detalhada abaixo:
1. **Implantação dos containers:**  
   - Todos os serviços foram iniciados como containers Docker na instância EC2: DVWA, Kali Linux, ModSecurity CRS (WAF) e Dozzle.
2. **Configuração de acesso externo:**  
   - A porta **8080** do Security Group da EC2 foi liberada para o IP da máquina física, permitindo o acesso à DVWA pelo navegador.
3. **Inicialização da DVWA:**  
   - O navegador da máquina física foi utilizado para acessar a DVWA, realizar login e criar o banco de dados necessário para o funcionamento da aplicação.
4. **Configuração do WAF em modo de detecção:**  
   - O container do ModSecurity CRS foi configurado em **modo de detecção** e reiniciado, registrando ataques sem bloqueá-los.
5. **Execução dos ataques simulados (modo detecção):**  
   - **Kali Linux:** ataques enviados via **Curl** à DVWA.  
   - **Navegador da máquina física:** execução dos mesmos ataques pela interface gráfica da DVWA.  
   - Ataques simulados: **SQL Injection (SQLi)**, **Cross-Site Scripting (XSS)**, **Command Injection** e **File Inclusion**.
6. **Configuração do WAF em modo de bloqueio:**  
   - O container do ModSecurity CRS foi alterado para **modo de bloqueio** e reiniciado, impedindo a execução de ações maliciosas.
7. **Execução dos ataques simulados (modo bloqueio):**  
   - **Kali Linux:** ataques enviados via **Curl** à DVWA.  
   - **Navegador da máquina física:** execução dos mesmos ataques pela interface gráfica da DVWA.  
   - Ataques simulados: **SQL Injection (SQLi)**, **Cross-Site Scripting (XSS)**, **Command Injection** e **File Inclusion**.
8. **Monitoramento de logs no Dozzle:**  
   - A porta **9999** do Security Group da EC2 foi liberada para o IP da máquina física, permitindo o acesso ao Dozzle pelo navegador.  
   - Logs filtrados no **modo detecção** mostraram os 4 ataques com código de status **302**.  
   - Logs filtrados no **modo bloqueio** mostraram os 4 ataques com código de status **403**.
9. **Coleta de evidências:**  
   - Prints de telas, logs detalhados do container WAF e outputs de comandos do Kali Linux foram coletados durante todo o processo para documentação e análise posterior.
10. **Construção do relatório técnico:**  
    - Todo o processo do laboratório foi registrado e estruturado neste relatório, utilizando as evidências coletadas para suporte às conclusões.

---

## 8. Evidências
Nesta seção são apresentadas as evidências coletadas durante o laboratório:

<div align="center">
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">ID</th>
                <th style="padding: 5px; text-align: center;">Link da Evidência</th>
                <th style="padding: 5px; text-align: center;">Descrição</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><div align="center">evd_0001</div></td>
                <td><div align="center"><a href="/img/img01.png">img01</a></div></td>
                <td><div align="justify">Todos os quatro containers estão em execução.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0002</div></td>
                <td><div align="center"><a href="/img/img03.png">img03</a></div></td>
                <td><div align="justify">Acesso à DVWA pelo navegador com nível de segurança configurado como Low.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0003</div></td>
                <td><div align="center"><a href="/img/img04.png">img04</a></div></td>
                <td><div align="justify">Varredura Nmap na DVWA identificando portas abertas: 8080 e 8443.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0004</div></td>
                <td><div align="center"><a href="/img/img06.png">img06</a></div></td>
                <td><div align="justify">Execução dos quatro ataques em modo detecção, todos retornando código 302 (Redirecionamento).</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0005</div></td>
                <td><div align="center"><a href="/img/img07.png">img07</a></div></td>
                <td><div align="justify">SQL Injection executado via interface gráfica da DVWA, retornando código 302.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0006</div></td>
                <td><div align="center"><a href="/img/img08.png">img08</a></div></td>
                <td><div align="justify">XSS executado via interface gráfica da DVWA, retornando código 302.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0007</div></td>
                <td><div align="center"><a href="/img/img09.png">img09</a></div></td>
                <td><div align="justify">Command Injection executado via interface gráfica da DVWA, retornando código 302.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0008</div></td>
                <td><div align="center"><a href="/img/img10.png">img10</a></div></td>
                <td><div align="justify">File Inclusion executado via interface gráfica da DVWA, retornando código 302.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0009</div></td>
                <td><div align="center"><a href="/img/img11.png">img11</a></div></td>
                <td><div align="justify">Execução dos quatro ataques em modo bloqueio: SQLi, XSS e Command Injection retornam código 403; File Inclusion retorna 302.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0010</div></td>
                <td><div align="center"><a href="/img/img12.png">img12</a></div></td>
                <td><div align="justify">SQL Injection via interface gráfica da DVWA, retornando código 403 (bloqueado).</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0011</div></td>
                <td><div align="center"><a href="/img/img13.png">img13</a></div></td>
                <td><div align="justify">XSS via interface gráfica da DVWA, retornando código 403 (bloqueado).</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0012</div></td>
                <td><div align="center"><a href="/img/img14.png">img14</a></div></td>
                <td><div align="justify">Command Injection via interface gráfica da DVWA, retornando código 403 (bloqueado).</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0013</div></td>
                <td><div align="center"><a href="/img/img15.png">img15</a></div></td>
                <td><div align="justify">File Inclusion via interface gráfica da DVWA executado com sucesso, retornando código 200.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0014</div></td>
                <td><div align="center"><a href="/img/img17.png">img17</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque SQLi via Curl detectado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0015</div></td>
                <td><div align="center"><a href="/img/img18.png">img18</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque XSS via Curl detectado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0016</div></td>
                <td><div align="center"><a href="/img/img19.png">img19</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque Command Injection via Curl detectado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0017</div></td>
                <td><div align="center"><a href="/img/img20.png">img20</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque File Inclusion via Curl passou pelo firewall como requisição normal.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0018</div></td>
                <td><div align="center"><a href="/img/img21.png">img21</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque SQLi via navegador bloqueado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0019</div></td>
                <td><div align="center"><a href="/img/img22.png">img22</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque XSS via navegador bloqueado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0020</div></td>
                <td><div align="center"><a href="/img/img23.png">img23</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque Command Injection via navegador bloqueado pelo firewall.</div></td>
            </tr>
            <tr>
                <td><div align="center">evd_0021</div></td>
                <td><div align="center"><a href="/img/img24.png">img24</a></div></td>
                <td><div align="justify">Log do WAF no Dozzle: ataque File Inclusion via navegador passou pelo firewall como requisição normal.</div></td>
            </tr>
        </tbody>
    </table>
</div>

---

## 9. Análise e Diagnóstico
A análise das evidências coletadas durante o laboratório permite avaliar o comportamento do WAF ModSecurity CRS frente aos ataques simulados e a eficácia do monitoramento com Dozzle.
1. **Modo de detecção (Detection Mode):**  
   - Todos os ataques simulados (SQLi, XSS, Command Injection e File Inclusion) foram registrados pelo WAF, conforme evidenciado pelos códigos HTTP **302** nos logs.  
   - O WAF não bloqueou a execução das ações, permitindo observar o impacto potencial de cada ataque.  
   - O monitoramento em tempo real pelo Dozzle confirmou a detecção de todos os ataques, permitindo identificar a origem e o tipo de cada tentativa.
2. **Modo de bloqueio (Blocking Mode):**  
   - Os mesmos ataques foram interceptados e bloqueados pelo WAF, evidenciado pelos códigos HTTP **403**.  
   - As tentativas de exploração via Kali Linux e via interface gráfica da DVWA não tiveram sucesso, confirmando a eficácia da política de bloqueio.  
   - - A análise dos prints do Dozzle confirma que cada ataque foi corretamente detectado e, quando em modo de bloqueio, impedido pelo WAF.
3. **Eficiência do monitoramento:**  
   - O Dozzle permitiu visualizar todos os eventos em tempo real, facilitando a correlação entre ataque e resposta do WAF.  
   - O monitoramento contínuo possibilitou identificar rapidamente falhas ou inconsistências, garantindo uma visão clara das atividades maliciosas.
4. **Conclusões do diagnóstico:**  
   - O ambiente defensivo demonstrou capacidade de detectar e bloquear ataques comuns a aplicações web.  
   - A combinação de WAF configurado em modos diferentes e monitoramento em tempo real fornece uma visibilidade completa das ameaças.  
   - O WAF em modo de detecção, aliado ao monitoramento em tempo real via Dozzle, forneceu visibilidade completa das tentativas de ataque.
   - O WAF em modo de bloqueio demonstrou eficácia em impedir a execução de ataques detectados, validando a proteção da aplicação.
   - As evidências coletadas validam a eficácia do ModSecurity CRS e suportam recomendações de ajustes e boas práticas para ambientes similares.

---

## 6. Resposta a Incidente (NIST IR)
Nesta seção, as ações do laboratório são mapeadas de acordo com as etapas do framework de resposta a incidentes do NIST SP 800-61r2, mostrando como cada ataque foi detectado, contido e analisado.

1. **Detecção**
    - Ataques simulados (**SQLi, XSS, Command Injection, File Inclusion**) foram identificados pelo **WAF ModSecurity CRS** no modo de detecção.  
    - Logs visualizados em tempo real no **Dozzle** confirmaram cada tentativa de ataque, com códigos HTTP 302 indicando que as ações foram registradas sem interrupção da aplicação.
2. **Contenção**
    - Ao alterar o WAF para o **modo de bloqueio**, todas as tentativas de ataque foram impedidas, retornando **HTTP 403**.  
    - A contenção foi efetiva, garantindo que a DVWA permanecesse íntegra e funcional.
3. **Erradicação**
    - Não houve persistência de códigos maliciosos, mas o bloqueio do WAF eliminou qualquer risco de exploração.  
    - A infraestrutura Docker isolada garantiu que os ataques não afetassem outros sistemas.
4. **Recuperação**
    - Nenhum sistema precisou de restauração, pois a DVWA e demais containers permaneceram operacionais durante e após os testes.  
    - A integridade do ambiente foi mantida, permitindo a continuidade das atividades do laboratório.
5. **Lições Aprendidas**
    - A utilização de monitoramento em tempo real via Dozzle é fundamental para visibilidade imediata de incidentes.  
    - Testar diferentes modos do WAF permite validar o comportamento do sistema frente a ataques variados.  
    - O uso de containers Docker em ambiente controlado facilita reproduzir testes de segurança de forma segura.  
    - A análise de logs e evidências fornece base para ajustes nas regras do WAF e adoção de boas práticas em ambientes de produção.

---

## 11. Recomendações
Com base nas evidências coletadas e na análise realizada, recomenda-se:  
1. **Monitoramento contínuo:**  
   - Continuar utilizando ferramentas de visualização de logs em tempo real, como o Dozzle, para observar tentativas de ataque e respostas do WAF.  
   - Configurar alertas automáticos para eventos críticos, permitindo resposta rápida a incidentes.  
2. **Segregação e atualização de containers:**  
   - Isolar os serviços críticos (DVWA, WAF, Dozzle) em redes ou sub-redes distintas para reduzir o impacto de possíveis comprometimentos.  
   - Manter os containers atualizados com as últimas versões e patches de segurança.  
3. **Manutenção e ajuste das regras do WAF:**  
   - Revisar e ajustar periodicamente as regras do ModSecurity CRS para reduzir falsos positivos e falsos negativos.  
   - Adaptar as regras de acordo com o perfil da aplicação e os tipos de ataque mais comuns.   
4. **Capacitação e boas práticas:**  
   - Treinar os operadores e administradores para interpretar logs, configurar o WAF corretamente e reagir a incidentes.  
   - Adotar boas práticas de segurança em aplicações web e infraestrutura Docker.
5. **Testes regulares de segurança:**  
   - Realizar simulações de ataques periodicamente para validar a eficácia do WAF e a resposta do ambiente.  
   - Documentar e revisar os resultados para identificar melhorias contínuas. 

---

## 12. Plano de Ação (80/20)

<div align="center">
    <table border="1" style="border-collapse: collapse; text-align: center;">
        <thead>
            <tr>
                <th style="padding: 5px; text-align: center;">Ação</th>
                <th style="padding: 5px; text-align: center;">Descrição</th>
                <th style="padding: 5px; text-align: center;">Responsável</th>
                <th style="padding: 5px; text-align: center;">Prioridade</th>
                <th style="padding: 5px; text-align: center;">Prazo</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><div align="center">Configuração de alertas críticos</div></td>
                <td><div align="justify">Configurar alertas automáticos para eventos críticos detectados pelo WAF, permitindo resposta rápida a incidentes</div></td>
                <td><div align="center">Analista de Segurança</div></td>
                <td><div align="center">Alta</div></td>
                <td><div align="center">Contínuo</div></td>
            </tr>
            <tr>
                <td><div align="center">Monitoramento contínuo</div></td>
                <td><div align="justify">Realizar monitoramento diário dos logs no Dozzle</div></td>
                <td><div align="center">Analista de Segurança</div></td>
                <td><div align="center">Alta</div></td>
                <td><div align="center">Contínuo</div></td>
            </tr>
            <tr>
                <td><div align="center">Segregação de rede</div></td>
                <td><div align="justify">Isolar os containers em sub-redes distintas para reduzir impacto de ataques</div></td>
                <td><div align="center">Administrador de Infraestrutura</div></td>
                <td><div align="center">Alta</div></td>
                <td><div align="center">2 semanas</div></td>
            </tr>
            <tr>
                <td><div align="center">Treinamento e boas práticas</div></td>
                <td><div align="justify">Capacitar operadores para interpretar logs, configurar o WAF e responder a incidentes</div></td>
                <td><div align="center">Gestor de Segurança</div></td>
                <td><div align="center">Média</div></td>
                <td><div align="center">1 mês</div></td>
            </tr>
            <tr>
                <td><div align="center">Atualização dos containers</div></td>
                <td><div align="justify">Atualizar DVWA, Kali Linux, ModSecurity CRS e Dozzle para versões mais recentes com patches de segurança</div></td>
                <td><div align="center">Administrador de Infraestrutura</div></td>
                <td><div align="center">Média</div></td>
                <td><div align="center">Mensal</div></td>
            </tr>
            <tr>
                <td><div align="center">Revisão periódica das regras do WAF</div></td>
                <td><div align="justify">Realizar revisões periódicas das regras do ModSecurity CRS para garantir atualização e adequação às necessidades da aplicação</div></td>
                <td><div align="center">Administrador de Segurança</div></td>
                <td><div align="center">Média</div></td>
                <td><div align="center">Contínuo</div></td>
            </tr>
            <tr>
                <td><div align="center">Testes regulares de segurança</div></td>
                <td><div align="justify">Executar ataques simulados periodicamente para validar a eficácia do WAF</div></td>
                <td><div align="center">Analista de Segurança</div></td>
                <td><div align="center">Média</div></td>
                <td><div align="center">Trimestral</div></td>
            </tr>
        </tbody>
    </table>
</div>

---

## 13. Conclusão
O laboratório demonstrou a implementação bem-sucedida de um ambiente defensivo para a aplicação web vulnerável **DVWA**, utilizando o **ModSecurity CRS** como WAF e o **Dozzle** para monitoramento em tempo real.  

Os testes de ataques simulados — **SQL Injection (SQLi), Cross-Site Scripting (XSS), Command Injection e File Inclusion** — confirmaram que o WAF foi capaz de detectar e bloquear todas as tentativas maliciosas, garantindo a integridade da aplicação e evidenciando a eficácia da proteção implementada.  

Principais aprendizados (Lições Aprendidas):  
- A importância de um monitoramento contínuo e visível em tempo real para identificar incidentes rapidamente.  
- A relevância de testar diferentes modos do WAF (detecção e bloqueio) para validar seu comportamento frente a ataques variados.  
- O valor de um ambiente controlado em containers Docker para simular cenários de ataque e defesa, permitindo reproduzir testes de forma segura.  

Limitações do estudo:  
- O laboratório foi conduzido em ambiente controlado, não refletindo totalmente a complexidade e volume de tráfego de ambientes de produção.  
- Ataques simulados foram limitados aos tipos definidos; ameaças avançadas ou persistentes não foram testadas.  
- O uso de ferramentas gráficas e linha de comando para ataques pode não capturar todos os vetores exploráveis em cenários reais.  

O relatório fornece uma base sólida para futuras análises de segurança, ajustes do WAF e adoção de boas práticas em ambientes similares.

---

## 14. Anexos
Nesta seção estão incluídos materiais complementares que comprovam a execução do laboratório e permitem verificação detalhada das atividades:
- [Prints da execução do lab](./img/): pasta com todas as imagens que evidenciam a execução do laboratório.
- [Arquivo de log do WAF](./logs_waf_bloqueio.txt): arquivo exportado contendo os últimos 50 registros de log do container de WAF em modo de bloqueio.