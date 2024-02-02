terraform {
  required_providers {
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "0.7.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
