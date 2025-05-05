# Terraform – Explicações e Prática (Semanas 2 e 3)

## Para que serve o Terraform?

O **Terraform** é uma ferramenta de Infraestrutura como Código (IaC).  
Com ele, você descreve toda a infraestrutura (servidores, redes, bancos, etc.) em arquivos de texto (`.tf`).  
Assim, é possível criar, alterar e destruir recursos de nuvem ou locais de forma automatizada, segura e versionada, sem precisar clicar manualmente em painéis de provedores.

---

## Qual o objetivo dos arquivos criados na Semana 2-3?

- **`infra/terraform/main.tf`**  
  Define os recursos que serão criados, como máquinas virtuais, arquivos simulados, redes, etc.  
  No exemplo prático, criamos um recurso local para simular uma instância.

- **`infra/terraform/variables.tf`**  
  Define variáveis que tornam os recursos parametrizáveis e reutilizáveis.

- **`infra/terraform/outputs.tf`**  
  Define quais informações serão exibidas após a criação dos recursos, facilitando o acompanhamento do que foi provisionado.

Esses arquivos juntos permitem que você controle toda a infraestrutura do projeto de forma automatizada e versionada.

---

## Em que momento devo utilizar o Terraform dentro de um projeto?

- No início do projeto, para criar toda a infraestrutura necessária (máquinas, redes, storage, permissões, etc.).
- Sempre que precisar alterar, atualizar ou destruir recursos de infraestrutura de forma segura e rastreável.
- Quando quiser garantir que o ambiente de desenvolvimento, teste e produção sejam idênticos e reprodutíveis.

**Resumo:**  
Use o Terraform para preparar e gerenciar o “terreno” onde suas aplicações vão rodar, garantindo automação, controle de mudanças e padronização.

---

## Comandos e comentários executados na Semana 2-3 (Terraform)

### 1. Instalação do Terraform

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

---

### 2. Inicialização e uso do Terraform

```bash
cd infra/terraform

terraform init
# Inicializa o Terraform e baixa os providers necessários

terraform plan
# Mostra o que será criado/modificado, sem aplicar mudanças ainda

terraform apply
# Aplica as mudanças e cria os recursos definidos nos arquivos .tf

terraform destroy
# Remove todos os recursos criados pelo Terraform
```

---

### 3. Exemplo de arquivos criados

#### `main.tf`

```hcl
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "exemplo_instancia" {
  filename = "${path.module}/instancia_simulada.txt"
  content  = "Esta é uma instância simulada criada pelo Terraform!"
}
```

#### `variables.tf`

```hcl
variable "nome_instancia" {
  description = "Nome da instância simulada"
  type        = string
  default     = "instancia_simulada"
}
```

#### `outputs.tf`

```hcl
output "caminho_arquivo" {
  description = "Caminho do arquivo de instância simulada"
  value       = local_file.exemplo_instancia.filename
}
```

---

**Resumo prático:**  
Com o Terraform, você automatiza a criação e o gerenciamento da infraestrutura do seu projeto, garantindo que tudo seja feito de forma padronizada, segura e rastreável.
