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

![image](https://user-images.githubusercontent.com/14337141/228612802-e2f908f9-3216-4bc9-9cad-555624e019d2.png)

Right click on the OVF and Open-With either Virtualbox or VMware Workstation Player to import and create new VMs

![image](https://user-images.githubusercontent.com/14337141/228613462-6637230e-b79b-4fa8-b20d-7c83c2fc87a8.png)

![image](https://user-images.githubusercontent.com/14337141/228614532-a835f258-a068-40b7-bd58-bbe49695de13.png)

Edit any settings cush as the VM name then select 'Finish' and wait for the 'Importing appliance ...' process to complete which will build a new VM in a powered off state.

![image](https://user-images.githubusercontent.com/14337141/228615726-56aec4dd-ae45-42c2-821a-cef3e501e923.png)

View from VirtualBox

![image](https://user-images.githubusercontent.com/14337141/228616272-86518ae2-4f01-4ad8-a6a1-413ed84fbf41.png)

View from WSL 

![image](https://user-images.githubusercontent.com/14337141/228616387-aac2c7af-6503-49f4-b95d-1a8813e37b3c.png)

Even though this Packer template has not yet created a vmware image - we can still import the OVF into VMware Workstation Player - you will be prompted to set a name and the location.  When ready hit the 'Import' button and wait.  Unlike VirtualBox these VMs will be created in a powered on state.

![image](https://user-images.githubusercontent.com/14337141/228617001-51c63aa5-599b-4c9c-89a7-7fcb0169b109.png)

You may see this prompt - just hit 'Retry' and the image will be imported and VMs created.

![image](https://user-images.githubusercontent.com/14337141/228617581-e1fc19da-a06f-44c8-b717-053f7550887f.png)

View from VMWare Workstation Player

![image](https://user-images.githubusercontent.com/14337141/228619473-d94c482e-ed24-46e3-9652-6ae94dae0fb6.png)

View from WSL

![image](https://user-images.githubusercontent.com/14337141/228618568-718fb24c-9ab0-4c28-aa72-b6bf5aa4afdf.png)

# Using the BOX with Vagrant 

IN-PROGRESS
