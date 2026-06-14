# Padrão de Commits e Fluxo de Trabalho

Este projeto segue o padrão **Conventional Commits** para manter um histórico legível e organizado.

---

## Formato da Mensagem

```
tipo(escopo): descrição breve em português

corpo opcional com mais detalhes
```

O escopo é opcional mas recomendado — indica a área alterada, ex: `firmware`, `ui`, `mqtt`, `config`.

---

## Tipos Permitidos

| Tipo | Descrição | Exemplo |
|------|-----------|---------|
| `feat` | Nova funcionalidade | `feat(firmware): adiciona leitura do sensor HC-SR04` |
| `fix` | Correção de bug | `fix(mqtt): corrige reconexão após queda de WiFi` |
| `docs` | Documentação | `docs(readme): adiciona instruções de instalação` |
| `refactor` | Refatoração sem mudança de comportamento | `refactor(firmware): extrai função medirDistancia()` |
| `test` | Testes | `test(sensor): adiciona teste de leitura em loop` |
| `style` | Formatação sem alterar lógica | `style(firmware): ajusta indentação do loop principal` |
| `chore` | Configuração, build ou dependências | `chore(config): atualiza wokwi.toml com novo binário` |

---

## Fluxo de Trabalho

### 1. Cria a issue

Antes de começar qualquer alteração, cria uma issue descrevendo o que será feito.

```
Título: feat: descrição do que será implementado
```

### 2. Cria a branch

```bash
git checkout main
git pull origin main
git checkout -b tipo/descricao-curta
```

Exemplo:
```bash
git checkout -b feat/tela-monitoramento
```

### 3. Verifica o status

```bash
git status
```

### 4. Adiciona os arquivos

Prefira adicionar por arquivo para manter commits atômicos:

```bash
git add nome_do_arquivo
```

Use `git add .` apenas quando todas as mudanças pertencem ao mesmo contexto.

### 5. Commit

```bash
git commit -m "tipo(escopo): descrição curta"
```

Para commits com mais detalhes:

```bash
git commit -m "tipo(escopo): descrição curta

- detalhe 1
- detalhe 2"
```

### 6. Push

```bash
git push origin tipo/descricao-curta
```

### 7. Pull Request

Abre o PR no GitHub com o título:

```
tipo: descrição curta (#numero-da-issue)
```

Na descrição inclui o que foi feito, como testar e `Closes #N` para fechar a issue automaticamente ao mergear.

---

## Regras Gerais

- Mensagens sempre em português
- Letra minúscula, sem ponto no final
- Máximo 72 caracteres na primeira linha
- Um commit por contexto — não mistura firmware com config no mesmo commit
- Nunca commitar direto na `main` — sempre via branch + PR

---

## Cheat Sheet

```bash
# Fluxo completo
git checkout main
git pull origin main
git checkout -b tipo/descricao-curta
git add nome_do_arquivo
git commit -m "tipo(escopo): descrição curta"
git push origin tipo/descricao-curta
# Abre PR no GitHub e fecha a issue com Closes #N
```
