# Zero-Touch API Gateway with Tyk & GitOps

**Deliver a frictionless API onboarding experience**: microservices self-register in Tyk without manual intervention, fully managed via GitOps.

### Core Capabilities
- **Automated Onboarding**: New OpenAPI specs → Git PR → lint & Helm-package → ChartMuseum.
- **Policy-as-Code**: Gateway routing, auth, rate-limits defined in Helm values.
- **Self-Healing Delivery**: ArgoCD continuously reconciles both gateway and downstream apps.
- **Analytics Pipeline**: Tyk Pump sends telemetry to Azure Storage for downstream BI.

### Tech Stack
- **Kubernetes & Helm** – deploy Tyk Gateway + Pump  
- **Terraform** – provision Azure Container Registry & Storage  
- **GitHub Actions** – OpenAPI linting, Helm packaging, ChartMuseum delivery  
- **ArgoCD** – GitOps reconciliation for both gateway and services

### Business Outcomes
- **Speed**: Onboard new APIs in minutes, not days.  
- **Governance**: All gateway policies are versioned and peer-reviewed.  
- **Scalability**: Seamless scaling from 0→N gateways & services.  
- **Observability**: End-to-end telemetry in your BI tools.

### Prerequisites
- Azure subscription + Contributor role  
- Helm v3 & `helm-push` plugin  
- ChartMuseum endpoint (AKS-accessible)  
- ArgoCD installed in target cluster  

### Quickstart
1. `git clone` & customize `terraform/variables.tf`  
2. `cd terraform && terraform init && terraform apply`  
3. Push a new OpenAPI spec under `charts/sample-microservice/values.yaml`  
4. Create a PR → GitHub Actions lints + packages → pushes to ChartMuseum  
5. Approve & merge → ArgoCD auto-syncs Tyk Gateway & service charts  
6. Watch your new API live on the gateway without any manual config!
