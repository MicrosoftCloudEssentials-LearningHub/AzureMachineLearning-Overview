# Azure Machine Learning - Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-29

------------------------------------------


<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Azure Machine Learning pricing](https://azure.microsoft.com/en-us/pricing/details/machine-learning/?msockid=38ec3806873362243e122ce086486339)
- [Quickstart: Get started with Azure Machine Learning](https://learn.microsoft.com/en-us/azure/machine-learning/tutorial-azure-ml-in-a-day?view=azureml-api-2)
- [Azure AI Foundry portal or Azure Machine Learning studio: Which experience should I choose?](https://learn.microsoft.com/en-us/ai/ai-studio-experiences-overview?toc=%2Fazure%2Fmachine-learning%2Ftoc.json&bc=%2Fazure%2Fmachine-learning%2Fbreadcrumb%2Ftoc.json&view=azureml-api-2)
- [Using Azure Machine Learning (AML) for Medical Imaging Vision Model Training and Fine-tuning](https://techcommunity.microsoft.com/blog/machinelearningblog/using-azure-machine-learning-aml-for-medical-imaging-vision-model-training-and-f/4408743)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

</details>

> Azure Machine Learning (PaaS) is a cloud-based platform from Microsoft designed to help `data scientists and machine learning engineers build, train, deploy, and manage machine learning models at scale`. It supports the `entire machine learning lifecycle, from data preparation and experimentation to deployment and monitoring.` It provides powerful tools for `both code-first and low-code users`, including Jupyter notebooks, drag-and-drop interfaces, and automated machine learning (AutoML). `Azure ML integrates seamlessly with other Azure services and supports popular frameworks like TensorFlow, PyTorch, and Scikit-learn.`

https://github.com/user-attachments/assets/c199156f-96cf-4ed0-a8b5-c88db3e7a552

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

> Click here to read more about [Azure AI Foundry portal or Azure Machine Learning studio: Which experience should I choose? - Detailed feature comparison](https://learn.microsoft.com/en-us/ai/ai-studio-experiences-overview?toc=%2Fazure%2Fmachine-learning%2Ftoc.json&bc=%2Fazure%2Fmachine-learning%2Fbreadcrumb%2Ftoc.json&view=azureml-api-2#detailed-feature-comparison)

## Workspace 

> A taxonomy of the workspace is illustrated in the following diagram, from [What is an Azure Machine Learning workspace?](https://learn.microsoft.com/en-us/azure/machine-learning/concept-workspace?view=azureml-api-2) <br/>
> **`Compute Instances`**: Preconfigured VMs (CPU/GPU) used for development, experimentation, and running notebooks. <br/>
> **`Experiments`**: A training run that executes a script with different configurations (e.g., hyperparameters, datasets). It helps track and compare model performance across multiple runs. <br/>
> **`Model`**: The result of a successful experiment. It represents the trained algorithm and is registered in Azure ML for versioning and reuse. A registered model is essentially the output artifact of an experiment. <br/>
> **`Endpoint`**: A deployed model exposed as a web service or REST API. Endpoints allow real-time or batch inference. It's important to configure security settings properly, including network access (e.g., VNet integration) and port restrictions. <br/>
> **`Pipelines`**: Reusable, modular workflows that chain together multiple steps (e.g., data prep, training, evaluation). Useful for automating and orchestrating ML processes. <br/>
> **`Datasets`**: Versioned data assets used in experiments and pipelines. They ensure consistency and reproducibility across training runs. <br/>
> **`Registered Models`**: The output of successful experiments. These are trained models saved and versioned for deployment and reuse. <br/>
> **`Deployment Endpoints`**: Deployed models exposed as REST APIs for real-time or batch inference. Security settings (e.g., VNet, authentication, ports) should be reviewed carefully. <br/>

<div align="center">
  <img src="https://github.com/user-attachments/assets/f3a987a8-ec59-42de-9e56-29c41c8e55a9" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

Read more about [Endpoints for inference in production](https://learn.microsoft.com/en-us/azure/machine-learning/concept-endpoints?view=azureml-api-2)

<div align="center">
  <img src="https://github.com/user-attachments/assets/aa5a0671-e9b8-4ae1-bd69-5098218b63d5" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>

## Authoring

<details>
  <summary>Notebooks</summary>

  > Azure ML provides integrated Jupyter notebooks that run on managed compute instances (CPU or GPU). These notebooks support Python and R, and come pre-installed with popular ML libraries like TensorFlow, PyTorch, Scikit-learn, and pandas. Users can access data from registered datasets, run experiments, and track metrics directly from the notebook using the Azure ML SDK. Notebooks can also be version-controlled and scheduled as part of pipelines.

</details>

<details>
  <summary>Automated ML</summary>

  > Automated ML (AutoML) enables users to train models for classification, regression, and time-series forecasting without writing code. It performs algorithm selection, hyperparameter tuning, and model ensembling. Users can configure training constraints such as timeouts, primary metrics, and validation strategies. AutoML runs are tracked as experiments, and the best model can be registered and deployed directly from the UI or SDK.

</details>

<details>
  <summary>Designer</summary>

  > The Designer is a visual interface for building machine learning pipelines using a drag-and-drop canvas. It supports data ingestion, transformation, model training, evaluation, and deployment. Each component in the pipeline is backed by a module (e.g., data split, normalization, logistic regression). Pipelines can be published as REST endpoints and reused in production workflows. Designer supports both built-in modules and custom Python scripts.

</details>

<details>
  <summary>Prompt Flow</summary>

  > Prompt Flow is a development tool for building and managing prompt-based workflows for large language models (LLMs). It allows chaining of prompts, tools (e.g., Python functions, APIs), and control logic into structured flows. Developers can test, evaluate, and deploy these flows as endpoints. Prompt Flow supports integration with Azure OpenAI, LangChain, and Semantic Kernel, and includes telemetry for prompt performance and cost tracking.

</details>


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
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
