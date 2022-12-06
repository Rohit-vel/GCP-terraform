variable "project" {
  default = "terroform-project"
}

variable "region" {
  default = "us-central1"
}

variable "instance_name" {
  default = "tf-instance"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "image_family" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "compute_network" {
  default = "tf-network"
}

variable "bucket_name" {
  default = "tf-bucket-static"
}

