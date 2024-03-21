terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # Store the state file in a remote and shared store on GitLab
  backend "http" {
    address = "https://gitlab.com/api/v4/projects/55456371/terraform/state/PROD"
    lock_address = "https://gitlab.com/api/v4/projects/55456371/terraform/state/PROD/lock"
    unlock_address="https://gitlab.com/api/v4/projects/55456371/terraform/state/PROD/lock"
  }
}