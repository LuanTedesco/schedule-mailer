# ☑️ RazoTasks

É um sistema completo de gestão de tarefas e produtividade corporativa, voltado para que os gestores possam organizar e acompanhar o fluxo de trabalho de suas equipes de forma estruturada. Ele fornece uma plataforma colaborativa com recursos de controle de tarefas, sub tarefas, etiquetas, comentários, quadros, colunas, notificações, entre outros.

## Visão Geral

A aplicação oferece recursos para:

- Criar e atribuir tarefas a usuários e empresas.
- Organizar tarefas por **departamentos**, **quadros**, **colunas** e **tags**.
- Acompanhar o status de tarefas, subtarefas e comentários.
- Gerenciar **usuários**, **departamentos** e **notificações** e **anexos**.
- Utilizar **notificações push** e controle de leitura para comunicação interna.
- Armazenamento de arquivos via Active Storage.

## Estrutura Principal

### Entidades

- **User**: Usuários do sistema, associados a um ou mais departamentos.
- **Departament**: Unidades organizacionais responsáveis pelas tarefas.
- **Company**: Empresas clientes para as quais as tarefas são realizadas.
- **Board**: Representações de projetos ou áreas com prazos e descrições.
- **Progress**: Etapas que representam o avanço de uma tarefa dentro de um board.
- **Task**: Atividades com título, descrição, prazos, prioridade e situação.
- **SubTask**: Subatividades associadas a uma tarefa principal.
- **Comment**: Comentários dos usuários nas tarefas.
- **Attachment**: Arquivos vinculados a uma tarefa.
- **Notification**: Notificações visuais e/ou push para atualizações no sistema.
- **Tag**: Etiquetas coloridas e organizacionais associadas a tarefas.

### Relacionamentos

- Um usuário pode participar de múltiplos departamentos.
- Cada tarefa pode conter várias tags e subtarefas.
- Tarefas são associadas a usuários responsáveis e empresas.
- Boards estão ligados a departamentos.
- Progressos estão associados a boards.
- Notificações estão relacionadas a usuários.
- Anexos e comentários estão associados a tarefas.

## Tecnologias Utilizadas

- **Ruby on Rails 7**
- **PostgreSQL**
- **Active Storage** (para uploads de arquivos)
- **Devise** (autenticação de usuários)
- **UUIDs** como identificadores primários
- **PaperTrail** (versionamento de registros)
- **Bootstrap** e **Stimulus/Turbo** (provavelmente utilizados no front)

## Configuração do Projeto

### Requisitos

- **Ruby** 3.1.2
- **Yarn**
- **Npm**
- **Node** >= 14

### Instalação

```bash
bundle install
yarn install
```

#### Para configurar o SSL local:

```bash
cd config/sh/
chmod +x setup_ssl.sh
./setup_ssl.sh
cd ../..
```

#### Se estiver usando WSL no Windows

### WSL

```bash
openssl x509 -outform der -in $(mkcert -CAROOT)/rootCA.pem -out /mnt/c/Users/luan/Downloads/rootCA.der
```

### PowerShell

```bash
$certPath = "C:\Users\luan\Downloads\rootCA.der"
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2 $certPath
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store("Root","LocalMachine")
$store.Open("ReadWrite")
$store.Add($cert)
$store.Close()
```

### Acesso

#### Seu inet + Porta 3000
