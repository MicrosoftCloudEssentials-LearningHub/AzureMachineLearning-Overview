# Azure Machine Learning - Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-28

------------------------------------------


<details>
<summary><b>List of References </b> (Click to expand)</summary>

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

</details>

> Azure Machine Learning (PaaS) is a cloud-based platform from Microsoft designed to help `data scientists and machine learning engineers build, train, deploy, and manage machine learning models at scale`. It supports the `entire machine learning lifecycle, from data preparation and experimentation to deployment and monitoring.` It provides powerful tools for `both code-first and low-code users`, including Jupyter notebooks, drag-and-drop interfaces, and automated machine learning (AutoML). `Azure ML integrates seamlessly with other Azure services and supports popular frameworks like TensorFlow, PyTorch, and Scikit-learn.`

| Feature / Platform       | Azure Machine Learning                                  | Microsoft Fabric                                         | Azure AI Foundry                                         |
|--------------------------|----------------------------------------------------------|-----------------------------------------------------------|-----------------------------------------------------------|
| **Purpose**              | End-to-end ML lifecycle management and MLOps             | Unified data analytics and business intelligence platform | Unified platform for building and deploying AI solutions  |
| **Model Deployment**     | Supports real-time and batch deployment via AKS, ACI     | Limited ML deployment; integrates with Azure ML           | Deploys models as APIs or services within projects        |
| **Compute Options**      | Compute instances, clusters, Kubernetes, attached compute| Uses OneLake and Spark compute for data processing        | Managed compute for model training and inference          |
| **Notebook Support**     | Jupyter notebooks, VS Code integration                   | Notebooks in Data Science experience (powered by Spark)   | Code-first notebooks and SDK integration                  |
| **AutoML**               | Built-in AutoML for classification, regression, etc.     | Not available directly                                    | Not primary focus, but supports model selection and tuning|
| **MLOps & Monitoring**   | Full MLOps support with versioning, CI/CD, monitoring    | Not a core feature                                        | Continuous monitoring and governance for AI apps          |
| **Target Users**         | Data scientists, ML engineers                            | Data analysts, data scientists, data engineers, developers, business users, executives                           | AI developers, app builders, enterprise teams             |
| **Integration**          | Azure DevOps, GitHub, MLflow                             | Power BI, Synapse, Azure Data Factory                     | GitHub, VS Code, LangChain, Semantic Kernel, Azure AI     |


## Workspace 

## Authoring

## Assets

## Manage

| Compute Type         | Description | Purpose | Ideal Use Cases | Key Features |
|----------------------|-------------|---------|------------------|---------------|
| **Compute Instances** | Preconfigured VMs (CPU/GPU) with tools like VS Code, JupyterLab, and RStudio. | Interactive development and experimentation. | Data exploration, model prototyping, debugging. | Auto-shutdown, integrated notebooks, preinstalled ML frameworks. |
| **Compute Clusters**  | Scalable clusters that auto-scale based on workload. Supports both CPU and GPU nodes. | Distributed training and batch inference. | Training large models, running parallel experiments. | Autoscaling, cost control, reusable across users. |
| **Kubernetes Clusters** | Includes AKS and attached Kubernetes clusters for production-grade deployments. | Real-time inference and scalable deployment. | Hosting REST endpoints, high-availability inference. | Load balancing, autoscaling, secure networking. |
| **Attached Compute** | External compute resources manually connected to Azure ML. | Leverage existing infrastructure. | Using Azure VMs, Databricks, or on-prem compute. | Flexibility, hybrid cloud support, reuse of existing resources. |
| **Serverless Instances** | Lightweight, on-demand compute (e.g., Azure Container Instances). | Quick testing and low-scale inference. | Temporary model deployment, dev/test environments. | No infrastructure management, fast startup, cost-effective. |

<div align="center">
  <img src="" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>


<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
