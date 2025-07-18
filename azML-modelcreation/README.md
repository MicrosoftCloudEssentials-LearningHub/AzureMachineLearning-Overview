# Demostration: Creating a Machine Learning Model

Costa Rica

[![GitHub](https://img.shields.io/badge/--181717?logo=github&logoColor=ffffff)](https://github.com/)
[brown9804](https://github.com/brown9804)

Last updated: 2025-07-16

------------------------------------------

<details>
<summary><b>List of References </b> (Click to expand)</summary>

- [AutoML Regression](https://learn.microsoft.com/en-us/azure/machine-learning/component-reference-v2/regression?view=azureml-api-2)
- [Evaluate automated machine learning experiment results](https://learn.microsoft.com/en-us/azure/machine-learning/how-to-understand-automated-ml?view=azureml-api-2)
- [Evaluate Model component](https://learn.microsoft.com/en-us/azure/machine-learning/component-reference/evaluate-model?view=azureml-api-2)

</details>

<details>
<summary><b>Table of Content </b> (Click to expand)</summary>

- [Step 1: Set Up Your Azure ML Workspace](#step-1-set-up-your-azure-ml-workspace)
- [Step 2: Create a Compute Instance](#step-2-create-a-compute-instance)
- [Step 3: Prepare Your Data](#step-3-prepare-your-data)
- [Step 4: Create a New Notebook or Script](#step-4-create-a-new-notebook-or-script)
- [Step 5: Load and Explore the Data](#step-5-load-and-explore-the-data)
- [Step 6: Train Your Model](#step-6-train-your-model)
- [Step 7: Evaluate the Model](#step-7-evaluate-the-model)
- [Step 8: Register the Model](#step-8-register-the-model)
- [Step 9: Deploy the Model](#step-9-deploy-the-model)
- [Step 10: Test the Endpoint](#step-10-test-the-endpoint)

</details>

## Step 1: Set Up Your Azure ML Workspace

> You can use the azure portal approach:

- Go to the [Azure Portal](https://portal.azure.com/)
- Create a **Machine Learning workspace**:
  - Resource group
  - Workspace name
  - Region
- Once created, launch **Azure Machine Learning Studio**.

https://github.com/user-attachments/assets/c199156f-96cf-4ed0-a8b5-c88db3e7a552

> Or using terraform configurations for setting up an Azure Machine Learning workspace along with compute clusters and supportive resources to form the core of an ML platform, click here to see [Demonstration: Deploying Azure Resources for an ML Platform](./infrastructure/azMachineLearning/README.md)

## Step 2: Create a Compute Instance

1. **Go to [Azure Machine Learning Studio](https://ml.azure.com/)** and select your workspace.
2. **Select `Compute` from the left menu**  Choose the **`Compute instances`** tab.
3. **Click `New`**  
   - Enter a name for your compute instance.
   - Choose a virtual machine size (e.g., `Standard_DS3_v2`).
   - Optionally, enable SSH access or assign a user.
4. **Click `Create`**: Azure will provision the compute instance, which may take a few minutes.

    https://github.com/user-attachments/assets/bd5f3ce6-7082-4741-8827-8b344cd249a4

## Step 3: Prepare Your Data

- Upload your dataset to **Azure ML datastore** or connect to exrnal sources (e.g., Azure Blob Storage, SQL, etc.).
- Use **Data > Datasets** to register and version your dataset.

> For example: Upload the CSV to Azure ML

1. Under to **Data > + Create > From local files**.
2. Choose:
   - **Name**: `employee_data`
   - **Type**: Tabular
   - **Browse** and upload the [sample_data.csv](./data/sample_data.csv) file.
3. Click **Next**, then **Review + Create**.

> Register the Dataset: 

1. After upload, Azure will preview the data.
2. Confirm the schema (column names and types).
3. Click **Create** to register the dataset.

https://github.com/user-attachments/assets/f8cbd32c-94fc-43d3-a7a8-00f63cdc543d

## Step 4: Create a New Notebook or Script

- Use the compute instance to open a **Jupyter notebook** or create a Python script.
- Import necessary libraries:

  ```python
  import pandas as pd
  from sklearn.model_selection import train_test_split
  from sklearn.ensemble import RandomForestClassifier
  from sklearn.metrics import accuracy_score
  ```

  https://github.com/user-attachments/assets/16650584-11cb-48fb-928d-c032e519c14b

## Step 5: Load and Explore the Data

> Load the dataset and perform basic EDA (exploratory data analysis):

  ```python
  import mltable
  from azure.ai.ml import MLClient
  from azure.identity import DefaultAzureCredential
  
  ml_client = MLClient.from_config(credential=DefaultAzureCredential())
  data_asset = ml_client.data.get("employee_data", version="1")
  
  tbl = mltable.load(f'azureml:/{data_asset.id}')
  
  df = tbl.to_pandas_dataframe()
  df
  ```

  https://github.com/user-attachments/assets/5fa65d95-8502-4ab7-ba0d-dfda66378cc2

## Step 6: Train Your Model

> Split the data and train a model:

  ```python
  # Step 1: Preprocessing
  from sklearn.preprocessing import LabelEncoder, StandardScaler
  
  # Encode categorical columns
  label_encoder = LabelEncoder()
  df['Department'] = label_encoder.fit_transform(df['Department'])
  
  # Drop non-informative or high-cardinality columns
  if 'Name' in df.columns:
      df = df.drop(columns=['Name'])  # 'Name' is likely not predictive
  
  # Optional: Check for missing values
  if df.isnull().sum().any():
      df = df.dropna()  # or use df.fillna(method='ffill') for imputation
  
  # Step 2: Define Features and Target
  X = df.drop('Salary', axis=1)  # Features: Age and Department
  y = df['Salary']               # Target: Salary
  
  # Optional: Feature Scaling (especially useful for models sensitive to scale)
  scaler = StandardScaler()
  X_scaled = scaler.fit_transform(X)
  
  # Step 3: Split the Data
  from sklearn.model_selection import train_test_split
  
  X_train, X_test, y_train, y_test = train_test_split(
      X_scaled, y, test_size=0.2, random_state=42
  )
  
  # Step 4: Train a Regression Model
  from sklearn.ensemble import RandomForestRegressor
  
  model = RandomForestRegressor(
      n_estimators=100,
      max_depth=None,
      random_state=42,
      n_jobs=-1  # Use all available cores
  )
  model.fit(X_train, y_train)
  ```

  https://github.com/user-attachments/assets/2176c795-5fda-4746-93c7-8b137b526a09

## Step 7: Evaluate the Model

> Check performance:

  ```python
  # Step 5: Make Predictions
  predictions = model.predict(X_test)
  
  # Step 6: Evaluate the Model
  from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
  import numpy as np
  
  mae = mean_absolute_error(y_test, predictions)
  mse = mean_squared_error(y_test, predictions)
  rmse = np.sqrt(mse)
  r2 = r2_score(y_test, predictions)
  
  print("Model Evaluation Metrics")
  print(f"Mean Absolute Error (MAE): {mae:.2f}")
  print(f"Mean Squared Error (MSE): {mse:.2f}")
  print(f"Root Mean Squared Error (RMSE): {rmse:.2f}")
  print(f"R² Score: {r2:.2f}")
  ```

  <img width="550" alt="image" src="https://github.com/user-attachments/assets/6aa19680-cadb-4fe4-a419-a626942e15f9" />

> Distribution of prediction errors:

```python
import matplotlib.pyplot as plt

# Plot 1: Distribution of prediction errors
errors = y_test - predictions
plt.figure(figsize=(10, 6))
plt.hist(errors, bins=30, color='skyblue', edgecolor='black')
plt.title('Distribution of Prediction Errors')
plt.xlabel('Prediction Error')
plt.ylabel('Frequency')
plt.grid(True)
plt.show()

# Plot 2: Predicted vs Actual values
plt.figure(figsize=(10, 6))
plt.scatter(y_test, predictions, alpha=0.3, color='darkorange')
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'k--', lw=2)
plt.title('Predicted vs Actual Salary')
plt.xlabel('Actual Salary')
plt.ylabel('Predicted Salary')
plt.grid(True)
plt.show()
```

<img width="550" alt="image" src="https://github.com/user-attachments/assets/d8ec1f2c-eb97-4106-9cee-809849d02796">

## Step 8: Register the Model

> Save and register the model in Azure ML:

  ```python
  import joblib
  joblib.dump(model, 'model.pkl')
  
  from azureml.core import Workspace, Model
  ws = Workspace.from_config()
  Model.register(workspace=ws, model_path="model.pkl", model_name="my_model_RegressionModel")
  ```

https://github.com/user-attachments/assets/a82ff03e-437c-41bc-85fa-8b9903384a5b


> [!TIP]
> Click [here](./src/0_ml-model-creation.ipynb) to read the script used.

## Step 9: Deploy the Model

> Create the scoring script as demonstrated in the video below. Click to see a more detailed [sample of the scoring file with debugs and logs included](./src/score.py)

  https://github.com/user-attachments/assets/cdc64857-3bde-4ec9-957d-5399d9447813

> Create the Environment File (env.yaml):

https://github.com/user-attachments/assets/8e7c37a2-e32b-4630-8516-f95926c374c0

> Create a new notebook:

https://github.com/user-attachments/assets/1b3e5602-dc64-4c39-be72-ed1cbd74361e

> Create an **inference configuration** and deploy to a web service:

  ```python
  from azureml.core import Workspace
  from azureml.core.environment import Environment
  from azureml.core.model import InferenceConfig, Model
  from azureml.core.webservice import AciWebservice
  
  # Load the workspace
  ws = Workspace.from_config()
  
  # Get the registered model
  registered_model = Model(ws, name="my_model_RegressionModel")
  
  # Create environment from requirements.txt (no conda)
  env = Environment.from_pip_requirements(
      name="regression-env",
      file_path="requirements.txt"  # Make sure this file exists in your working directory
  )
  
  # Define inference configuration
  inference_config = InferenceConfig(entry_script="score.py", environment=env)
  
  # Define deployment configuration
  deployment_config = AciWebservice.deploy_configuration(cpu_cores=1, memory_gb=1)
  
  # Deploy the model
  service = Model.deploy(
      workspace=ws,
      name="regression-model-service",
      models=[registered_model],
      inference_config=inference_config,
      deployment_config=deployment_config
  )
  
  service.wait_for_deployment(show_output=True)
  print(f"Scoring URI: {service.scoring_uri}")
  ```



## Step 10: Test the Endpoint

> Once deployed, you can send HTTP requests to the endpoint to get predictions.

<!-- START BADGE -->
<div align="center">
  <img src="https://img.shields.io/badge/Total%20views-9-limegreen" alt="Total views">
  <p>Refresh Date: 2025-07-16</p>
</div>
<!-- END BADGE -->
