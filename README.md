# Loft Hotel Boutique

Site institucional de hotel + painel administrativo, inspirado no layout do Terra Boa Hotel Boutique.

**Stack:** Vite + React + TypeScript · Tailwind CSS v4 · Cloudflare Workers (Hono) · Cloudflare D1 (SQLite).
Tudo roda na Cloudflare — frontend (assets estáticos) e API (Worker) no mesmo deploy.

---

## Estrutura

```
migrations/        Schema (0001_init.sql) e conteúdo inicial (seed.sql)
worker/            API em Hono: /api/content (público) + /api/admin/* (protegido) + auth HMAC
src/site/          Site público (Hero, Sobre, Acomodações, Galeria, Depoimentos, etc.)
src/admin/         Painel administrativo (login por senha + editores)
src/lib/           Cliente de API e tipos compartilhados
wrangler.jsonc     Configuração do Worker + binding D1 + assets (SPA)
.dev.vars          Variáveis de desenvolvimento (senha admin / segredo) — não committar
```

## Desenvolvimento local

```bash
npm install

# 1) Cria as tabelas e o conteúdo inicial no D1 local (.wrangler/state)
npm run db:migrate:local      # aplica migrations/
npm run db:seed:local         # popula com conteúdo placeholder

# 2) Sobe o site + API com hot reload
npm run dev                   # http://localhost:5173
```

- Site: <http://localhost:5173/>
- Admin: <http://localhost:5173/admin> — senha padrão **`admin123`** (definida em `.dev.vars`).

> A senha e o segredo de assinatura ficam em `.dev.vars` (`ADMIN_PASSWORD`, `AUTH_SECRET`).
> Troque-os antes de ir para produção.

## Deploy na Cloudflare

```bash
# 1) Autentique o Wrangler
npx wrangler login

# 2) Crie o banco D1 remoto e copie o database_id retornado
npx wrangler d1 create site_loft_db
#    cole o id em wrangler.jsonc -> d1_databases[0].database_id

# 3) Crie o bucket R2 para as imagens (nome igual ao de wrangler.jsonc)
npx wrangler r2 bucket create site-loft-media

# 4) Aplique schema e seed no banco remoto
npm run db:migrate:remote
npm run db:seed:remote        # opcional: só na primeira vez

# 5) Defina os segredos de produção (NÃO use os valores de .dev.vars)
npx wrangler secret put ADMIN_PASSWORD
npx wrangler secret put AUTH_SECRET     # use um valor longo e aleatório

# 6) Build + deploy
npm run deploy
```

O `npm run deploy` faz `vite build` e `wrangler deploy`, publicando o Worker
(com os assets do SPA embutidos) e conectando-o ao D1.

## Painel administrativo

Acessível em `/admin`. Permite editar:

| Aba | O que edita |
|-----|-------------|
| Geral | Nome, logo, localização, Instagram e títulos das seções |
| Hero | **Imagem ou vídeo** de fundo, textos e barra de reserva |
| Sobre | Eyebrow, título, parágrafos, imagens e CTA |
| Acomodações | CRUD de quartos/suítes (foto, descrição, comodidades, ordem) |
| Destaques & Comodidades | Tiles de destaque e ícones de comodidades |
| Localização | Textos e imagem da seção |
| Galeria | Fotos estilo Instagram |
| Promoção | Faixa "Conheça nossas promoções" |
| Depoimentos | Avaliações de hóspedes (nota, autor, texto) |
| Contato | Endereço, e-mail, telefone, redes sociais, CNPJ |

### Hero: imagem ↔ vídeo
Na aba **Hero**, mude o campo *Modo de fundo* para **Vídeo** e informe a URL de um `.mp4`.
A *URL da imagem* continua sendo usada como _poster_ (frame inicial enquanto o vídeo carrega).

## Imagens (upload + compressão via R2)

Os campos de imagem do admin permitem **enviar arquivos** (clique ou arraste).
A imagem é **comprimida no navegador** (redimensionada para no máx. 800px de largura e
convertida para WebP, ~0,72 de qualidade) antes do upload — economiza banda e armazenamento.

- Upload: `POST /api/admin/upload` grava o arquivo no bucket **R2** (`BUCKET`).
- Entrega: o Worker serve as imagens em `/files/<key>` com cache imutável de 1 ano.
- O campo de URL continua disponível como alternativa (ex.: colar um link externo).
- No **dev local** o R2 é emulado pelo Miniflare (em `.wrangler/state`) — não precisa
  criar bucket para testar. Em produção, crie o bucket com
  `npx wrangler r2 bucket create site-loft-media`.

## Segurança do admin

- Login por **senha única**. A senha não é armazenada no banco; é comparada (via hash SHA-256,
  em tempo constante) com a variável `ADMIN_PASSWORD`.
- Em caso de sucesso, o Worker emite um **token assinado (HMAC-SHA256)** com validade de 12h,
  guardado no `localStorage` e enviado no header `Authorization: Bearer`.
- Todas as rotas `/api/admin/*` (exceto o login) exigem token válido.
