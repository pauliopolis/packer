packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}


source "virtualbox-iso" "rhel8" {
  boot_command     = ["<tab><enter>"]
  boot_wait        = "5s"
  disk_size        = 24576
  guest_os_type    = "RedHat_64"
  iso_url          = "D:\\ISOs\\v2-packer-rhel-8.6-x86_64-dvd.iso"
  iso_checksum     = "md5:124f314362ce89775416cc4dba2dd8c4"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_port         = 22
  ssh_timeout      = "10000s"
  shutdown_command = "echo 'packer' | sudo -S /sbin/halt -p"
  vm_name          = "v2-packer-rhel8"
  output_directory = "D:\\Virtual Machines\\rhel8-v2"
  vboxmanage       = [
                       ["modifyvm", "{{ .Name }}", "--memory", "2048"],
                       ["modifyvm", "{{ .Name }}", "--cpus", "2"],
                       ["modifyvm", "{{ .Name }}", "--spec-ctrl", "on"],
                       ["modifyvm", "{{ .Name }}", "--vram", "256"],
                       ["modifyvm", "{{ .Name }}", "--nat-localhostreachable1", "on"],
                       ["modifyvm", "{{ .Name }}", "--graphicscontroller", "vmsvga"]
                     ]
}

build {
  sources = ["sources.virtualbox-iso.rhel8"]
}
