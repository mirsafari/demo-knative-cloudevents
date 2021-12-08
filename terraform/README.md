# IaC provision
Our cloud provider of choice is going to be [Civo](https://www.civo.com/). We will use [Terraform](https://www.terraform.io/) to provision the infrastructure there. However, terraform integration will be run by [Github Actions](https://github.com/features/actions) and [Terraform cloud](https://www.terraform.io/cloud).
## Create Terraform cloud account
Register to Terraform cloud and create new workspace. Authorize the workspace to Github and only select the repositories where you infrastructure code is. In this example, we are also limiting the workspace only to `/terraform` directory.

Set `CIVO_TOKEN` in enviroment variable so you can authorize Terraform Cloud on Civo and enable it to make changes on the infrastructure.
## Setup Github Actions
As this demo project is a monorepo, we will only run the pipelines when terraform/* directory changes. 

**In a real production scenario, you want to have the infrastructure code in a separate repository!**

Follow the guide https://learn.hashicorp.com/tutorials/terraform/github-actions?in=terraform/automation.

When creating Terraform Cloud workspace, make sure to select **API-driven workflow**. We will run `terraform` commands by using Github actions, but the real `terraform plan` and `terraform apply` are running on Terraform Cloud because we use Terraform Cloud as the backend. 

The benefit of this approach is that we get information about the changes (output of `terraform plan`) inside PR, so we can do everything on PR, without the need to switch to Terraform Cloud Web UI.

## Links
Infra:
- https://app.terraform.io/app 
- https://www.civo.com/

Guides:
- https://learn.hashicorp.com/tutorials/terraform/github-actions?in=terraform/automation