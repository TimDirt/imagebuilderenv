variable "base" {
  description = "Base environment settings."
  type        = any

  default = {
    env_name = "builder"
    storage_path = "/var/lib/libvirt/images/terraform-builder-pool"
    net_name = "buildernet"
    net_domain = "builder.example.com"
    net_address_space = ["172.25.252.0/24"]
  }
}

variable "servers" {
  description = "List of servers and their attributes."
  type        = map(any)

  default = {
    imagebuilder = {
      vcpu  = 4,
      image_path = "/var/lib/libvirt/images/1e5e1fc5-4519-4466-a4c3-3120dff2b049-disk.qcow2",
      memory = 4096,
      ip_addresses = ["172.25.252.9"],
      filesystems = {
        workingdir = {
          source = "/home/tim/git/redhat/imagebuilder/home/"
          target = "workingdir"
          readonly = false
          accessmode = "passthrough"
        }
      }
    }
  }
}

variable "users" {
  default = [
    {
      name = "student"
      uid = 1000
      gecos = "student"
      groups = "users,wheel"
      sudo = ["ALL=(ALL) NOPASSWD:ALL"]
      ssh_authorized_keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBj2XWdK9Is2tq0udBUmVCJixd2DdLvha+RnF/TGvHpd tim@fedora"
      ]
    }
  ]
}