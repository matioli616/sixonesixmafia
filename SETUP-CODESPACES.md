---
type: guia
tags: [setup, codespaces, github]
---
# 🚀 Rodar a 616 Mafia Studio no GitHub Codespaces

O **motor** (Claude Code + agentes + memória) roda 100% no Codespaces.
Os **dashboards Dataview** só renderizam no app desktop do Obsidian — por isso o
modelo de **duas cabines** (engine na nuvem, painel no Obsidian local, via git).

---

## PARTE 1 — Subir pro GitHub (uma vez)

### Opção A — pelo site (mais fácil, sem terminal)
1. github.com → **New repository** → nome `616-mafia-studio` → **Private** → Create.
2. Na página do repo: **uploading an existing file** → arraste TODO o conteúdo da
   pasta `616-MAFIA-STUDIO` (inclusive `.devcontainer/` e `.github/`).
   - ⚠️ O GitHub web às vezes esconde pastas que começam com ponto. Se o
     `.devcontainer` não subir, use a Opção B.
3. **Commit changes**.

### Opção B — pelo terminal (garante os arquivos ocultos)
```bash
cd 616-MAFIA-STUDIO
git init
git add -A           # -A inclui .devcontainer, .gitignore, etc.
git commit -m "616 Mafia Studio — setup inicial"
gh repo create 616-mafia-studio --private --source=. --push
# (sem gh CLI: crie o repo vazio no site e rode:)
# git remote add origin https://github.com/SEU_USER/616-mafia-studio.git
# git branch -M main && git push -u origin main
```

---

## PARTE 2 — Chave da Anthropic (uma vez)

Você tem 2 caminhos de autenticação:

**Caminho 1 — Secret de API (recomendado p/ automação)**
1. github.com → seu avatar → **Settings** → **Codespaces** → **Secrets** → **New secret**.
2. Nome: `ANTHROPIC_API_KEY` · Valor: sua key (`sk-ant-...` do console.anthropic.com).
3. Em **Repository access**, selecione `616-mafia-studio`. Salve.
   - O Codespaces injeta esse secret como variável de ambiente; o Claude Code usa sozinho.

**Caminho 2 — Login com sua conta (Claude Pro/Max, sem custo de API)**
- Pule o secret. Ao rodar `claude` pela 1ª vez, ele mostra um link de login.
  Abra, autorize com sua conta, cole o código de volta. Pronto.

---

## PARTE 3 — Abrir o Codespace e usar

1. Na página do repo → botão verde **Code** → aba **Codespaces** → **Create codespace on main**.
2. Aguarde (~1-2 min): o `.devcontainer/setup.sh` instala o Claude Code automático.
3. No terminal do Codespace (Ctrl+`):
   ```bash
   claude doctor      # confere instalação e auth
   claude             # entra no estúdio (lê o CLAUDE.md como cérebro)
   ```
4. Dentro do `claude`, dispare o pipeline:
   ```
   /pesquisar tema: dívida de sangue
   /conceito
   /refrao
   /verso 1
   /avaliar
   /finalizar
   /aprender
   ```
5. Salve o trabalho de volta no repo (commit), pra puxar no Obsidian local:
   ```bash
   git add -A && git commit -m "nova faixa" && git push
   ```

---

## PARTE 4 — Dashboards no Obsidian (cabine local, opcional)

Pra ver os painéis Dataview com gráfico/tabela:
1. No PC: instale Obsidian + plugin **Obsidian Git** (e **Dataview**).
2. `git clone` do repo numa pasta local e **abra como cofre** no Obsidian.
3. No Obsidian Git: configure auto-pull. Tudo que o Claude Code criar no Codespaces
   e der `push` aparece no seu Obsidian com os dashboards renderizados.

> Sem instalar Obsidian: no próprio Codespaces, a extensão **Foam** (já vem nas
> recommendations) te dá backlinks e grafo no navegador — só não renderiza as
> tabelas Dataview.

---

## Troubleshooting
| Sintoma | Solução |
|---|---|
| `claude: command not found` | rode `bash .devcontainer/setup.sh` manualmente |
| auth falhou | `echo $ANTHROPIC_API_KEY` (vazio? confira o secret) ou use login |
| `.devcontainer` não subiu | use a Opção B (git add -A) |
| qualquer coisa estranha | `claude doctor` |
