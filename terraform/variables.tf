variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "aws_key_name" {
  description = "AWS SSH key pair name"
  type        = string
}

variable "ssh_key_name" {
  description = "Stiltsoft SSH key"
  type        = string
}

variable "default_region" {
  description = "Default region for deploy"
  type        = string
}

variable "aws_dns_zone_id" {
  description = "Zone ID for mybox.click"
  type        = string
}

variable "ami_instance_image" {
  description = "Base AMI instance image"
  type        = string
}

variable "aws_instance_type" {
  description = "Define instance type"
  type        = string
}

variable "resource_tag" {
  description = "AWS resourse tags"
  type        = string
}
