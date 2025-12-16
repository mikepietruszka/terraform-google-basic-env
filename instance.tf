resource "google_compute_instance" "default" {
  name         = "gce-${random_integer.random.result}"
  machine_type = var.machine_type
  zone         = "${var.region}-a"
  project      = "prj-g-tfseed-4200"
  provider     = "google"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      labels = {
        project = "ephemeral-project"
      }
    }
  }

  # Updated metadata block
  metadata = {
    enable-oslogin = "TRUE"
    # This startup script runs on first boot
    startup-script = <<-EOF
      #!/bin/bash
      # Update package lists
      apt-get update
      # Install nginx non-interactively
      apt-get install -y nginx
      # Start and enable the nginx service
      systemctl start nginx
      systemctl enable nginx
    EOF
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  tags = ["http-server"]
  network_interface {
    network = "default"
    //    access_config {
    //    }
  }
}

output "instance_name" {
  description = "The name of the GCE instance"
  value       = google_compute_instance.default.name
}

output "internal_ip" {
  description = "The internal IP address of the GCE instance"
  value       = google_compute_instance.default.network_interface[0].network_ip
}

/*
output "external_ip" {
  description = "The external IP address of the GCE instance"
  value       = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
*/
