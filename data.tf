#Data object to create pipeline assume role policy
data "aws_iam_policy_document" "pipeline_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.organization}/${var.repository_name}:*"]
    }
  }
}
#Data object to create piepline policy
#tfsec:ignore:AWS099 Pipeline deliberately given full access to be able to provision all resources
data "aws_iam_policy_document" "pipeline" {
  statement {
    actions = [
      "*",
    ]
    resources = ["*"]
  }
}
#Get info on Github certificate for setting up OIDC
data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}