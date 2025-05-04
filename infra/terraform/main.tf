# Provedor local (simulado)
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "local" {}

# Recurso simulado: cria um arquivo local representando uma "instância"
resource "local_file" "exemplo_instancia" {
  filename = "${path.module}/instancia_simulada.txt"
  content  = "Esta é uma instância simulada criada pelo Terraform!"
}