# Relatório de Investigação OSINT - Acme Corp

## Resumo Executivo
Investigação revelou múltiplas vulnerabilidades críticas de segurança...

## Achados Principais
1. **Exposição de Credenciais**: API dev expõe credenciais de banco de dados
2. **Arquivos Públicos S3**: Informações sensíveis da empresa expostas
3. **Sistema Legacy**: Página legacy serve como hub central desprotegido
4. **WordPress Exposto**: Painel administrativo acessível publicamente

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