variable "build_directory" {
    default = "./build"
}

variable "boot_wait" {
    default = "10s"
}

variable "cpus" {
    default = 1
}

variable "disk_size" {
    default = 50000
}

variable "headless" {
    default = false
}

variable "iso_url" {
    default = "D:\\ISOs\\v3-rhel-8.6-x86_64-dvd.iso"
}

variable "iso_checksum" {
    default = "md5:b8f63dc3b244897011f27bd71e1bf705"
}

variable "memory" {
    default = 1024
}

variable "template" {
    default = "v3"
}

variable "username" {
    default = "packer"
}

variable "vm_name" {
    default = "rhel8-v3"
}

variable "provider_name" {
    default = "virtualbox"
}

variable "ssh_timeout" {
    default = "45m"
}

variable "hard_drive_interface" {
    default = "sata"
}

variable "guest_os_type" {
    default = "RedHat_64"
}

source "virtualbox-iso" "rhel8-v3" {

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
    output_directory     = "${var.build_directory}/packer-${var.template}-${var.provider_name}"
    shutdown_command     = "echo '${var.username}' | sudo -S shutdown -P now"
    ssh_timeout          = var.ssh_timeout
    ssh_username         = var.username
    ssh_password         = var.username
    vm_name              = var.vm_name
}

build {
  sources = ["sources.virtualbox-iso.rhel8-v3"]
}
