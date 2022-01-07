#CICD pipeline role
resource "aws_iam_role" "pipeline_role" {
  name = "github-actions-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.pipeline_assume_role.json
  managed_policy_arns = [aws_iam_policy.pipeline_policy.arn]
}
#CICD pipeline IAM policy
resource "aws_iam_policy" "pipeline_policy" {
  name = "github-actions-pipeline-policy"
  policy = data.aws_iam_policy_document.pipeline.json
}
#Attach policy to role
resource "aws_iam_role_policy_attachment" "pipeline" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.pipeline_policy.arn
}