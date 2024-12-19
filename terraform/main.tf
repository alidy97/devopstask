provider "yandex" {
  token     = "<YANDEX_CLOUD_TOKEN>"
  cloud_id  = "<CLOUD_ID>"
  folder_id = "<FOLDER_ID>"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "application_host" {
  name        = "application-host"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8rhco3ob51rtkakb6l" # Ubuntu 22.04
      size     = 20
    }
  }
  network_interface {
    subnet_id = "<SUBNET_ID>"
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:<SSH_PUBLIC_KEY>"
  }
}

resource "yandex_compute_instance" "monitoring_host" {
  name        = "monitoring-host"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd8rhco3ob51rtkakb6l" # Ubuntu 22.04
      size     = 20
    }
  }
  network_interface {
    subnet_id = "<SUBNET_ID>"
    nat       = true
  }
  metadata = {
    ssh-keys = "ubuntu:<SSH_PUBLIC_KEY>"
  }
}
