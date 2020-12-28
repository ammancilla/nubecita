[WORK IN PROGRESS]

# La propia nubecita ⛅️
[![la propia nubecita](https://img.youtube.com/vi/d440dCl1Mbo/1.jpg)](https://www.youtube.com/watch?v=d440dCl1Mbo)

Basic infrastructure to deploy, run and maintain modern web applications at scale.

- Stable.
- Secure.
- Scalable.
- Replicable.
- Cost Effective.
- Highly Available.
- Highly Performant.

## Purpose

I created this repo to **learn about infrastructures for modern web applications**. In other words, learn how to release code to production and still be able to sleep at night.

I use **Terraform** to build, change and version the infrastructure and  **AWS** to deploy it.

The code, services and infrastructure design is opinionated. Based on my learnings and past experience.

## Components

List of componenet i attempt to have in my infrastructure.

#### Continous integration and deployment pipeline.

- Self hosted using Jenkins, Buildkite or another.

#### Networking

- VPN
- DNS
- Load Balancing

#### Core

- Docker Image Registry
- Container Orchestration (Kubernetes)

#### Application Integration

- Messaging

#### Databases

- SQL/NoSQL Databases
- In Memory Databases

#### Storage


#### Monitoring


#### Security

## AWS
To provision the infrastructure first we need to pick a cloud infrastructure provider.

        • Alibaba Cloud.
        • Digital Ocean.
        • Microsoft Azure.
        • Amazon Web Services.
        • Google Cloud Platform.
        • etc.

I'll be using **AWS** only because i am already familiar with it.

### Configuring AWS

#### Root Account
This is the main account aka the one that pays the bills. It's responsibilities are:

        • Create an oganization.
        • Pay the bills of the organization.
        • Create IAM Users so other people can access/manage the organization's infrastructure.
        • Create sub-accounts within the organization per environment/project. I.e production & staging.

0. Create a root account engineering@driloco.co
1. Create an Organization "drilococo".
2. Create sub-accounts under the organization for "staging" & "production" environments.
   For each sub-account, comple the [sign-up steps](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account).
   For each sub-account, create an Access Key and store them in a safe place (i.e password manager).
3. Create an IAM User under the main account, with AdministratorAccess (or any other appropiate access role).
   This user will be able to: Manage (according the its role), the organiztion's infrastructure from the AWS Management Console.
   This user will be able to: Switch between the different organization's sub-accounts (staging & production).
   Create as many users as developers/people/managers need access to the infrastructure. Assign proper access roles to each user.
   For each IAM User, complete the [sign-up steps](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account).
   For each IAM User, setup [role switching](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-console.html) to allow the user to easily jump between staging & production environments.

#### Organization
[TODO]

#### RoleSwitch for IAM users
[TODO]

#### AWS-CLI
[Install](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) and [Configure]((https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) the AWS-CLI for an IAM User.
Allow IAM Users to access organization's infrastructure from their machine using the command line.

Configure the CLI for each environment:

1. `aws configure --profile drilococo-staging`
2. `aws configure --profile drilococo-production`

When prompted provide the Access Key ID and Secret from the appropiate account (staging or production).

## Infrastructure as Code
I'll use [Terraform](https://www.terraform.io) design/provision/manage/deliver the infrastructure using code.

[TODO] How to install and configure Terraform in my machine.
[TODO] How to build, change and destroy infrastructure.

- `terraform init`

### Modules & Components

      | components/
      |-- componentName/
      |   |-- vars/
      |   |   |-- staging.tfvars
      |   |   |-- production.tfvars
      |   |-- main.tf
      |   |-- outputs.tf
      |   |-- backend.tf
      |   |-- providers.tf
      |   |-- variables.tf
      | modules/
      |-- moduleName/
      |   |-- main.tf
      |   |-- outputs.tf
      |   |-- variables.tf
      |   |-- versions.tf

**Reference**
- https://www.terraform.io/docs/configuration/blocks/modules/syntax.html
- https://learn.hashicorp.com/collections/terraform/aws-get-started
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# The Infrastructure
0. CI/CD Pipeline (EC2 & Builkite)

1. Networking (VPC)
2. Orchestration (EKS, EC2)
3. Service Discovery (Route 53)
4. Load Balancing (ALB & ELB)
5. Monitoring (CloudWatch, NewRelic & Prometheus)

Per application configuration

1. Databases (RDS)
2. In Memory Databases (REDIS)
3. Messaging (SNS & SQS)
4. Monitoring (CloudWatch)
5. Observability • Logs (FileBeat, Elastiseach & Kibana)
6. Observability • Tracing ()
