# IE final exam

## Characters API: MMORPG League of Learners

For this exercise, you will be working on a repository that contains a python API is part of the worldwide acclaimed MMORPG game (massive multiplayer online role-playing game) League of Learners (LoL).

This API allows users to create characters in the game relying on a PostgreSQL server, and it will be deployed to Azure via infrastructure as code and GitHub workflows.

This repository contains:
- Backend code: [`/backend/`](/backend/)
- Infrastructure code: [`/infra/`](/infra/)
- Deployment workflows: [`.github/workflows/`](.github/workflows/)

The GitHub organization where this repository is hosted contains the following Organization GitHub secret:
- `AZURE_CREDENTIALS`. You can use this secret to Login to Azure with the service principal with permissions to deploy to resource group `BCSAI2024-DEVOPS-STUDENTS-B-DEV`. The secret already exists. You don't need to create it.

```json
  {
      "clientId": "c52bb0cc-7f22-4c28-aee8-264d1cafbb06",
      "clientSecret": "GRj8Q~i9_TLEC7iC2wVUKdM5q_0XU-QlaCO5WdyR",
      "subscriptionId": "e0b9cada-61bc-4b5a-bd7a-52c606726b3b",
      "tenantId": "5ca2bc70-353c-4d1f-b7d7-7f2b2259df68"
  }
```

To work on this exercise:
1. Create your repository with name `{student-alias}-exam` from this repository template.
   - You can create it from the GitHub portal: click on the green button on the top right corner: `Use this template`.
   - Create the new repository in the organization created for the exam: `bcsai-devops-jseijas`.
   - Set it to **Private**.
2. In your new repository, don't work directly in the `main` branch. **Create a development branch** from `main` with the name `{student-alias}-dev`.
3. In order to submit your results, create a **Pull Request** from your development branch to your main branch for all the questions. Provide your Pull Request link as an answer in the Blackboard exam.

Note: User/student alias is the assigned user name to your email address before your `@student.ie.edu` (e.g. the user alias of `jseijas@faculty.ie.edu` is `jseijas`)

Recommended strategy for the exam:
1. Start with **Exercise I**. Make your CI/CD workflow work for your infrastructure code with main.bicep deploying 1 sample module. Check that the deployment to Azure works and that your CI/CD workflow works on every push to your dev branch.
2. With Exercise I completed, focus on **Exercise II** and make your infrastructure configuration work
3. **Exercise III** does not require that you have your infrastructure deployed.
4. With the Infrastructure deployed, work on **Exercise IV** and make your CI/CD workflow publish your image to the Docker Container Registry and deploy to your backend service.
5. There is an exercise for extra credit that requires all previous exercises to work correctly. Focus on this exercise only if you have time left. It will not be graded if the rest doesn't work.

## Exercise I (1,5 points) - Set up your CI/CD strategy for your Infrastructure as Code in the development environment
_Objective: develop the GitHub workflow to configure the build and deploy steps for the infrastructure of your development environment in Azure_

Use the following files (each file contains comments with the details of what needs to be developed):
- **[`/infra/main.bicep`](/infra/main.bicep) *(optional)***. Use this file to configure the deployment of a sample module from [/infra/modules/](/infra/modules/) folder to test that your CI/CD workflow works
- **[`/.github/workflows/ie-bank-infra.yml`](/.github/workflows/ie-bank-infra.yml)**. Use this file to configure the CI/CD workflow of your infrastructure folllwing best practices.

As an answer to this question, provide in Blackboard (question 1):
1. The link to your Pull Request to the main branch
2. The link to the GitHub action run
3. Include a brief description of the changes you made

To pass this question:
- The GitHub workflow must successfully run (green state) and deploy the infrastructure declared in `main.bicep` to Azure DEV resource group.

## Exercise II (1,5 points) - Set up your Infrastructure as Code configuration for your development environment
_Objective: develop the bicep files containing the configuration of your development environment, and deploy the infrastructure to Azure._

Use the following files (each file contains comments with the details of what needs to be developed):
- **[`/infra/main.bicep`](/infra/main.bicep)**. Use this file to configure:
  - Declare the input parameters for your `main.bicep` that you will use to configure your infrastructure.
  - Set up the modules required to deploy a containers infrastructure to host your backend. You can leverage the available modules in the repo.
    - **NOTE**: module `key-vault.bicep` is not required for this exercise

As an answer to this question, provide in Blackboard (question 2):
1. The link to your Pull Request to the main branch
2. The link to the GitHub action run
3. Include a brief description of the changes you made

To pass this question:
- The infrastructure must deploy to Azure leveraging the GitHub workflow from Exercise I

## Exercise III (1,5 points) - Continuous Quality through Unit and Functional testing
_Objective: develop unit tests and functional tests to check quality of your Backend API._

Use pytest framework to implement **unit testing** and **functional testing** of your application. These tests must run during the CI process.
You can find more information about the required tests in the testing files comments.

As an answer to this question, provide in Blackboard (question 3):
1. The link to your Pull Request to the main branch
3. The link to the GitHub action run
4. Include a brief description of the changes you made

To pass this question:
- The unit tests and the functional tests must be correct according to the test descriptions and cover the implementation functionality
- The tests must pass in your workflow run

## Exercise IV (1,5 points) - Continuous delivery of Python backend
_Objective: develop the GitHub workflow to configure the build and deploy steps for your container based backend API._

Use the following files (each file contains comments with the details of what needs to be developed):
- **[`/.github/workflows/ie-bank-backend.yml`](/.github/workflows/ie-bank-backend.yml)**. Use this file to configure the build and deploy jobs of the GitHub workflow for your backend API as a container
- Make sure that you configure the required environment variables for the backend API runtime when deploying the `app-service-container` module.

As an answer to this question, provide in Blackboard (question 4):
1. The link to your Pull Request to the main branch
2. The link to the GitHub action run
3. Include a brief description of the changes you made

To pass this question:
- The workflow must run successfully
- The linter and the test execution steps must pass
- The docker image must be published into the Azure Container Registry Service as part of your GitHub workflow
- The docker image must run in the hosting Azure container web app as a result of the execution of your GitHub workflow

## Extra exercise (1 extra point) - Secure Secrets management for Container Registry
_Objective: leverage Key Vault module to manage the Container Registry credentials as key vault secrets in Azure_

As an answer to this question, provide in Blackboard (question 5):
1. The link to your Pull Request to the main branch
2. The link to the GitHub action run
3. Include a brief description of the changes you made

To obtain credit for this question:
- The secrets management implementation must work
