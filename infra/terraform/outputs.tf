# Exibe o caminho do arquivo criado
output "caminho_arquivo" {
  description = "Caminho do arquivo de instância simulada"
  value       = local_file.exemplo_instancia.filename
}