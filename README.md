# Projeto-Integrado-II 

Repositório destinado ao desenvolvimento da **Lixeira Inteligente com Abertura Automática**. Este projeto de utilidade pública foca em acessibilidade e higiene sanitária, integrando hardware (Raspberry Pi) e uma interface mobile (Flutter).

# Público-Alvo
- Pessoas com deficiência motora.
- Profissionais de saúde em ambientes estéreis.
- Usuários domésticos que buscam maior higiene.

# Funcionalidades
- **Detecção via Ultrassom:** Abertura automática ao detectar objetos próximos.
- **Temporizador:** Fechamento automático inteligente.
- **Controle via App:**
    - Monitoramento de status.
    - Acionamento manual remoto.
    - Ajuste de sensibilidade e tempo.

# Tecnologias
- **Hardware:** Raspberry Pi, Sensor HC-SR04, Servomotor.
- **Linguagens:** Python (Hardware), Dart & **Kotlin** (Mobile).
- **Framework:** Flutter.
- **Design:** [Figma](https://www.figma.com/design/ZcsdDuxSiVDdL1e2HFmbtm/Projeto-Integrado-II?node-id=31-32&t=XKHVVwncJoJ28rWY-1).

# Estrutura do Repositório
.
├── hardware/          # Scripts Python (Controle GPIO e Sensores)
├── mobile_app/        # Aplicação Flutter (Dart + Kotlin)
├── docs/              # Documentação técnica e assets
└── README.md          # Guia do projeto
=======

# Documentação do Projeto
Para facilitar a navegação, os detalhes técnicos foram separados por categoria:

- [Guia de Padronização de Commits](GIT_GUIDE.md) — *Consulte antes de subir código.*
- [Guia de Testes e Qualidade](TEST_GUIDE.md) — *Requisitos da disciplina.*
