output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = aws_iam_role.njm_roles.arn
}
