variable "role_name" {
  description = "IAM role"
  type        = string
  default     = "test"
}

variable "role_path" {
  description = "Path of IAM role"
  type        = string
  default     = "/"
}

variable "policy_name" {
  description = "IAM policy"
  type        = string
  default     = "test"
}

variable "policy_path" {
  description = "Path of IAM policy"
  type        = string
  default     = "/"
}

variable "policy_data" {
  type        = any
  description = "policy data"
}

variable "trusted_arns" {
  description = "ARNs of AWS entities who can assume these roles"
  type        = list(string)
  default     = []
}

variable "trusted_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = []
}


variable "role_tags" {
  description = "A map of tags to add to admin role resource."
  type        = map(string)
  default = {
    ApplicationName = "8KAutomation"
  }
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile"
  type        = bool
  default     = false
}

variable "max_session_duration" {
  description = "Maximum CLI/API session duration in seconds between 3600 and 43200"
  type        = number
  default     = 3600
}
