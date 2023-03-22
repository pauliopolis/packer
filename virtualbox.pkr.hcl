packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "rhel8" {
  boot_command     = ["<tab> text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  boot_wait        = "10s"
  disk_size        = 81920
  http_directory   = "http"
  guest_os_type    = "RedHat_64"
  iso_url          = "D:\\ISOs\\rhel-8.6-x86_64-dvd.iso"
  iso_checksum     = "md5:a5358b999ab1da0a7d4ea15d21367a2a"
  ssh_username     = "packer"
  ssh_password     = "packer"
  ssh_port         = 22
  ssh_timeout      = "10000s"
  shutdown_command = "echo 'packer' | sudo -S /sbin/halt -t -p"
  vm_name = "packer-rhel8"
  vboxmanage       = [
                       ["modifyvm", "{{ .Name }}", "--memory", "2048"],
                       ["modifyvm", "{{ .Name }}", "--cpus", "2"],
                       ["modifyvm", "{{ .Name }}", "--spec-ctrl", "on"]
                     ]
}

build {
  sources = ["sources.virtualbox-iso.rhel8"]
}
