# Packer Project : 

### Builders : 

There are many builder plugins - this project will look only at virtualbox and vmware

* virtualbox [see](https://developer.hashicorp.com/packer/plugins/builders/virtualbox)
* vmware [see](https://developer.hashicorp.com/packer/plugins/builders/vmware)

* This project will use templates written in hcl2 format (not json)

# Environment
* Windows 10 Home Edition 
* Windows Services for Linux 2 [1.1.3.0](https://learn.microsoft.com/en-us/windows/wsl/install)
  * Oracle Linux 8.5
  
  
  ``$echo "alias 'packer=/mnt/c/HashiCorp/Packer/bin/packer.exe'" >> ~/.bashrc``
* Packer [AMD64 1.8.6](https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_windows_amd64.zip)
* VMware Workstation 16 Player [16.2.5](https://docs.vmware.com/en/VMware-Workstation-Player-for-Windows/16.0/com.vmware.player.win.using.doc/GUID-B8509247-258C-4B11-8637-5DABACEA4965.html)
* Oracle VM VirtualBox Manager [7.0.6](https://www.virtualbox.org/manual/ch01.html#intro-installing)

# VirtualBox Builder

* virtualbox-iso (new VM)

* virtualbox-ovf (existing OVF/OVA)

* virtualbox-vm (existing VM)

# VMware Builder

* vmware-iso (new VM)

* vmware-vmx (existing VM)

# Project 

## List Plugins
Packer installation does not include any plugins yet
``$packer plugins installed``

## Install Required Plugin
Add this code to virtualbox.pkr.hcl

![image](https://user-images.githubusercontent.com/14337141/226880863-9bd39a7e-67f0-4636-bfff-276e13a6d317.png)

## Initialise Project

``$packer init .`` or ``$packer init virtualbox.pkr.hcl``

``$packer plugins installed``

## Alternatively
Install/remove the plugin manually :

``$packer plugins install github.com/hashicorp/virtualbox``

``$packer plugins remove github.com/hashicorp/virtualbox``

## validate and format the file

``$packer validate virtualbox.pkr.hcl``

``$packer fmt virtualbox.pkr.hcl``

## Add the minimum basics 
![image](https://user-images.githubusercontent.com/14337141/226903737-7171fa6c-f532-486c-8ac6-81d13352a2ab.png)

## Build the image

``$packer build .`` or ``$packer build virtualbox.pkr.hcl``

At this stage you will note a virtualbox VM installation window but we need to add more information to the hcl for this to succeed
boot information and a kickstart for example


