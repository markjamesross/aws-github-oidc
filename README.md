# aws-github-oidc
Repo using OIDC to authenticate to AWS from GitHub Actions

Instructions: -
  - Authenticate to AWS account you want to depploy to using youre typical method (temp creds, access key / secret access key etc)
  - Run the folliwing commands
    - terraform init
    - terraform apply
      - enter the region, github org and github repo you're deploying from
  - Add the following GitHub Secrets to your repository (within GitHub repo go to settings, secrets and create new secrets)
    - AWS_REGION - set the region you want to deploy to
    - AWS_ACCOUNT_ID - set as the AWS account number you've deployed the Terraform code to
  - Run the GitHub action that can now authenticate using OIDC
    - Navigate to GitHub actions