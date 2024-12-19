# DevOps Task Documentation

This repository contains the implementation for a DevOps task involving containerization, infrastructure provisioning, and configuration management for a Python metrics exporter. The solution uses Docker, Terraform, and Ansible and is designed to run on Yandex.Cloud.

---

## Task Overview

**Objective:**

1. Containerize a Python script (`exporter.py`) that exports Prometheus metrics.
2. Provision two virtual machines using Terraform:
   - Application Host (Ubuntu 22.04)
   - Monitoring Host (Ubuntu 22.04)
3. Configure the hosts using Ansible:
   - Application Host:
     - Configure a firewall.
     - Install Docker.
     - Deploy the metrics exporter container.
   - Monitoring Host:
     - Configure a firewall.
     - Install Prometheus.
     - Set up Prometheus to scrape metrics from the Application Host.

**Environment:**
- Preferred: Yandex.Cloud.
- Alternative: Any other Russian cloud provider.

**Deliverables:**
- A mono-repository containing all necessary code.
- Deployed machines accessible via SSH.
- Demonstration of Prometheus collecting metrics.

---

## Repository Structure

```
/
|-- docker/
|   |-- Dockerfile         # Dockerfile to containerize the Python script
|   |-- exporter.py        # Python script exporting Prometheus metrics
|
|-- terraform/
|   |-- main.tf            # Terraform configuration for provisioning VMs
|
|-- ansible/
|   |-- app_host.yml       # Ansible playbook for the Application Host
|   |-- monitoring_host.yml # Ansible playbook for the Monitoring Host
|
|-- README.md              # Documentation (this file)
```

---

## Instructions

### Prerequisites

1. **Terraform** installed on your local machine.
2. **Ansible** installed on your local machine.
3. **Docker** installed locally to build the Docker image.
4. A **Yandex.Cloud** account with the necessary credentials:
   - Cloud ID
   - Folder ID
   - Yandex.Cloud API token
5. SSH key pair for accessing the provisioned VMs.

---

### Step 1: Build and Push the Docker Image

1. Navigate to the `docker/` directory:
   ```bash
   cd docker
   ```
2. Build the Docker image:
   ```bash
   docker build -t exporter:latest .
   ```
3. Optionally, push the Docker image to a container registry if required.

---

### Step 2: Provision Infrastructure with Terraform

1. Navigate to the `terraform/` directory:
   ```bash
   cd terraform
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Apply the Terraform configuration:
   ```bash
   terraform apply
   ```
   - You will be prompted to input variables (e.g., Cloud ID, Folder ID, etc.).
   - Terraform will provision two VMs: Application Host and Monitoring Host.

---

### Step 3: Configure Hosts with Ansible

1. Update the `inventory` file to include the IPs of the provisioned VMs.
   Example:
   ```ini
   [application_host]
   <APPLICATION_HOST_IP>

   [monitoring_host]
   <MONITORING_HOST_IP>
   ```
2. Run the playbook for the Application Host:
   ```bash
   ansible-playbook -i inventory ansible/app_host.yml
   ```
3. Run the playbook for the Monitoring Host:
   ```bash
   ansible-playbook -i inventory ansible/monitoring_host.yml
   ```

---

### Step 4: Validate Prometheus Metrics Collection

1. SSH into the Monitoring Host:
   ```bash
   ssh ubuntu@<MONITORING_HOST_IP>
   ```
2. Access the Prometheus web UI:
   - URL: `http://<MONITORING_HOST_IP>:9090`
3. Verify that Prometheus is scraping metrics from the Application Host:
   - Navigate to **Status > Targets**.
   - Ensure the exporter target is listed and in the "UP" state.

---

## Deliverables

1. Mono-repository with the following structure:
   - `docker/` (Dockerfile and Python script).
   - `terraform/` (Terraform configuration).
   - `ansible/` (Ansible playbooks).
2. Deployed virtual machines accessible via SSH.
3. Demonstration of metrics collection by Prometheus.

---

## Additional Notes

- This repository includes placeholders (e.g., `<APPLICATION_HOST_IP>`, `<YOUR_SSH_PUBLIC_KEY>`). Replace these with actual values before running the scripts.
- For CI/CD, GitHub Actions can be integrated to automate Docker image builds and Terraform deployments.

