# Variáveis podem ser usadas para parametrizar recursos
variable "nome_instancia" {
  description = "Nome da instância simulada"
  type        = string
  default     = "instancia_simulada"
}