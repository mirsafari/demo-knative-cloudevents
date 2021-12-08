terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

# Configure the Civo Provider
provider "civo" {
  token = var.CIVO_TOKEN
  region = "LON1"
}

variable "CIVO_TOKEN" {}