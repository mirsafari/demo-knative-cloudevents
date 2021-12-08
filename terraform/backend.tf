terraform {
  backend "remote" {
    organization = "msafaric-demo"

    workspaces {
      name = "demo-knative-cloudevents-civo"
    }
  }
}