# Terraform infrastructure – lesson-5

## Модулі

- **s3-backend** – створює S3 bucket для зберігання terraform state та таблицю
  DynamoDB для блокування
- **vpc** – створює VPC, підмережі, Internet/NAT Gateway, маршрути
- **ecr** – створює репозиторій для зберігання Docker-образів

## Команди для запуску

```bash
terraform init
terraform plan
terraform apply
terraform destroy

```
