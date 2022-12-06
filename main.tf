provider "google" {
  credentials = file("${path.module}/terroform-project-a745e034dbf9.json")
  project     = var.project
  region      = var.region

}
