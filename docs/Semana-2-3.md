# Projeto DevOps de Exemplo

## Semana 2 – CI/CD com GitHub Actions

## Semana 3 – Infraestrutura como Código com Terraform

---

## Semana 2 – CI/CD com GitHub Actions

### Estrutura de Pastas

```
devops-project/
│
├── .github/
│   └── workflows/
│       └── ci-cd.yml
├── docker/
│   └── Dockerfile
├── app/
│   └── index.html
...
```

---

### Comandos e Comentários Executados

#### 1. Criação do workflow de CI/CD

Arquivo `.github/workflows/ci-cd.yml`:

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

#### 2. Como acompanhar o workflow

- Faça um push para o repositório e acompanhe o workflow rodando na aba **Actions** do GitHub.
- Crie um secret chamado `MINHA_VARIAVEL_SECRETA` em _Settings > Secrets_ do repositório GitHub.

---

## Semana 3 – Infraestrutura como Código com Terraform

### Estrutura de Pastas

```
devops-project/
│
├── infra/
│   └── terraform/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
...
```

---

### Comandos e Comentários Executados

#### 1. Instalação do Terraform

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform -y
terraform -version
# Confirma a instalação do Terraform
```

#### 2. Inicialização e uso do Terraform

```bash
cd infra/terraform

terraform init
# Inicializa o Terraform e baixa os providers necessários

terraform plan
# Mostra o que será criado/modificado

terraform apply
# Aplica as mudanças e cria os recursos simulados

terraform destroy
# Remove os recursos criados pelo Terraform
```

#### 3. Arquivos principais criados

- `main.tf`: Define o provider local e um recurso simulado (`local_file`).
- `variables.tf`: Define variáveis para parametrizar recursos.
- `outputs.tf`: Define outputs para exibir informações após o apply.

---

### Observações

- O pipeline CI/CD garante que builds e testes sejam automáticos e reprodutíveis.
- Secrets nunca devem ser expostos no código.
- O Terraform permite versionar e automatizar a criação de infraestrutura, mesmo que simulada localmente.
- Sempre revise o plano (`terraform plan`) antes de aplicar mudanças.

---

**Próximos passos:**  
Na próxima etapa, você irá integrar o Terraform com provedores reais (como AWS) e avançar para orquestração com Kubernetes!
