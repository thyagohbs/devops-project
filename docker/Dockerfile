# Imagem base oficial do Nginx, leve e segura para produção
FROM nginx:1.25-alpine

# Copia o arquivo HTML para o diretório padrão do Nginx
COPY /app/index.html /usr/share/nginx/html/index.html

# Expõe a porta padrão do Nginx
EXPOSE 80

# O comando padrão do Nginx já está definido na imagem base