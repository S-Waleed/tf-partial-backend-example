SHELL := /usr/bin/env bash

# HOW TO EXECUTE

# Executing Terraform PLAN
#	$ make tf-plan-example env=<env>
#    e.g.,
#       make tf-plan-example env=dev

# Executing Terraform APPLY
#   $ make tf-apply-example env=<env>

# Executing Terraform DESTROY
#	$ make tf-destroy-example env=<env>

all-test: clean tf-plan-example

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: tf-init-example
tf-init-example:
	terraform init -backend-config accounts/${env}/backend.conf -reconfigure && terraform validate && terraform plan -var-file accounts/${env}/terraform.tfvars

.PHONY: tf-plan-example
tf-plan-example:
	terraform fmt --recursive && terraform validate && terraform plan -var-file accounts/${env}/terraform.tfvars

.PHONY: tf-apply-example
tf-apply-example:
	terraform fmt --recursive && terraform init -backend-config accounts/${env}/backend.conf -reconfigure && terraform validate && terraform apply -var-file accounts/${env}/terraform.tfvars -auto-approve

.PHONY: tf-destroy-example
tf-destroy-example:
	terraform init -backend-config accounts/${env}/backend.conf -reconfigure && terraform destroy -var-file accounts/${env}/terraform.tfvars
