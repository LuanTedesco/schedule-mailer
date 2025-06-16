FROM ruby:3.1.2

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y curl gnupg2 nodejs postgresql-client

# Instalar o NVM (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Instalar a versão 14 do Node.js usando o NVM
RUN bash -c "source ~/.nvm/nvm.sh && nvm install 14 && nvm use 14"

# Instala o Yarn corretamente (sem conflito com cmdtest)
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn

# Configura diretório da aplicação
WORKDIR /app

# Copia os arquivos do Gemfile e instala gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copia o restante do projeto
COPY . .

# Précompila JS e CSS (opcional, se usar em produção)
# RUN bin/rails assets:precompile

# Porta que o Rails vai usar
EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
