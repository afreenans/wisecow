


# 🐄 Wisecow Application – Containerization & Kubernetes Deployment

## 📘 Project Overview
The **Wisecow Application** is a simple web application that displays random cow jokes and quotes.  
This project demonstrates **containerization using Docker** and **deployment on a Kubernetes cluster** (Minikube/Kind) with **secure TLS communication**.

---

## 🎯 Objective
To containerize and deploy the Wisecow application hosted on GitHub, ensuring:
- Dockerization of the application.
- Deployment on a Kubernetes cluster.
- Ingress configuration with HTTPS/TLS.
- Validation of successful access via browser using HTTPS.

---

## 🧱 Project Structure
wisecow/
│
├── Dockerfile
├── k8s/
│ ├── deployment.yaml
│ ├── service.yaml
│ ├── ingress.yaml
│
├── wisecow.py
├── requirements.txt
└── README.md

yaml
Copy code

---

## 🐳 Dockerization Steps

### 1. Build Docker Image
```bash
docker build -t wisecow-app:latest .
2. Run the Container
bash
Copy code
docker run -d -p 4499:4499 wisecow-app:latest
3. Verify Application
Open your browser and go to
👉 http://localhost:4499

If the app shows random cow quotes, Docker setup is working fine ✅

☸️ Kubernetes Deployment Steps
1. Create Namespace (optional)
bash
Copy code
kubectl create namespace wisecow
2. Deploy the Application
bash
Copy code
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
3. Deploy Ingress Controller (if not installed)
For Minikube:

bash
Copy code
minikube addons enable ingress
4. Apply Ingress Configuration
bash
Copy code
kubectl apply -f k8s/ingress.yaml
5. Verify Resources
bash
Copy code
kubectl get all -n wisecow
kubectl get ingress -n wisecow
🔒 TLS Setup
If required by assignment:

Create a self-signed certificate:

bash
Copy code
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout tls.key -out tls.crt -subj "/CN=wisecow.local"
Create a Kubernetes secret:

bash
Copy code
kubectl create secret tls wisecow-tls \
--cert=tls.crt --key=tls.key -n wisecow
Update ingress.yaml to reference wisecow-tls.

🌐 Access the Application
After successful deployment:

Run:

bash
Copy code
minikube ip
Add the IP to /etc/hosts file:

lua
Copy code
<minikube-ip> wisecow.local
Open browser:
👉 https://wisecow.local


🧰 Tools & Technologies
Docker

Kubernetes / Minikube

Nginx Ingress Controller

Python / Flask

TLS (Self-signed certificate)

🏁 Conclusion
This project successfully demonstrates:

Containerizing a Python app using Docker.

Deploying it on Kubernetes.

Configuring Ingress with TLS for secure communication.

onfigured with KubeArmor.
