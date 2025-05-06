# DevOps Project

Este repositório foi criado para estudos relacionados a DevOps e abrange o uso de diversas ferramentas e tecnologias para construir uma pipeline completa de CI/CD, provisionamento de infraestrutura e orquestração de containers.

---

## Ferramentas Utilizadas no Projeto

### Docker
- **Descrição:** Docker é utilizado para empacotar, distribuir e executar aplicações em containers.
- **Arquivos Relevantes:**
  - `docker/Dockerfile`: Define a imagem base (Nginx), arquivos copiados, portas expostas e configurações específicas.
  - `app/index.html`: Página web simples servida pelo container.
- **Uso no Projeto:**
  - Garantir portabilidade e reprodutibilidade em diferentes ambientes.
  - Facilitar o deploy e escalabilidade da aplicação.

### Kubernetes
- **Descrição:** Kubernetes é usado para orquestrar containers, gerenciar o deploy, escalabilidade e resiliência das aplicações.
- **Arquivos Relevantes:**
  - `infra/kubernetes/deployment.yaml`: Configura réplicas, imagens, probes de saúde, etc.
  - `infra/kubernetes/service.yaml`: Define um serviço para expor a aplicação.
  - `infra/kubernetes/secret.yaml`: Gerencia informações sensíveis de forma segura.
  - `infra/kubernetes/volume.yaml`: Configura armazenamento persistente.
- **Uso no Projeto:**
  - Automatizar o deploy, balanceamento de carga e escalabilidade da aplicação containerizada.

### GitHub Actions
- **Descrição:** Ferramenta de automação para CI/CD integrada ao GitHub.
- **Arquivos Relevantes:**
  - `.github/workflows/ci-cd.yml`: Pipeline automatizado para build, teste e deploy.
- **Uso no Projeto:**
  - Automatizar rotinas de build, testes e deploy a cada push ou pull request.
  - Gerenciar secrets diretamente no repositório para maior segurança.

### Terraform
- **Descrição:** Terraform é usado para provisionar e gerenciar infraestrutura como código (IaC).
- **Arquivos Relevantes:**
  - `infra/terraform/main.tf`: Define recursos como máquinas virtuais e redes.
  - `infra/terraform/variables.tf`: Parametriza os recursos criados.
  - `infra/terraform/outputs.tf`: Exibe informações sobre os recursos provisionados.
- **Uso no Projeto:**
  - Criar, alterar e destruir infraestrutura de forma automatizada.
  - Garantir ambientes consistentes e rastreáveis para desenvolvimento, teste e produção.

---

Sinta-se à vontade para explorar os arquivos e aprender mais sobre como cada ferramenta foi utilizada neste projeto.
