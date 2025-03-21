# Projeto Exemplo: FastAPI com Docker, CI no GitHub e Deploy na AWS

Este projeto é um exemplo prático de como configurar uma aplicação FastAPI utilizando Docker, integração contínua (CI) com GitHub Actions e deploy na AWS. O objetivo é demonstrar boas práticas para desenvolvimento, testes automatizados e deploy de aplicações modernas.

## 📋 Sobre o Projeto

Este projeto consiste em uma aplicação simples em **FastAPI** com três endpoints:

1. **`/`**: Retorna uma mensagem "Hello World".
2. **`/items/{item_id}`**: Retorna um JSON com o `item_id` e um parâmetro opcional `q`.
3. **`/hi`**: Retorna uma mensagem "hi".

A aplicação é containerizada usando **Docker**, testada automaticamente com **GitHub Actions** e pode ser implantada na **AWS** (ou outro provedor de nuvem).

## 🚀 Como Executar o Projeto

### Pré-requisitos

- **Docker** instalado na sua máquina.
- **Git** para clonar o repositório.
- Uma conta no **Docker Hub** para push da imagem.
- Uma conta na **AWS** para deploy (opcional).

### Passos para Execução

1. Clone o repositório:

``` bash
git clone https://github.com/GeorgeOgeorge/github-ci-test

cd github-ci-test
```

2. Construa a imagem Docker:

``` bash
docker build -tag fastapi-app .
```

3. Execute o contêiner:

``` bash
docker run --detach --name fastapi-container fastapi-app
```

4. Acesse a aplicação:

    Abra o navegador e acesse:

    - <http://localhost:8000/> para ver "Hello World".
    - <http://localhost:8000/hi> para ver "hi".
    - <http://localhost:8000/items/42?q=test> para testar o endpoint de items.

## 🛠️ Configuração do CI/CD

### GitHub Actions

O projeto utiliza GitHub Actions para automatizar testes, builds e push da imagem Docker para o Docker Hub. O workflow está configurado no arquivo .github/workflows/build-push-ci.yml.

#### Passos do Workflow:

1. Testes: Executa testes automatizados (lint e pytest).
2. Build: Constrói a imagem Docker.
3. Push: Envia a imagem para o Docker Hub.

#### Variáveis de Ambiente Necessárias:

- DOCKER_HUB_USERNAME: Nome de usuário do Docker Hub.
- DOCKER_HUB_TOKEN: Token de acesso pessoal do Docker Hub.

### Deploy na AWS

O deploy na AWS pode ser feito manualmente ou automatizado usando serviços como AWS ECS (Elastic Container Service) ou AWS Fargate. A imagem Docker gerada pode ser usada diretamente no ECS.

#### Passos para Deploy na AWS:

1. Push da imagem para o Docker Hub (já feito pelo CI).
2. Crie um cluster no ECS.
3. Configure um serviço para rodar a imagem Docker.
4. Acesse a aplicação via endpoint público gerado pela AWS.

## 🐳 Docker

A aplicação está containerizada usando Docker. O Dockerfile contém todas as instruções necessárias para construir a imagem.

### Comandos Úteis

- Construir a imagem:

    ``` bash
    docker build -t fastapi-app .
    ```

- Rodar o contêiner:

    ``` bash
    docker run -d -p 8000:8000 --name fastapi-container fastapi-app
    ```

- Parar o contêiner:

    ``` bash
    docker stop fastapi-container
    ```

- Remover o contêiner:

    ``` bash
    docker rm fastapi-container
    ```

## 🧪 Testes

O projeto inclui testes automatizados usando pytest e verificação de estilo de código com flake8.

### Executar Testes Localmente

1. Instale as dependências:

    ``` bash
    pip install -r requirements.txt
    ```

2. Execute os testes:

    ``` bash
    pytest
    ```

3. Verifique o lint:

    ``` bash
    flake8 .
    ```

## 🌐 Endpoints da API

- GET /:

  - Retorno: {"Hello": "World"}

- GET /items/{item_id}:

  - Parâmetros:
    - item_id (int): ID do item.
    - q (str, opcional): Query string.

  - Retorno: {"item_id": 42, "q": "test"}

- GET /hi:

  - Retorno: {"hi": "hello"}

## 📧 Contato

Se tiver dúvidas ou sugestões, entre em contato:

Nome: George Mendonça Silva de Morais

Email: <george1bsilva@outlook.com>

GitHub: GeorgeOgeorge

Este projeto é um exemplo prático para estudos e demonstração de boas práticas de desenvolvimento. Sinta-se à vontade para utilizá-lo como base para seus próprios projetos! 🚀
