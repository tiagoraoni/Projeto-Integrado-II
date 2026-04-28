# Padrão de Commits e Fluxo de Trabalho

Este projeto utiliza o padrão de **Conventional Commits** para garantir um histórico de alterações legível e organizado.

# Formato da Mensagem
O commit deve seguir a seguinte estrutura:
`tipo: descrição breve em português`

### Tipos permitidos:
- **feat:** Uma nova funcionalidade (ex: `feat: integração com sensor HC-SR04`)
- **fix:** Correção de um erro/bug (ex: `fix: ajuste na leitura da distância`)
- **docs:** Alterações em documentações (ex: `docs: atualiza guia de testes`)
- **style:** Mudanças de formatação, ponto e vírgula, etc (não altera o código)
- **refactor:** Refatoração de código que não corrige erro nem adiciona feature
- **test:** Adição ou modificação de testes obrigatórios
- **chore:** Atualizações de tarefas de build, pacotes ou configurações

# Fluxo de Trabalho (Cheat Sheet)

1. **Sincronizar:** `git pull origin main`
2. **Trabalhar:** Faça suas alterações no código.
3. **Status:** `git status` (para ver o que foi alterado).
4. **Adicionar:** `git add .` (ou `git add nome_do_arquivo`).
5. **Commit:** `git commit -m "tipo: mensagem curta"`
6. **Subir:** `git push origin main`
