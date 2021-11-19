terraform {
  backend "s3" {
    key = "tf-partial-backend-example/terraform-main.tfstate"
  }
}

resource "aws_ssm_parameter" "this" {
  name  = "example-param-${var.environment}"
  type  = "String"
  value = "example-value"

  tags = {
    Name        = "example-param-${var.environment}"
    Owner       = "Waleed"
    Environment = var.environment
    Region      = var.region
  }
}
