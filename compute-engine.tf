
resource "google_compute_instance" "tf-instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["name", "dev"]

  boot_disk {
    initialize_params {
      image = var.image_family
      labels = {
        name = "dev"
      }
    }
  }

  network_interface {
    network    = google_compute_network.tf-network.name
    subnetwork = google_compute_subnetwork.tf-network-pub-sub-1.name
    access_config {}
  }
}
