# Final DevOps Project: AWS Infrastructure with Terraform

## Технічні вимоги

Інфраструктура: AWS з використанням Terraform

Компоненти:

- VPC
- EKS
- RDS (або Aurora)
- ECR
- Jenkins (CI)
- Argo CD (CD)
- Prometheus + Grafana (моніторинг)

## Етапи виконання

### 1. Підготовка середовища

1. Клонувати репозиторій:

```
git clone https://github.com/<your-name>/my-microservice-project.git
cd my-microservice-project
```

2. Ініціалізувати Terraform:

```
terraform init
```

3. Перевірити всі змінні (або створити terraform.tfvars при потребі).

### 2. Розгортання інфраструктури

```
terraform apply
```

Після успішного розгортання перевірте стани:

```
kubectl get all -n jenkins
kubectl get all -n argocd
kubectl get all -n monitoring
```

### 3. Перевірка доступності сервісів

#### Jenkins

```
kubectl port-forward svc/jenkins 8080:8080 -n jenkins
```

Відкрити у браузері: http://localhost:8080

#### Argo CD

```
kubectl port-forward svc/argocd-server 8081:443 -n argocd
```

Відкрити у браузері: http://localhost:8081

### 4. Моніторинг та метрики

#### Grafana

```
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

Відкрити у браузері: http://localhost:3000

- Логін: admin
- Пароль: prom-operator (або з terraform output)

Перевірити дашборд метрик Kubernetes / Nodes / Jenkins CI.

## Рекомендації щодо безпеки та вартості

1. Щоб уникнути додаткових витрат:

```
terraform destroy
```

2. Після повного видалення ресурси S3 та DynamoDB для бекенду також знищуються.
   При повторному запуску їх слід створити першими.

## Структура проєкту

```
Project/
├── main.tf
├── backend.tf
├── outputs.tf
├── modules/
│   ├── s3-backend/
│   ├── vpc/
│   ├── ecr/
│   ├── eks/
│   ├── rds/
│   ├── jenkins/
│   ├── argo_cd/
│   └── monitoring/
├── charts/
│   └── django-app/
└── Django/
    ├── app/
    ├── Dockerfile
    ├── Jenkinsfile
    └── docker-compose.yaml
```
