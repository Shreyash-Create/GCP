

#backend
terraform {
  backend "gcs" {  
  }
}

# CREATE THE NECESSARY SUPPORTING LOCAL VARIABLES  
# ---------------------------------------------------------------------------------------------------------------------
locals {
  project-id=var.project_id
  environment=var.env
  region=var.region
  zone=var.zone
  network-name=var.vpc
  filename=var.filename
  subnetwork=var.subnetwork
}

data "google_compute_network" "vpc-network" {
  name = local.network-name
  project = local.project-id
}


resource "google_compute_instance" "default" {
  for_each = {for item in csvdecode(file(local.filename)):item.name => item}
  name         = "${each.value.name}"
  machine_type = "e2-medium"
  zone         = "${each.value.zone}"
  project = local.project-id

  tags = ["allow-ssh", "allow-web"]
  deletion_protection = true
  description = "${each.value.description}"
  labels = {
    client_name="${each.value.client-name}"
  }

  boot_disk {
    auto_delete = false
    initialize_params {
      image = "${each.value.image}"
      size = "${each.value.disk-size}"
      type = "pd-standard"
    }
  }

  network_interface {
    network = local.network-name
    subnetwork = local.subnetwork
    subnetwork_project = local.project-id

    access_config {
      // Ephemeral public IP
    }
  }
}