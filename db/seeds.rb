users = User.create!([
  {
    name: "admin",
    email: "admin@admin.com",
    role: 3,
    password: "121212",
    password_confirmation: "121212",
    confirmed_at: Time.current
  },
  {
    name: "Alice Mendes",
    email: "alice.mendes@example.com",
    password: "senha123",
    password_confirmation: "senha123",
    confirmed_at: Time.current
  },
  {
    name: "Bruno Silva",
    email: "bruno.silva@example.com",
    password: "senha123",
    password_confirmation: "senha123",
    confirmed_at: Time.current
  },
  {
    name: "Carla Rocha",
    email: "carla.rocha@example.com",
    password: "senha123",
    password_confirmation: "senha123",
    confirmed_at: Time.current
  },
  {
    name: "Diego Santos",
    email: "diego.santos@example.com",
    password: "senha123",
    password_confirmation: "senha123",
    confirmed_at: Time.current
  },
  {
    name: "Elaine Lima",
    email: "elaine.lima@example.com",
    password: "senha123",
    password_confirmation: "senha123",
    confirmed_at: Time.current
  }
])

# Criação de e-mails
Email.create!([
  {
    to: "contato@empresa.com",
    subject: "Relatório Semanal",
    body: "Segue em anexo o relatório da semana.",
    scheduled_at: 1.day.from_now,
    user: users[0]
  },
  {
    to: "suporte@dominio.com",
    subject: "Erro no sistema",
    body: "Usuários relataram erro na tela inicial.",
    scheduled_at: 2.hours.from_now,
    user: users[0]
  },
  {
    to: "cliente1@exemplo.com",
    subject: "Proposta Comercial",
    body: "Segue proposta conforme solicitado.",
    scheduled_at: 3.days.from_now,
    user: users[0]
  },
  {
    to: "equipe@projeto.com",
    subject: "Atualização do Projeto",
    body: "O projeto foi atualizado com as novas funcionalidades.",
    scheduled_at: Time.current,
    sended: true,
    user: users[0]
  },
  {
    to: "admin@sistema.com",
    subject: "Backup Concluído",
    body: "O backup do sistema foi concluído com sucesso.",
    scheduled_at: 12.hours.ago,
    sended: true,
    user: users[0]
  },
  {
    to: "rh@empresa.com",
    subject: "Solicitação de Férias",
    body: "Gostaria de solicitar férias para o próximo mês.",
    scheduled_at: 5.days.from_now,
    user: users[0]
  },
  {
    to: "fornecedor@logistica.com",
    subject: "Confirmação de Pedido",
    body: "Confirmamos o recebimento do pedido #12345.",
    scheduled_at: 6.hours.from_now,
    user: users[0]
  },
  {
    to: "cliente2@exemplo.com",
    subject: "Reunião Agendada",
    body: "Confirmamos sua reunião para sexta-feira às 14h.",
    scheduled_at: 2.days.from_now,
    user: users[0]
  },
  {
    to: "financeiro@empresa.com",
    subject: "Nota Fiscal",
    body: "Encaminho a nota fiscal referente ao serviço prestado.",
    scheduled_at: Time.current,
    sended: true,
    user: users[0]
  },
  {
    to: "coordenador@escola.com",
    subject: "Boletim Atualizado",
    body: "O boletim dos alunos foi atualizado no sistema.",
    scheduled_at: 1.week.from_now,
    user: users[0]
  }
])
