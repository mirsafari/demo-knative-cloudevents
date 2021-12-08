terraform {
  backend "remote" {
    organization = "msafaric-demo"

    workspaces {
      name = "civo-k8s-demo"
    }
  }
}