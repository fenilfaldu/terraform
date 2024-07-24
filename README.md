# Terraform Task1

## Deploy Dockerized Application to Google Cloud Run

This guide will help you set up and deploy a Dockerized "Hello World" application to Google Cloud Run using Terraform.

## Prerequisites:

1.Google Cloud Account: Ensure you have an active Google Cloud account.
2.Google Cloud SDK: Install and configure the Google Cloud SDK.
3.Terraform: Install Terraform.
4.Docker: Install Docker on your local machine.

## Setting Up Your Environment:

1. Authenticate with Google Cloud

Authenticate the gcloud CLI with your Google Cloud account:
gcloud auth login
gcloud config set project <YOUR_PROJECT_ID>
Replace <YOUR_PROJECT_ID> with your actual Google Cloud project ID.

2. Enable Required APIs

Enable the necessary Google Cloud APIs:

gcloud services enable run.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable artifactregistry.googleapis.com

3. Build and Push Docker Image

3.1 Create a Docker repository in Artifact Registry:
gcloud artifacts repositories create my-repo --repository-format=docker --location=us-central1 --description="Docker repository"

3.2 Configure Docker to use Google Artifact Registry:
gcloud auth configure-docker us-central1-docker.pkg.dev

3.3 Build and push the Docker image:
docker build -t us-central1-docker.pkg.dev/<YOUR_PROJECT_ID>/my-repo/hello-world:latest .
docker push us-central1-docker.pkg.dev/<YOUR_PROJECT_ID>/my-repo/hello-world:latest
Replace <YOUR_PROJECT_ID> with your actual Google Cloud project ID.

4. Deploy Using Terraform

4.1 Initialize Terraform:
Navigate to the directory containing your Terraform scripts and run: terraform init

4.2 Apply the Terraform configuration: terraform apply
You will be prompted to confirm the deployment. Type yes to proceed.

5. Access the Cloud Run Service

Once the deployment is complete, you can access your Cloud Run service using the URL provided in the Terraform output.
