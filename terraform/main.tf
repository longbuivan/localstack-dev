terraform {
  required_version = ">= 0.12"
  required_providers {
      archive = {
        version = "~> 2.1.0"
        source  = "hashicorp/archive"
      }
      aws = {
        version = "~> 3.38.0"
        source  = "hashicorp/aws"
      }
      # alks = {
      #   source = "Cox-Automotive/alks"
      #   version = "~> 1.5.15"
      # }

    }
}

# provider "alks" {
#   url = "https://alks.coxautoinc.com/rest"
# }

provider "aws" {
  region                      = "ap-southeast-2"
  access_key                  = "fake"
  secret_key                  = "fake"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check = true
  s3_force_path_style = true

  endpoints {
    dynamodb = "http://localhost:4569"
    lambda   = "http://localhost:4574"
    s3       = "http://localhost:4572"
    iam      = "http://localhost:4593"
  }
}

locals {
  tags = {
    # Environment    = "${var.environment}"
    OwnerEmail     = "DSC@mail.com"
    PipelineRepo   = "https://terrform-poc-lambda.git"
    Portfolio      = "M"
    DeliveryStream = "PSD"
    ReleaseTrain   = "DSs"
    Team           = "DE"
    Workload       = "104"
    Component      = "poc-lambda"
  }
}
