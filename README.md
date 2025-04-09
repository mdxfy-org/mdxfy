# Setup de Testes do Projeto Agrofast

Este guia descreve como configurar o ambiente de testes para o projeto Agrofast utilizando o repositório de infraestrutura.

## Dependências do Projeto

Para configurar o ambiente de testes do projeto Agrofast, é necessário ter as seguintes dependências instaladas no seu sistema:

- **PHP**: O projeto utiliza PHP para o backend. Certifique-se de ter a versão correta instalada conforme especificado no arquivo `composer.json` do repositório `mdxfy-api`.
- **Node.js**: Utilizado para o frontend e outras ferramentas de build. Verifique a versão necessária no arquivo `package.json` do repositório `mdxfy-web`.
- **Docker**: Utilizado para criar e gerenciar os containers que compõem o ambiente de desenvolvimento e testes. Certifique-se de ter o Docker e o Docker Compose instalados e funcionando corretamente.
- **Composer**: Gerenciador de dependências para PHP. Necessário para instalar as dependências do backend.
- **NPM/Yarn**: Gerenciador de pacotes para Node.js. Necessário para instalar as dependências do frontend.

Certifique-se de que todas essas dependências estão instaladas e configuradas corretamente antes de prosseguir com a configuração do ambiente de testes.

## Passos para Configuração

### 1. Clonar os Repositórios

Execute o script `init.sh` para clonar todos os repositórios necessários:

```bash
./init.sh
```

Este script irá clonar os seguintes repositórios:

- mdxfy-api
- mdxfy-web

### 2. Instalar Dependências

Após clonar os repositórios, o script `init.sh` chamará automaticamente o script `dependencies.sh` para instalar todas as dependências necessárias:

```bash
./config/dependencies.sh
```

### 3. Configurar e Iniciar os Containers Docker

Utilize o arquivo `docker-compose.yml` para configurar e iniciar os containers Docker:

```bash
docker-compose up -d
```

Este comando irá iniciar os seguintes serviços:

- nginx
- php-fpm
- postgres
- web
- socket

### 4. Acessar os Serviços

Após iniciar os containers, você pode acessar os serviços nos seguintes endereços:
