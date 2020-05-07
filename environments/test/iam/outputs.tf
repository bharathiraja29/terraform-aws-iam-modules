# Admin
output "terraform_ec2_iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.terraform_ec2_apply_role.iam_role_arn
}
