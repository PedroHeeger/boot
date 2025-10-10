# Relatório de Investigação OSINT - Acme Corp

## Resumo Executivo
Investigação revelou múltiplas vulnerabilidades críticas de segurança...

## Achados Principais
- **Subdomínios Expostos**: Subdomínios identificados, incluindo `old.acme-corp-lab.com`.
- **Buckets S3 com site estático expostos**:
    - `old.acme-corp-lab.com`: Site estático configurado para redirecionar para o servidor Legacy (`3.94.82.59:80`), funcionando como um hub central desprotegido.
    - `admin.acme-corp-lab.com`: Site estático configurado para redirecionar para o servidor de administração (`54.152.245.201:80`).
    - `dev.acme-corp-lab.com`: Site estático configurado para redirecionar para o servidor de desenvolvimento (`34.207.53.34:3000`).
- **Sites estáticos redirecionando para servidores com exposição de IPs**:
    - `old.acme-corp-lab.com` → `3.94.82.59:80`
    - `admin.acme-corp-lab.com` → `54.152.245.201:80`
    - `dev.acme-corp-lab.com` → `34.207.53.34:3000`
- **Sistema Legacy expondo arquivos públicos em bucket do S3**:
    - `company_info.txt`: informações sobre a empresa, infraestrutura e servidores (e-mail e DNS).
    - `employees.csv`: lista de funcionários com endereços de e-mail e números de telefone.
- **Servidor Dev expondo endpoints de API**:
    - `/api/health`: informações de saúde da API.
    - `/api/system-info`: credenciais de banco de dados, chaves de serviços em nuvem e outros segredos.
    - `/api/users`: lista de usuários da API.
    - `/api/config`: configuração da API.
- **Servidor Admin expondo diretórios WordPress**:
    - `wp-includes`: expõe arquivos da estrutura interna do WordPress.
    - `wp-admin`: painel administrativo acessível, mostrando rotas e arquivos sensíveis.
    - `wp-content`: não expõe informações relevantes.

## Recomendações Críticas
1. Remover credenciais da API de desenvolvimento
2. Proteger arquivos S3 sensíveis
3. Implementar autenticação na página legacy
4. Revisar configurações de segurança do WordPress

## Reflexões
1. Um redirecionamento pode ser uma porta para sistemas esquecidos
2. Cada link, arquivo ou endpoint pode conter informações valiosas, importante seguir cada um.
3. Não são apenas sistemas isolados, são redes de conexões. Entender essas conexões é fundamental.
4. Mentalidade hacker não é sobre quebrar sistemas, é entender como eles funcionam.

## Lições Aprendidas
1. Comece sempre pelo básico - Enumeração de subdomínios e DNS
2. Configure seu ambiente adequadamente - Docker torna tudo mais organizado e reproduzível
3. Investigue redirecionamentos - Eles podem revelar infraestrutura oculta
4. Procure por arquivos públicos - S3 buckets mal configurados são comuns
5. Teste APIs - Endpoints de desenvolvimento frequentemente expõem credenciais
6. Use visualização - Grafos ajudam a entender relacionamentos complexos
7. Combine ferramentas CLI e web - Interfaces visuais complementam comandos
8. Documente tudo - Conhecimento sem documentação é conhecimento perdido