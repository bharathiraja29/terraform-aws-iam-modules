data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = var.trusted_arns
    }

    principals {
      type        = "Service"
      identifiers = var.trusted_services
    }
  }
}

resource "aws_iam_role" "njm_roles" {
  name                 = var.role_name
  path                 = var.role_path
  max_session_duration = var.max_session_duration
  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
  tags                 = var.role_tags
}

resource "aws_iam_policy" "policy" {
  name   = var.policy_name
  path   = var.policy_path
  policy = var.policy_data
}

resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.njm_roles.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.role_name
  path  = var.role_path
  role  = aws_iam_role.njm_roles.name
}
