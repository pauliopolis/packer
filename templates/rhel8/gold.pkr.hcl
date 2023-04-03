variable "build_directory" {
  default = "D:\\Virtual_Machines\\GOLD"
}

variable "boot_wait" {
  default = "5s"
}

variable "cpus" {
  default = 2
}

variable "disk_size" {
  default = 24576
}

variable "headless" {
  default = true
}

variable "iso_url" {
  default = "D:\\ISOs\\gold\\gold-rhel-8.6-x86_64-dvd.iso"
}

variable "guest_additions_path" {
  default = "/home/vagrant/VBoxGuestAdditions.iso"
}

variable "iso_checksum" {
  default = "md5:"
}

variable "memory" {
  default = 2048
}

variable "template" {
  default = "gold"
}

variable "username" {
  default = "vagrant"
}

variable "vm_name" {
  default = "rhel8"
}

variable "provider_name" {
  default = "virtualbox"
}

variable "ssh_timeout" {
  default = "30m"
}

variable "ssh_port" {
  default = "22"
}

variable "hard_drive_interface" {
  default = "sata"
}

variable "guest_os_type" {
  default = "RedHat_64"
}

packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "rhel8" {

  boot_command = [
    "<tab><enter>"
  ]

  boot_wait            = var.boot_wait
  cpus                 = var.cpus
  disk_size            = var.disk_size
  guest_os_type        = var.guest_os_type
  hard_drive_interface = var.hard_drive_interface
  headless             = var.headless
  iso_url              = var.iso_url
  iso_checksum         = var.iso_checksum
  memory               = var.memory
  output_directory     = "${var.build_directory}/${var.template}-${var.provider_name}-${var.vm_name}"
  shutdown_command     = "echo '${var.username}' | sudo -S shutdown -P now"
  ssh_timeout          = var.ssh_timeout
  ssh_port             = var.ssh_port
  ssh_username         = var.username
  ssh_password         = "packer"
  vm_name              = var.vm_name
  vboxmanage = [
    ["modifyvm", "{{ .Name }}", "--spec-ctrl", "on"],
    ["modifyvm", "{{ .Name }}", "--vram", "256"],
    ["modifyvm", "{{ .Name }}", "--graphicscontroller", "vmsvga"],
    ["modifyvm", "{{ .Name }}", "--description", "PACKER GOLD RHEL BUILD"]
  ]
}

build {
  sources = ["sources.virtualbox-iso.rhel8"]
 
  provisioner "ansible-local" {
    playbook_file = "./ansible/guest_additions.yml"
  }

  post-processor "vagrant" {
    keep_input_artifact = true
    output = "D:\\Virtual_Machines\\GOLD"
  }
}
