################### VPC Creation #################

resource "google_compute_network" "tf-network" {
  name                    = var.compute_network
  auto_create_subnetworks = false
}

############### SUBNETWORKS ########################

resource "google_compute_subnetwork" "tf-network-pub-sub-1" {
  name          = "tf-network-pub-sub-1"
  ip_cidr_range = "10.1.0.0/24"
  region        = var.region
  network       = google_compute_network.tf-network.id
}

resource "google_compute_subnetwork" "tf-network-pub-sub-2" {
  name          = "tf-network-pub-sub-2"
  ip_cidr_range = "10.2.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.tf-network.id
}

resource "google_compute_subnetwork" "tf-network-private-sub-1" {
  name          = "tf-network-private-sub-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.tf-network.id
}

resource "google_compute_subnetwork" "tf-network-private-sub-2" {
  name          = "tf-network-private-sub-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-east1"
  network       = google_compute_network.tf-network.id
}

################ Compute Router ##############################

resource "google_compute_router" "tf-router" {
  name    = "tf-router"
  network = google_compute_network.tf-network.name
  bgp {
    asn            = 64514
    advertise_mode = "CUSTOM"
    #advertised_groups = ["ALL_SUBNETS"]
    #advertised_ip_ranges {
    # range = "1.2.3.4"
    #}
    # advertised_ip_ranges {
    #  range = "6.7.0.0/16"
    # }
  }
}


################# NAT Gatway ######################################


resource "google_compute_router_nat" "tf-nat" {
  name                               = "tf-nat"
  router                             = google_compute_router.tf-router.name
  region                             = google_compute_router.tf-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = "tf-network-private-sub-1"
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

######################## Firewall #####################################

#resource "google_compute_firewall" "tf-firewall" {
#  name    = "tf-firewall"
# network = google_compute_network.tf-network.name

#allow {
# protocol = "icmp"
#}

#allow {
# protocol = "tcp"
# ports    = ["80", "8080", "22"]
#}

#source_tags = ["name"]
#target_tags = ["dev"]
#}


# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "tf-firewall-http"
  network = google_compute_network.tf-network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}
# allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "tf-firewall-ssh"
  network = google_compute_network.tf-network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}



resource "google_compute_network_firewall_policy" "tf_firewall_policy" {
  name        = "tf-policy"
  description = "Sample global network firewall policy"
}

resource "google_compute_network_firewall_policy_association" "tf-policy-association" {
  name              = "tf-association"
  attachment_target = google_compute_network.tf-network.id
  firewall_policy   = google_compute_network_firewall_policy.tf_firewall_policy.name
}

resource "google_compute_network_firewall_policy_rule" "policy_rule" {
  firewall_policy = google_compute_network_firewall_policy.tf_firewall_policy.name
  action          = "allow"
  direction       = "INGRESS"
  priority        = 1000
  rule_name       = "tf-policy-rule"
  description     = "This is a simple terraform policy rule"
  match {
    # src_secure_tags {
    #  name = "tagValues/${google_tags_tag_value.basic_value.name}"
    #}

    layer4_configs {
      ip_protocol = "tcp"
      ports       = [80, 22, 8080]
    }
    src_ip_ranges = ["35.235.240.0/20"]
    layer4_configs {
      ip_protocol = "all"
    }
  }
  #target_service_accounts = ["emailAddress:rohit.s@neosoftmail.com.iam.gserviceaccount.com"]
  #enable_logging          = true
  #disabled                = false
}
#resource "google_tags_tag_key" "basic_key" {
#parent = "organizations/85650866426"
# short_name = "tagkey"
#purpose    = "GCE_FIREWALL"
#purpose_data = {
#  network = "terroform-project/${google_compute_network.tf-network.name}"
#}
#description = "For keyname resources."
#}


#resource "google_tags_tag_value" "basic_value" {
# parent      = "tagKeys/${google_tags_tag_key.basic_key.name}"
#short_name  = "tagvalue"
#description = "For valuename resources."
#}

