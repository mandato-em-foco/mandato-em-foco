# Mandato em Foco — protótipo inicial

Este pacote contém um protótipo web responsivo e navegável do Mandato em Foco.

## O que já funciona
- Layout responsivo para celular e computador.
- Navegação entre Visão geral, Parlamentares, Proposições, Fiscalização e Fontes oficiais.
- Busca e filtros por tipo e esfera.
- Fichas demonstrativas e explicação dos níveis de verificação.
- Links para portais oficiais prioritários.

## Atenção
Todos os registros de atividade são fictícios e servem apenas para demonstrar a interface. O protótipo NÃO está conectado à ALERJ, à Câmara Municipal do Rio de Janeiro ou a qualquer banco de dados oficial. Não publique os exemplos como fatos.

## Como testar
1. Extraia o ZIP.
2. Abra `index.html` em um navegador.
3. Para publicar, use Cloudflare Pages (recomendado para protótipo estático) ou hospede o repositório no GitHub e conecte ao Cloudflare Pages.

## Publicação gratuita sugerida — Cloudflare Pages
1. Crie uma conta gratuita em https://dash.cloudflare.com/
2. Acesse Workers & Pages > Create application > Pages.
3. Para o caminho mais simples, escolha Direct Upload e envie a pasta do projeto (ou ZIP conforme o fluxo do painel).
4. O Cloudflare gera um endereço `*.pages.dev`.
5. Para atualizações automáticas, prefira criar um repositório GitHub e iniciar um projeto Pages com Git integration desde o começo. A documentação informa que não é possível converter depois um projeto criado por Direct Upload em projeto com Git integration.

## Próxima etapa: dados reais e backend
Para uma versão pública de produção, recomendo:
- Frontend: Next.js ou React.
- Hospedagem: Cloudflare (avaliar Workers/Pages conforme arquitetura).
- Banco/API/autenticação: Supabase (PostgreSQL).
- Repositório e histórico do código: GitHub.

O plano gratuito do Supabase serve para prototipagem, mas possui limites (por exemplo, 500 MB de banco, 1 GB de arquivos e pausa por inatividade em projetos gratuitos). Antes de abrir ao público, planeje backups, controle de acesso, segurança, política de privacidade, moderação e orçamento de continuidade.

## Modelo de dados inicial
Ver `schema_inicial.sql`. Ele é um ponto de partida e precisa de revisão técnica e de segurança antes de uso real.
