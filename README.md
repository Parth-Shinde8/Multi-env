# 🚀 Multi-Environment DevOps CI/CD Pipeline

A production-grade CI/CD pipeline built using **GitHub Actions, Docker, AWS ECR, Kubernetes, and Helm**, supporting **multi-environment deployments (Dev, Staging, Prod)** with **Blue-Green deployment and automated rollback**.

---

## 📌 Project Overview

This project demonstrates a complete DevOps workflow where application code is automatically:

* Built into Docker images
* Pushed to AWS ECR
* Deployed to Kubernetes clusters
* Promoted across environments (Dev → Staging → Production)
* Validated via health checks before production release
* Automatically rolled back on failure

---

## 🏗️ Architecture

```

```

---

## ⚙️ Tech Stack

* **CI/CD**: GitHub Actions
* **Containerization**: Docker
* **Registry**: AWS ECR
* **Orchestration**: Kubernetes (k3s)
* **Package Manager**: Helm
* **Cloud**: AWS EC2
* **Scripting**: Bash

---

## 🌍 Environments

| Branch    | Environment | Deployment            |
| --------- | ----------- | --------------------- |
| `dev`     | Development | Auto deploy           |
| `staging` | Staging     | Auto deploy           |
| `main`    | Production  | Blue-Green deployment |

---

## 🔁 CI/CD Pipeline Flow

1. Code pushed to GitHub
2. GitHub Actions triggers pipeline
3. Docker image is built and tagged
4. Image pushed to AWS ECR
5. Deployment triggered based on branch:

   * `dev` → Dev environment
   * `staging` → Staging environment
   * `main` → Production (Blue-Green)

---

## 🔵🟢 Blue-Green Deployment (Production)

* New version deployed to **Green environment**
* Health check performed before switching traffic
* If successful → traffic shifts to Green
* If failed → system automatically rolls back to Blue

---

## 🔄 Automated Rollback

* Health check via service endpoint (`curl`)
* If deployment fails:

  * Traffic remains on stable (Blue) version
  * Pipeline exits with failure
* Ensures **zero downtime and high reliability**

---

## 🏷️ Versioning Strategy

Each build is tagged as:

```
v<run_number>-<commit_sha>
```

Example:

```
v12-a1b2c3d
```

---

## 📂 Project Structure

```
.
├── .github/workflows/deploy.yml   # CI/CD pipeline
├── app/                           # Node.js application
│   ├── dockerfile
│   └── index.js
├── terraform/                     # Infrastructure provisioning
├── .gitignore
```

---

## 🔐 Secrets Used

Configured in GitHub Actions:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `EC2_IP`
* `EC2_SSH_KEY`

---

## 🧪 Testing Strategy

### ✅ Success Scenario

* Application deploys successfully
* Traffic switches to new version

### ❌ Failure Scenario

* Application crash simulated (`process.exit(1)`)
* Health check fails
* Automatic rollback triggered

---

## 📊 Key Features

✔ Multi-environment deployment
✔ Automated CI/CD pipeline
✔ Docker + AWS ECR integration
✔ Kubernetes + Helm deployment
✔ Blue-Green deployment strategy
✔ Automated rollback on failure
✔ Version-controlled deployments

---

## 🎯 Outcome

* Achieved **zero-downtime deployments**
* Implemented **production-grade release strategy**
* Built a **real-world DevOps pipeline** used in modern cloud systems

---

## 🚀 Future Improvements

* Monitoring with Prometheus & Grafana
* Alerting system (Slack/Email)
* Manual approval gates for production
* Canary deployments





