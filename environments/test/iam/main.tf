data "template_file" "terraform_ec2_apply_policy" {
  template = file("policies/terraform-ec2-apply-policy.json.tpl")

  vars = {
     region = "XXX"
     account_id = "XXXX"
     vpc_id = "XXXX"
   }
}

module "terraform_ec2_apply_role" {
  source = "../../../modules/iam"

  trusted_services = [ "ec2.amazonaws.com" ]
  role_tags = {
    ApplicationName = "XYX"
  }
  create_instance_profile = true
  policy_data = data.template_file.terraform_ec2_apply_policy.rendered
}
