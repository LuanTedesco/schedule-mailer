# 📧 Schedule Mailer — Agendador de E-mails Inteligente com IA

O **Schedule Mailer** é uma ferramenta versátil que permite agendar e enviar e-mails automaticamente, com a opção de integrar recursos de inteligência artificial para otimizar o conteúdo das mensagens.

---

## ✨ Recursos Principais

- ✅ **Envio Programado**: defina a data e hora exatas para envio de e-mails.
- ⚡ **Envio Imediato**: envie mensagens rapidamente sempre que necessário.
- 🤖 **Integração com IA**: use inteligência artificial para sugerir ou melhorar conteúdos de e-mail.

---

## 🛠️ Tecnologias Utilizadas

| Tecnologia  | Função                          |
|-------------|---------------------------------|
| Ruby        | Backend e lógica principal      |
| HTML/CSS    | Interface da aplicação          |
| JavaScript  | Comportamento no frontend       |
| Docker      | Containerização da aplicação    |

---

## 🚀 Instalação

### Pré-requisitos

- [Docker](https://www.docker.com/) e [Docker Compose](https://docs.docker.com/compose/) instalados.
- Configurar um endereço de e-mail que será utilizado como remetente no arquivo .env
- Tokem de API do GEMINI para uso de IA. (Opcional)

### Passos

1. Clone o repositório:

   ```bash
   git clone https://github.com/LuanTedesco/schedule-mailer.git
   cd schedule-mailer
   ```

2. Construa e inicie os containers:

   ```bash
   docker compose build
   docker compose up -d

   docker exec -it schedule-mailer-app-1 bash
   bundle install
   yarn install
   rails assets:precompile
   rails db:create db:migrate db:seed
   ```

3. Criar um .env na raiz do prejeto:

- GMAIL_USER=schedule.mailer.ads@gmail.com
- GMAIL_APP_PASSWORD=(Senha do email)
- GEMINI_URL=https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=
- TOKEN_GEMINI_API=(token do gemini API)

4. Acesse a aplicação:

   - Navegue até: [http://localhost:3000](http://localhost:3000)

---

## 💡 Como Usar

### Agendar um E-mail

1. Acesse a interface web.
2. Preencha os campos de destinatário, assunto e corpo do e-mail.
3. Escolha a data e hora para envio.
4. Clique em **"Salvar"**.

### Envio Imediato

1. Preencha os dados do e-mail normalmente.
2. Certifique-se de que a data e hora estejam definidas como o momento atual (ou mantenha os valores padrão exibidos ao abrir a modal).
3. Clique em **"Salvar"**.

### Usar a IA

- Ao escrever o corpo do e-mail, clique em um dois dois botoes **"Turbinar"** ou **"Corrigir"** para gerar sugestões de conteúdo ou corrigir o texto usando inteligência artificial integrada.

> **Obs:** Verifique se as variáveis de ambiente para serviços de e-mail e IA estão configuradas corretamente no `.env`.

---

## 🤝 Como Contribuir

Contribuições são sempre bem-vindas!

- Abra uma **issue** para relatar bugs ou sugerir melhorias.
- Envie um **pull request** com suas alterações.

---

## 📬 Contato

Desenvolvido por [Luan Tedesco](https://github.com/LuanTedesco) e [Leonardo Kleimpaul](https://github.com/LeonardoKleimpaul)
