# Docker – Explicações e Prática (Semana 1)

## Para que serve o Docker?

O **Docker** é uma plataforma que permite empacotar, distribuir e executar aplicações em containers.  
Um **container** é como uma “caixa” leve e isolada que contém tudo o que a aplicação precisa para rodar: código, dependências, configurações e sistema operacional mínimo.  
Isso garante que a aplicação funcione da mesma forma em qualquer computador, servidor ou nuvem, evitando o famoso “na minha máquina funciona”.

---

## Qual o objetivo dos arquivos criados na Semana 1?

- **`docker/Dockerfile`**  
  Arquivo de instruções para o Docker construir a imagem da aplicação.  
  Ele define qual imagem base usar (ex: nginx), quais arquivos copiar, quais portas expor, etc.

- **`app/index.html`**  
  Página web simples que será servida pelo Nginx dentro do container.

Esses arquivos permitem criar uma imagem Docker personalizada, que pode ser executada em qualquer ambiente compatível com Docker.

---

## Em que momento devo utilizar o Docker dentro de um projeto?

- Quando você quer garantir que sua aplicação rode igual em qualquer ambiente (desenvolvimento, teste, produção).
- Quando precisa facilitar o deploy, distribuição e escalabilidade da aplicação.
- Quando deseja isolar dependências e evitar conflitos entre projetos.

**Resumo:**  
Use Docker sempre que quiser portabilidade, reprodutibilidade e facilidade de deploy para sua aplicação.

---

## Comandos e comentários executados na Semana 1 (Docker)

### 1. Criação do Dockerfile

Arquivo: `docker/Dockerfile`

```dockerfile
# Imagem base oficial do Nginx, leve e segura para produção
FROM nginx:1.25-alpine

# Copia o arquivo HTML para o diretório padrão do Nginx
COPY app/index.html /usr/share/nginx/html/index.html

# Expõe a porta padrão do Nginx
EXPOSE 80

# O comando padrão do Nginx já está definido na imagem base
```

---

### 2. Build e execução do container Docker

```bash
# Acesse a raiz do projeto
cd /home/thyagohenrique/Developer/proprios/bases/devops/devops-project

# Construa a imagem Docker usando o Dockerfile
docker build -t minha-pagina-nginx -f docker/Dockerfile .
# -t: nomeia a imagem criada
# -f: especifica o caminho do Dockerfile
# . : contexto do build (deve ser a raiz do projeto para acessar todos os arquivos)

# Rode o container mapeando a porta 8080 do host para a 80 do container
docker run --rm -d -p 8080:80 --name web-devops minha-pagina-nginx
# --rm: remove o container ao parar
# -d: executa em segundo plano
# -p: mapeia portas (host:container)
# --name: nome do container

# Para parar o container:
docker stop web-devops
```

> **Dica:** O build deve ser feito a partir da raiz do projeto para garantir que o Docker consiga acessar todos os arquivos necessários.

---

**Resumo prático:**  
Com Docker, você empacota sua aplicação e suas dependências em uma imagem.  
Depois, executa essa imagem em qualquer lugar, sempre do mesmo jeito, usando comandos simples e padronizados.
