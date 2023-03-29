# Packer Project : 

### Builders : 

There are many builder plugins - this project will look only at virtualbox and vmware

* virtualbox [see](https://developer.hashicorp.com/packer/plugins/builders/virtualbox)
* vmware [see](https://developer.hashicorp.com/packer/plugins/builders/vmware)

* This project uses templates written in hcl2 format

# Environment
* Windows 10 Home Edition 
* Windows Services for Linux 2 [1.1.3.0](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Oracle Linux 8.5
  
  
  ``$echo "alias 'packer=/mnt/c/HashiCorp/Packer/bin/packer.exe'" >> ~/.bashrc``
* Packer [AMD64 1.8.6](https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_windows_amd64.zip)
* VMware Workstation 16 Player [16.2.5](https://docs.vmware.com/en/VMware-Workstation-Player-for-Windows/16.0/com.vmware.player.win.using.doc/GUID-B8509247-258C-4B11-8637-5DABACEA4965.html)
* Oracle VM VirtualBox Manager [7.0.6](https://www.virtualbox.org/manual/ch01.html#intro-installing)


# Project 

``cd packer``

``$packer validate templates/rhel8/gold.pkr.hcl``

``$packer fmt templates/rhel8/gold.pkr.hcl``

``$update-gold-md5``  (Get the ISO md5)
 
``$packer build templates/rhel8/gold.pkr.hcl``

``$revert-md5-placeholder``  (Remove the ISO md5)


# Usage

Running packer build will create a build folder containing both an OVF and a VMDK and also output a Vagrant BOX file.

Right click and Open-With either Virtualbox or VMware Workstation Player to import the OVF and create new VMs 


