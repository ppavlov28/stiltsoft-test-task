terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.1.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.1"
    }
  }
}

provider "aws" {
  profile    = "default"
  region     = var.default_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}