# ECS Fargate Deployment with Terraform and CI/CD

## Project Overview

I deployed and conatinerised a Node.js application to **AWS ECS Fargate** using **Terraform** as infrastructure as code and **CI/CD pipelines** to automate builds and deployments.

---

## Application and Container Build

What is actually the purpose of this app?

Before an app is deployed, the threat composer  tool lets you design the system and think through security risks, so you can decide how to build it more securely.

A **multi-stage Docker build** was used to optimise the final image size.

### Image Size Optimisation

* Single-stage Docker image size: **1.64 GB**
* Multi-stage Docker image size: **197 MB**

**Total size saved:**  
1.43 GB

**Percentage reduction:**  
88%

I reduuce the image size by 88% which  means deployments are faster as there is less data to download when a container starts

---

## Infrastructure Architecture

<img width="1920" height="1348" alt="Image" src="https://github.com/user-attachments/assets/7a37d037-79b7-4387-b57c-ddfed399567a" />

* **ECS Fargate** for serverless container execution
* **Application Load Balancer (ALB)** deployed in public subnets
* **ECS tasks** deployed in private subnets
* **2 Availability Zones** used for high availability
* **Cloudflare** used to manage domain: (https://tm.nginxjawwad.org) and route traffic to ALB
* **HTTPS** enabled using ACM certificates with ALB

---

## CI/CD Pipeline

CI/CD pipelines are used to automate:

* Build docker image and push to ECR
* Terraform plan, apply, and destroy stages

---

## Terraform State Management

* **Amazon S3** used for remote Terraform state storage
* **DynamoDB** used for Terraform state locking

---

## Video of app working on my custom domain

![Image](https://github.com/user-attachments/assets/07653b3b-26b0-49ae-b330-3073f068d155)

## Photos of pipelines

<img width="1892" height="933" alt="Image" src="https://github.com/user-attachments/assets/3c89b891-b724-47e4-a89a-4992318a5369" />

<img width="1909" height="902" alt="Image" src="https://github.com/user-attachments/assets/ac4cfdbc-e262-43e7-9297-a69242bdaefa" />

<img width="1891" height="898" alt="Image" src="https://github.com/user-attachments/assets/8a751e35-7c47-4b3f-81fc-2f7781ebd726" />

<img width="1893" height="906" alt="Image" src="https://github.com/user-attachments/assets/1927bcca-c1d5-4aef-9611-7b7d557ffbb5" />

