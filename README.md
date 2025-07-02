# Проєкт: lesson-7 — Kubernetes кластер для Django-застосунку на AWS

## 🔧 Використані технології

- **Terraform** — для автоматичного створення інфраструктури
- **AWS EKS** — Kubernetes кластер
- **Amazon ECR** — репозиторій для Docker-образів
- **Amazon RDS** — керована база даних PostgreSQL
- **Helm** — інструмент для деплойменту застосунків у Kubernetes
- **AWS S3 + DynamoDB** — для збереження стану Terraform
- **AWS IAM** — керування доступами

## 🚀 Кроки запуску проєкту

### 1. Ініціалізація Terraform

```bash
terraform init

terraform apply

cd <папка з Django-проєктом>
docker build -t django-app .
aws ecr get-login-password --region eu-north-1 | docker login --username AWS <ECR_REPO>
docker tag django-app <ECR_REPO>/django-app
docker push <ECR_REPO>/django-app

cd charts/django-app
helm upgrade --install django-app . --namespace default

kubectl get svc django-service

```

🔐 Змінні середовища (ConfigMap)

```bash
POSTGRES_PORT=5432
POSTGRES_HOST=db POSTGRES_USER=django_user POSTGRES_DB=django_db
POSTGRES_PASSWORD=pass9764gd

```

# Що реалізовано

✅ Створено кластер EKS через Terraform

✅ Налаштовано VPC, RDS, IAM, ECR

✅ Завантажено Docker-образ Django до ECR

✅ Деплой застосунку через Helm

✅ Реалізовано автоматичне масштабування через HPA

✅ Використано ConfigMap для конфігурації середовища

✅ Проєкт запушено до GitHub у гілку lesson-7
