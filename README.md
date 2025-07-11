# My Microservice Project on AWS (EKS + Jenkins + Argo CD)

Цей проєкт автоматизує розгортання мікросервісу з використанням:

- AWS EKS (Elastic Kubernetes Service)
- Jenkins для CI
- Argo CD для GitOps CD

---

🔧 Як застосувати Terraform

⚠️ Перед запуском переконайтесь, що у вас налаштований AWS CLI та `kubectl` має
доступ до вашого кластеру EKS.

1. Ініціалізуйте Terraform: terraform init

2. Перегляньте план змін: terraform plan

3. Застосуйте інфраструктуру: terraform apply

4. Після завершення — зʼявляться вихідні змінні (Outputs) з endpoint, сабнетами,
   URL до ECR тощо.

---

🧪 Як перевірити Jenkins Job

1. Проксі доступ до Jenkins UI: kubectl port-forward svc/jenkins -n jenkins
   8080:8080

2. Відкрийте у браузері: http://localhost:8080

3. Увійдіть:

   - Username: admin
   - Password: admin123 (або інші дані з terraform.tfvars)

4. Запустіть потрібну Jenkins job вручну або дочекайтесь запуску через pipeline.

5. Логи можна переглянути в UI або: kubectl logs -n jenkins jenkins-0 -f

---

🎯 Як побачити результат в Argo CD

1. Проксі доступ до Argo CD UI: kubectl port-forward svc/argo-cd-argocd-server
   -n argocd 8081:443

2. Відкрийте у браузері: https://localhost:8081

3. Увійдіть:

   - Username: admin
   - Password: отримати з командою: kubectl -n argocd get secret
     argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64
     --decode

4. Знайдіть свій застосунок і перевірте:
   - чи він Healthy
   - чи Synced
   - чи було виконано оновлення після Jenkins build

---

📌 Примітки

- Jenkins використовує Kaniko для білду образів і пушу в ECR
- Argo CD автоматично оновлює Deployment при новому образі

---

🧹 Очистка

Щоб видалити всю інфраструктуру: terraform destroy
