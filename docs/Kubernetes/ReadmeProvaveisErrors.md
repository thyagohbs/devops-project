# Erros comuns ao configurar o Kubernetes e como resolvê-los

## 1. Erro: `The connection to the server localhost:8080 was refused`

**Causa:** O Minikube (ou outro cluster Kubernetes) não estava rodando ou o contexto do kubectl não estava configurado corretamente.

**Solução:**

- Inicie o Minikube:
  ```sh
  minikube start
  ```
- Configure o contexto:
  ```sh
  kubectl config use-context minikube
  ```

---

## 2. Erro: `ImagePullBackOff` ou `ErrImagePull`

**Causa:** O Kubernetes não encontrou a imagem Docker localmente e tentou puxar do repositório remoto.

**Solução:**

- Certifique-se de buildar a imagem dentro do ambiente Docker do Minikube:
  ```sh
  eval $(minikube docker-env)
  docker build -t minha-pagina-nginx -f docker/Dockerfile .
  ```
- No arquivo `deployment.yaml`, defina:
  ```yaml
  imagePullPolicy: IfNotPresent
  ```
- Recrie o deployment:
  ```sh
  kubectl delete -f infra/kubernetes/deployment.yaml
  kubectl apply -f infra/kubernetes/deployment.yaml
  ```

---

## 3. Pods com `READY 0/1` e status `Running`

**Causa:** Os probes (`readinessProbe` ou `livenessProbe`) ainda não passaram ou estão aguardando o tempo de delay inicial.

**Solução:**

- Aguarde alguns segundos e verifique novamente com:
  ```sh
  kubectl get pods
  ```
- Se persistir, veja detalhes:
  ```sh
  kubectl describe pod <nome-do-pod>
  kubectl logs <nome-do-pod>
  ```

---

Adicione novos erros e soluções conforme surgirem durante o desenvolvimento!
