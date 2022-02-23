terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }

  backend "s3" {
    key = "tf-partial-backend-example/terraform-main.tfstate"
  }
}
