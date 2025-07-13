require "swagger_helper"

RSpec.describe "Emails API", type: :request do
  let!(:user) { User.create(name: "admin", email: "admin@admin.com", role: 3, password: "121212", password_confirmation: "121212") }

  before do
    sign_in user # simula o login do usuário
  end

  path '/emails' do
    get 'Lista todos os emails do usuário logado' do
      tags 'Emails'
      produces 'application/json'
      response '200', 'emails listados' do
        run_test!
      end
    end

    post 'Cria um email' do
      tags 'Emails'
      consumes 'application/json'
      parameter name: :email, in: :body, schema: {
        type: :object,
        properties: {
          to: { type: :string },
          subject: { type: :string },
          body: { type: :string },
          scheduled_at: { type: :string, format: 'date-time' }
        },
        required: ['to', 'subject', 'body']
      }

      response '201', 'email criado' do
        let(:email) { { to: 'exemplo@teste.com', subject: 'Oi', body: 'Teste', scheduled_at: Time.now.iso8601 } }
        run_test!
      end

      response '422', 'request inválido' do
        let(:email) { { to: '' } }
        run_test!
      end
    end
  end

  path '/emails/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Mostra um email' do
      tags 'Emails'
      produces 'application/json'

      response '200', 'email encontrado' do
        let(:id) { Email.create(to: 'test@test.com', subject: 'a', body: 'b').id }
        run_test!
      end

      response '404', 'email não encontrado' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Atualiza um email' do
      tags 'Emails'
      consumes 'application/json'
      parameter name: :email, in: :body, schema: {
        type: :object,
        properties: {
          to: { type: :string },
          subject: { type: :string },
          body: { type: :string }
        }
      }

      response '200', 'email atualizado' do
        let(:id) { Email.create(to: 'test@test.com', subject: 'a', body: 'b').id }
        let(:email) { { subject: 'novo assunto' } }
        run_test!
      end
    end

    delete 'Remove um email' do
      tags 'Emails'

      response '204', 'email deletado' do
        let(:id) { Email.create(to: 'test@test.com', subject: 'a', body: 'b').id }
        run_test!
      end
    end
  end
end
