# Azure Machine Learning - Overview 

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-04-29

------------------------------------------

> Topics:

- [Azure Machine Learning - Overview](./README.md)
- [Demonstration: Deploying Azure Resources for a Data Platform (Microsoft Fabric)](./infrastructure/msFabric/) - Terraform
- [Demonstration: Deploying Azure Resources for an ML Platform](./infrastructure/azMachineLearning/) - Terraform
- [Demostration: How to integrate AI in Microsoft Fabric](./msFabric-AI_integration/)

> Azure Machine Learning (PaaS) is a cloud-based platform from Microsoft designed to help `data scientists and machine learning engineers build, train, deploy, and manage machine learning models at scale`. It supports the `entire machine learning lifecycle, from data preparation and experimentation to deployment and monitoring.` It provides powerful tools for `both code-first and low-code users`, including Jupyter notebooks, drag-and-drop interfaces, and automated machine learning (AutoML). `Azure ML integrates seamlessly with other Azure services and supports popular frameworks like TensorFlow, PyTorch, and Scikit-learn.`

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [Azure Machine Learning pricing](https://azure.microsoft.com/en-us/pricing/details/machine-learning/?msockid=38ec3806873362243e122ce086486339)
- [Quickstart: Get started with Azure Machine Learning](https://learn.microsoft.com/en-us/azure/machine-learning/tutorial-azure-ml-in-a-day?view=azureml-api-2)
- [Azure AI Foundry portal or Azure Machine Learning studio: Which experience should I choose?](https://learn.microsoft.com/en-us/ai/ai-studio-experiences-overview?toc=%2Fazure%2Fmachine-learning%2Ftoc.json&bc=%2Fazure%2Fmachine-learning%2Fbreadcrumb%2Ftoc.json&view=azureml-api-2)
- [Using Azure Machine Learning (AML) for Medical Imaging Vision Model Training and Fine-tuning](https://techcommunity.microsoft.com/blog/machinelearningblog/using-azure-machine-learning-aml-for-medical-imaging-vision-model-training-and-f/4408743)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Workspace](#workspace)
- [Authoring](#authoring)
- [Assets](#assets)
- [Manage](#manage)

</details>

https://github.com/user-attachments/assets/c199156f-96cf-4ed0-a8b5-c88db3e7a552

| Feature / Platform       | Azure Machine Learning                                  | [Microsoft Fabric](./msFabric-AI_integration)                                         | Azure AI Foundry                                         |
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

> The following diagram illustrates how you can use a single Environment object in both your run configuration (for training) and your inference and deployment configuration (for web service deployments). <br/>
> Image from [What are Azure Machine Learning environments?](https://learn.microsoft.com/en-us/azure/machine-learning/concept-environments?view=azureml-api-2)


<div align="center">
  <img src="https://github.com/user-attachments/assets/2bc9ccd7-ebe9-478e-ad7d-e10eee0d1892" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>


<details>
  <summary><strong>Data</strong></summary>

  > **Datasets** are foundational assets in machine learning workflows. In Azure Machine Learning, registered datasets are used across experiments, pipelines, and jobs to ensure consistency and reproducibility. These datasets can be versioned and stored in Azure Blob Storage or other supported data sources. Azure ML supports various data formats, including tabular data (e.g., CSV, Parquet), file-based data (e.g., images, text files), and URI-based references. By registering datasets, teams can track data lineage, manage access, and ensure that models are trained and evaluated on consistent data versions.

  1. Prepare your data in a supported format (e.g., CSV, JSON, images).
  2. Upload the data to Azure Blob Storage or another supported location.
  3. Register the dataset using the Azure ML SDK, CLI, or Studio.
  4. Version the dataset to track changes over time.
  5. Use the dataset in jobs, pipelines, or experiments to ensure reproducibility.

</details>

<details>
  <summary><strong>Jobs</strong></summary>

  > **Jobs** represent individual executions of scripts, components, or pipelines in Azure ML. Each job captures inputs, outputs, logs, metrics, and environment details. Jobs can be triggered manually, on a schedule, or as part of a pipeline. They provide full traceability and monitoring for ML experiments and production workflows.

  1. Define your script or component (e.g., training or evaluation logic).
  2. Specify inputs (datasets, parameters) and expected outputs.
  3. Configure the environment (Docker image, Conda dependencies).
  4. Submit the job using the Azure ML SDK, CLI, or Studio interface.
  5. Monitor the job’s progress, view logs, and analyze metrics.

</details>

<details>
  <summary><strong>Components</strong></summary>

  > **Components** are modular, reusable units of computation in Azure ML. They encapsulate specific tasks such as data preprocessing, model training, or evaluation. Defined using YAML, components support versioning and parameterization, and are the core building blocks of pipelines.

  1. Write a script that performs a specific task (e.g., `train.py`).
  2. Create a YAML file defining the component (inputs, outputs, environment).
  3. Register the component in Azure ML.
  4. Use the component in pipelines or jobs.
  5. Version the component to enable reuse and traceability.

</details>

<details>
  <summary><strong>Pipelines</strong></summary>

  > **Pipelines** orchestrate multiple components into a complete machine learning workflow. They support parallelism, conditional logic, and reuse. Pipelines can be triggered via REST API, CLI, or SDK, and are ideal for automating ML workflows from data ingestion to deployment.

  1. Define components for each stage (e.g., preprocessing, training, evaluation).
  2. Chain components together using the Azure ML SDK.
  3. Specify data flow and dependencies between components.
  4. Submit the pipeline as a job.
  5. Monitor execution and reuse pipelines for automation and CI/CD.

</details>

<details>
  <summary><strong>Environments</strong></summary>

  > **Environments** define the runtime configuration for jobs and components. They include Docker base images, Conda dependencies, and environment variables. Environments ensure consistency across development, training, and production stages.

  1. Create a Conda YAML file or specify a Docker image.
  2. Register the environment in Azure ML.
  3. Attach the environment to jobs or components.
  4. Version environments to maintain reproducibility.
  5. Use consistent environments across all stages of the ML lifecycle.

</details>

<details>
  <summary><strong>Models</strong></summary>

  > **Models** are trained artifacts stored in the Azure ML workspace. They can be versioned, registered, and deployed to endpoints. Each model includes metadata, lineage, and evaluation metrics, supporting traceability and governance.

  1. Train a model using a job or pipeline.
  2. Register the model in the Azure ML workspace.
  3. Attach metadata such as metrics, tags, and lineage.
  4. Version the model to track improvements.
  5. Deploy the model to an endpoint for inference.

</details>

<details>
  <summary><strong>Endpoints</strong></summary>

  > **Endpoints** expose deployed models as REST APIs for real-time (online) or batch inference. They support authentication, virtual network (VNet) integration, and traffic splitting for A/B testing or gradual rollouts.

  1. Choose a deployment target (real-time or batch).
  2. Create an inference configuration (entry script, environment).
  3. Deploy the model to an endpoint.
  4. Secure the endpoint with authentication and networking rules.
  5. Monitor and scale the endpoint as needed.

</details>

Read more about [Endpoints for inference in production](https://learn.microsoft.com/en-us/azure/machine-learning/concept-endpoints?view=azureml-api-2)

<img src="https://github.com/user-attachments/assets/aa5a0671-e9b8-4ae1-bd69-5098218b63d5" alt="Centered Image" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>


## Manage

<details>
  <summary><strong>Compute</strong></summary>

  > **Compute** resources are the backbone of Azure Machine Learning workloads. This section allows you to create, manage, and monitor compute instances and clusters used for development, training, and inference. It supports various compute types including personal VMs, scalable clusters, and attached external resources.

1. Navigate to **Manage > Compute** in Azure ML Studio.
2. Choose the type of compute: Instance (for development), Cluster (for training), or Inference Cluster (for deployment).
3. Configure the compute settings (VM size, scaling, idle shutdown).
4. Attach external compute if needed (e.g., Azure Databricks, AKS).
5. Monitor usage, status, and logs from the same interface.

| Compute Type         | Description | Purpose | Ideal Use Cases | Key Features |
|----------------------|-------------|---------|------------------|---------------|
| **Compute Instances** | Preconfigured VMs (CPU/GPU) with tools like VS Code, JupyterLab, and RStudio. | Interactive development and experimentation. | Data exploration, model prototyping, debugging. | Auto-shutdown, integrated notebooks, preinstalled ML frameworks. |
| **Compute Clusters**  | Scalable clusters that auto-scale based on workload. Supports both CPU and GPU nodes. | Distributed training and batch inference. | Training large models, running parallel experiments. | Autoscaling, cost control, reusable across users. |
| **Kubernetes Clusters** | Includes AKS and attached Kubernetes clusters for production-grade deployments. | Real-time inference and scalable deployment. | Hosting REST endpoints, high-availability inference. | Load balancing, autoscaling, secure networking. |
| **Attached Compute** | External compute resources manually connected to Azure ML. | Leverage existing infrastructure. | Using Azure VMs, Databricks, or on-prem compute. | Flexibility, hybrid cloud support, reuse of existing resources. |
| **Serverless Instances** | Lightweight, on-demand compute (e.g., Azure Container Instances). | Quick testing and low-scale inference. | Temporary model deployment, dev/test environments. | No infrastructure management, fast startup, cost-effective. |

> How to create a Compute Instance: 
 
1. **Go to Azure Machine Learning Studio**: Navigate to [ml.azure.com](https://ml.azure.com/) and select your workspace.
2. **Select `Compute` from the left menu**  Choose the **`Compute instances`** tab.
3. **Click `New`**  
   - Enter a name for your compute instance.
   - Choose a virtual machine size (e.g., `Standard_DS3_v2`).
   - Optionally, enable SSH access or assign a user.
4. **Click `Create`**: Azure will provision the compute instance, which may take a few minutes.

    https://github.com/user-attachments/assets/bd5f3ce6-7082-4741-8827-8b344cd249a4

</details>

<details>
  <summary><strong>Monitoring</strong></summary>

  > **Monitoring** provides visibility into the performance and health of your ML assets. It includes logs, metrics, and telemetry for jobs, pipelines, and deployed endpoints. This helps ensure reliability, detect anomalies, and maintain model quality over time.

  1. Go to **Manage > Monitoring**.
  2. Select the asset you want to monitor (e.g., job, endpoint).
  3. View logs, metrics, and telemetry data.
  4. Set up alerts for failures or performance thresholds.
  5. Use insights to debug issues or optimize performance.

</details>

<details>
  <summary><strong>Data Labeling</strong></summary>

  > **Data Labeling** enables you to create and manage labeling projects for supervised learning. It supports image, text, and tabular data, and allows collaboration with human labelers or integration with labeling services.

  1. Open **Manage > Data Labeling**.
  2. Create a new labeling project and select the data type.
  3. Upload or link the dataset to be labeled.
  4. Assign labeling tasks to users or services.
  5. Export the labeled dataset for training or evaluation.

</details>

<details>
  <summary><strong>Linked Services (Preview)</strong></summary>

  > **Linked Services** allow you to connect your Azure ML workspace to external data sources like Azure Data Lake, Blob Storage, or SQL databases. This simplifies data access and centralizes configuration for use in datasets and pipelines.

  1. Navigate to **Manage > Linked Services**.
  2. Add a new linked service by selecting the data source type.
  3. Provide connection details and authentication credentials.
  4. Test the connection to ensure access.
  5. Use the linked service in datasets or pipeline steps.

</details>

<details>
  <summary><strong>Connections (Preview)</strong></summary>

  > **Connections** manage secure access to external systems and APIs. They store credentials and authentication methods, enabling secure and reusable access in jobs and pipelines.

  1. Go to **Manage > Connections**.
  2. Create a new connection (e.g., to a REST API or database).
  3. Define the authentication method (e.g., service principal, managed identity).
  4. Save and test the connection.
  5. Reference the connection in your components or pipelines.

</details>





<div align="center">
  <h3 style="color: #4CAF50;">Total Visitors</h3>
  <img src="https://profile-counter.glitch.me/brown9804/count.svg" alt="Visitor Count" style="border: 2px solid #4CAF50; border-radius: 5px; padding: 5px;"/>
</div>
