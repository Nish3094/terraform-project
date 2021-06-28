terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }

  }
}


provider {
  region     = "us-west-2"
  access_key = "XXXX-XXXX-XXXX"
  secret_key = "XXXX-XXXX-XXXX"
}
