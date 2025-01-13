terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "akhil-tf-state-bucket"
    key            = "platform/aws/tf-tfstate"
    region         = "us-east-1"
    # dynamodb_table = "akhil-dev-table"
  }

}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
