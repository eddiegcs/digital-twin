terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "twin-terraform-state-443870713716"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "twin-terraform-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Uses AWS CLI configuration (aws configure)
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}