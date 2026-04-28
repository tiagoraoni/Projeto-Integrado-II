#  Guia de Testes - Projeto-Integrado-II

Este documento descreve os procedimentos de teste obrigatórios para a disciplina.

#  Mobile (Flutter)
Para rodar os testes unitários e de widget:
\`\`\`bash
cd mobile_app
flutter test
\`\`\`

#  Hardware (Python)
Para validar a lógica dos sensores sem precisar do Raspberry físico:
\`\`\`bash
python3 -m unittest discover hardware/tests
\`\`\`

## Critérios de Aceitação
- [ ] Cobertura mínima de 80% da lógica de negócio.
- [ ] Sucesso em todos os testes de integração de sensores.
