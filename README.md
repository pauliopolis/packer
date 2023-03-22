# Packer Project : 

Builders : 

There are many builder plugins - this project will look only at virtualbox and vmware

* virtualbox [see](https://developer.hashicorp.com/packer/plugins/builders/virtualbox)
* vmware [see](https://developer.hashicorp.com/packer/plugins/builders/vmware)

# Environment
* Windows 10 Home Edition 
* Windows Services for Linux 2 [1.1.3.0](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Oracle Linux 8.5
  
  
  ``$echo "alias 'packer=/mnt/c/HashiCorp/Packer/bin/packer.exe'" >> ~/.bashrc``
* Packer [AMD64 1.8.6](https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_windows_amd64.zip)
* VMware Workstation 16 Player [16.2.5](https://docs.vmware.com/en/VMware-Workstation-Player-for-Windows/16.0/com.vmware.player.win.using.doc/GUID-B8509247-258C-4B11-8637-5DABACEA4965.html)
* Oracle VM VirtualBox Manager [7.0.6](https://www.virtualbox.org/manual/ch01.html#intro-installing)

# Template formats 
Templates may be writtein in JSON or HCL2 - this project will use HCL2

# VirtualBox Builder

* virtualbox-iso (new VM)

* virtualbox-ovf (existing OVF/OVA)

* virtualbox-vm (existing VM)

# VMware Builder

* vmware-iso (new VM)

* vmware-vmx (existing VM)

