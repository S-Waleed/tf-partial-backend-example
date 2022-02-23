provider "aws" {
  region = var.region

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/svc-terraform-role"
    session_name = "terraform"
  }

  # Common tags for all resources that accept tags
  default_tags { 
    # Example       = ""
    ManagedBy   = "Terraform"
    Environment = var.environment
  }
}
