variable deployment_tool {
  type = string
  default = "terraform"
  description = "Tool used to deploy code"
}
variable service_name {
  description = "Name of the service"
  type = string
  default = "terraform-remote-state"
}
variable organization {
  description = "Name of the GitHub Organization."
  type        = string
}
variable repository_name {
  description = "Name of the GitHub Repository."
  type        = string
}
variable aws_region {
  description = "Name of the AWS region to deploy to.  Whatever region is chosen should be set in GitHub as a Secret called region"
  type        = string
}