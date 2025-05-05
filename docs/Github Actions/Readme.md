# GitHub Actions – Explicações e Prática (Semana 2)

## Para que serve o GitHub Actions?

O **GitHub Actions** é uma plataforma de automação de workflows integrada ao GitHub.  
Com ele, você pode automatizar tarefas como build, teste, deploy e outras rotinas sempre que houver mudanças no seu repositório.  
Isso garante que o código seja testado e entregue de forma contínua, rápida e confiável, sem depender de processos manuais.

---

## Qual o objetivo dos arquivos criados na semana?

- **`.github/workflows/ci-cd.yml`**  
  Este arquivo define o pipeline de CI/CD do projeto.  
  Ele descreve, em formato YAML, todos os passos que devem ser executados automaticamente a cada push ou pull request, como build da imagem Docker, execução de testes e deploy.

---

## Em que momento devo utilizar o GitHub Actions dentro de um projeto?

- Sempre que quiser automatizar processos de build, teste e deploy.
- Para garantir que todo código enviado ao repositório seja validado automaticamente.
- Para criar pipelines de integração e entrega contínua (CI/CD), aumentando a qualidade e a velocidade das entregas.

**Resumo:**  
Use o GitHub Actions para automatizar tarefas repetitivas e críticas, garantindo qualidade e agilidade no ciclo de desenvolvimento.

---

## Comandos e comentários executados na semana (GitHub Actions)

### 1. Criação do workflow de CI/CD

Arquivo: `.github/workflows/ci-cd.yml`

```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Configurar Docker Buildx
        uses: docker/setup-buildx-action@v3

      - name: Build da imagem Docker
        run: |
          docker build -t minha-pagina-nginx -f docker/Dockerfile .

      # Exemplo de teste simples: verifica se o arquivo HTML existe
      - name: Teste de existência do index.html
        run: |
          test -f app/index.html

      # Exemplo de uso de secret (simulado)
      - name: Exemplo de uso de secret
        run: echo "O segredo é ${{ secrets.MINHA_VARIAVEL_SECRETA }}"
        env:
          MINHA_VARIAVEL_SECRETA: ${{ secrets.MINHA_VARIAVEL_SECRETA }}
```

> **Comentários:**
>
> - O pipeline é disparado em push ou pull request para a branch `main`.
> - O build da imagem Docker é automatizado.
> - O teste verifica se o arquivo `index.html` existe.
> - Secrets são usados de forma segura, nunca expostos no código.

---

### 2. Como acompanhar o workflow

- Faça um push para o repositório e acompanhe o workflow rodando na aba **Actions** do GitHub.
- Crie um secret chamado `MINHA_VARIAVEL_SECRETA` em _Settings > Secrets_ do repositório GitHub para testar variáveis sensíveis no pipeline.

---

**Resumo prático:**  
Com o GitHub Actions, você garante que todo código enviado ao repositório seja automaticamente testado e preparado para deploy, aumentando a confiabilidade e a velocidade do seu projeto.
