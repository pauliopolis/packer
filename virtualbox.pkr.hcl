packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}


source "virtualbox-iso" "rhel8" {
  #boot_command     = ["<tab><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><wait> text inst.ks=http://${var.WSL}:{{ 8336 }}/ks.cfg<wait><enter><wait>"]
  #boot_command     = ["<tab><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><bs><wait> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/http/ks.cfg<wait><enter><wait>"]
  boot_command     = ["<tab><enter>"]
  boot_wait        = "5s"
  disk_size        = 81920
  http_directory   = "http"
  http_port_max    = 8336
  http_port_min    = 8336
  guest_os_type    = "RedHat_64"
  iso_url          = "D:\\ISOs\\packer-rhel-8.6-x86_64-dvd.iso"
  iso_checksum     = "md5:8eab48ee543ced7d3400307fc44b15d2"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_port         = 22
  ssh_timeout      = "10000s"
  shutdown_command = "echo 'packer' | sudo -S /sbin/halt -p"
  vm_name = "packer-rhel8"
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
