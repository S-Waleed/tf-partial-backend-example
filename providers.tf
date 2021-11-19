provider "aws" {
  region = var.region

  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/svc-terraform-role"
    session_name = "terraform"
  }
}