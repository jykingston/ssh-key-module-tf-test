variable "name" {
  default = "82323"
  type    = string
}

variable "tags" {
  type = map(string)
  default = {
    TicketNumber = "ticket82323"
    OwnedBy      = "jy.kingston@hashicorp.com"
    CreatorName  = "Jy Kingston"
    HashiRole    = "Terraform Sr Support Engineer"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Region to APSE2
provider "aws" {
  region = "ap-southeast-2"
}

#=============================================

resource "tls_private_key" "bitbucket_access" {
  algorithm = "RSA"
}

// source a module from github.com/jykingston/random-pet-module.git
module "pet_module" {
#  source = "git@github.com:jykingston/random-pet-module.git"
  source = "git::ssh://jykingston@github.com/jykingston/random-pet-module.git"
}