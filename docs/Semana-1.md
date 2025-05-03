# Projeto DevOps de Exemplo

## Semana 1 – Versionamento com Git e Containerização com Docker

### Estrutura de Pastas

```
devops-project/
│
├── app/
│   └── index.html
│
├── docker/
│   └── Dockerfile
│
├── scripts/
│
├── .gitignore
├── README.md
```

---

### Comandos e Comentários Executados

#### 1. Inicialização do repositório Git

```bash
git init
# Inicializa um novo repositório Git na pasta do projeto

git add .
# Adiciona todos os arquivos para controle de versão

git commit -m "chore: estrutura inicial do projeto"
# Cria o primeiro commit com uma mensagem clara e padronizada
```

#### 2. Criação do .gitignore

Conteúdo do arquivo `.gitignore`:

```
node_modules/
dist/
.env
*.log
.DS_Store
```

> Ignora arquivos e pastas que não devem ser versionados, como dependências, builds, variáveis sensíveis e arquivos temporários.

#### 3. Criação da aplicação web simples

Arquivo `app/index.html`:

```html
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <title>Minha Primeira Página Containerizada</title>
  </head>
  <body>
    <h1>Olá, DevOps!</h1>
    <p>Esta página está rodando em um container Docker com Nginx 🚀</p>
  </body>
</html>
```

#### 4. Criação do Dockerfile

Arquivo `docker/Dockerfile`:

```dockerfile
# Imagem base oficial do Nginx, leve e segura para produção
FROM nginx:1.25-alpine

# Copia o arquivo HTML para o diretório padrão do Nginx
COPY app/index.html /usr/share/nginx/html/index.html

# Expõe a porta padrão do Nginx
EXPOSE 80

# O comando padrão do Nginx já está definido na imagem base
```

#### 5. Build e execução do container Docker

```bash
# Acesse a raiz do projeto
cd /home/thyagohenrique/Developer/proprios/bases/devops/devops-project

# Construa a imagem Docker usando o Dockerfile
docker build -t minha-pagina-nginx -f docker/Dockerfile .

# Rode o container mapeando a porta 8080 do host para a 80 do container
docker run --rm -d -p 8080:80 --name web-devops minha-pagina-nginx

# Para parar o container:
docker stop web-devops
```

> O build deve ser feito a partir da raiz do projeto para garantir que o Docker consiga acessar todos os arquivos necessários.

---

### Observações

- Sempre use mensagens de commit claras e padronizadas.
- O `.gitignore` protege o repositório de arquivos desnecessários ou sensíveis.
- O Dockerfile deve ser mantido simples e seguro, sempre usando imagens oficiais.
- O contexto do build Docker deve ser a raiz do projeto para evitar erros de caminho.

---

**Próximos passos:**  
Na próxima semana, vamos explorar Docker Compose e automação de ambientes!
