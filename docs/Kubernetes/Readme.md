# Kubernetes – Explicações e Prática (Semanas 4 e 5)

## Para que serve o Kubernetes?

O **Kubernetes** é uma plataforma de orquestração de containers.  
Ele automatiza o deploy, o gerenciamento, o balanceamento de carga, a escalabilidade e a recuperação de aplicações containerizadas (como as criadas com Docker).

Com o Kubernetes, você pode rodar múltiplas cópias da sua aplicação, garantir alta disponibilidade e atualizar versões sem downtime, tudo de forma declarativa e automatizada.

---

## Qual o objetivo dos arquivos criados?

- **`infra/kubernetes/deployment.yaml`**  
  Define como a aplicação será implantada no cluster: número de réplicas, imagem Docker, variáveis de ambiente, volumes, healthchecks, etc.

- **`infra/kubernetes/service.yaml`**  
  Expõe a aplicação para acesso externo ou interno, definindo portas e regras de roteamento.

- **`infra/kubernetes/secret.yaml`**  
  Armazena informações sensíveis (como senhas ou tokens) de forma segura para uso nos pods.

- **`infra/kubernetes/volume.yaml`**  
  Define volumes persistentes para armazenar dados que precisam sobreviver a reinicializações dos containers.

Esses arquivos, chamados de **manifests**, descrevem de forma declarativa como o Kubernetes deve rodar e gerenciar sua aplicação.

---

## Em que momento devo utilizar o Kubernetes dentro de um projeto?

- Quando sua aplicação precisa ser escalável, resiliente e fácil de atualizar.
- Quando você quer automatizar o deploy e o gerenciamento de múltiplos containers.
- Quando precisa de alta disponibilidade, balanceamento de carga e automação de rotinas operacionais.

**Resumo:**  
Use Kubernetes para orquestrar aplicações containerizadas em ambientes de produção, teste ou desenvolvimento, garantindo automação, escalabilidade e robustez.

---

## Comandos e comentários executados na semana (Kubernetes)

### 1. Instalação do Minikube e kubectl

```bash
# Instale o kubectl (caso não tenha)
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

# Instale o Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Inicie o cluster local
minikube start
```

---

### 2. Build e carregamento da imagem Docker no Minikube

```bash
eval $(minikube docker-env)
docker build -t minha-pagina-nginx -f docker/Dockerfile .
```

> Isso garante que a imagem Docker esteja disponível dentro do cluster Minikube.

---

### 3. Aplicação dos manifests Kubernetes

```bash
kubectl apply -f infra/kubernetes/secret.yaml
kubectl apply -f infra/kubernetes/volume.yaml
kubectl apply -f infra/kubernetes/deployment.yaml
kubectl apply -f infra/kubernetes/service.yaml
```

> Cada arquivo define um recurso diferente no cluster.

---

### 4. Validação do funcionamento

```bash
kubectl get pods
kubectl get deployments
kubectl get svc
kubectl describe pod <nome-do-pod>
kubectl logs <nome-do-pod>
minikube service web-devops-service --url
```

> Use esses comandos para monitorar o status dos recursos, acessar logs e obter o endereço da aplicação.

---

**Resumo prático:**  
Com Kubernetes, você automatiza o deploy, a escalabilidade e a resiliência da sua aplicação containerizada, usando arquivos declarativos e comandos padronizados.
