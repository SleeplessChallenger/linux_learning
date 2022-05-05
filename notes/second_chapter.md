<h2>Second chapter: virtualization</h2>

 - **Virtualization** - process of splitting one `bare-metal` server into separate isntances (aka virtual machines) to cater for various services. Also, it provides ability to assign desired level of resources needed to the single VM & tweak it if needed

 ![Alt text](../image_folder/virtualization_example.png?raw=true)

 1. There are 2 approaches to virtualization:
 	- <i>hypervisors aka VMslxc-crea</i>
 		- hypervisor serves as layer between hardware & VMs
 		- ![Alt text](../image_folder/hypervisors.png?raw=true)
 	- <i>containers</i>
 		- LXC (linux container) abstracts OS that has been provided by server or VM. It shares the host machine's core OS kernel
 		- ![Alt text](../image_folder/containers.png?raw=true)

 2. In linux software package manager is a tool which connects computer to online repositories　　
 	- In debian based systems package manager is called Advanced Package Tool (`apt`)
 
 3. Table of package managers & distros:
```bash
 	  { APT: [Debian, Ubuntu, Mint, Kali Linux],
 		RPM: [Red Hat Enterprise Linux, CentOS, Fedora],
 		YaST: [SUSE Linux, OpenSUSE]
 	   }
```
PS: Fedora belongs to Red Hat distro 

4. `arch` to see the current architecture  
5. `dpkg -i` is to install some software with debian (`ubuntu` as well as it's based on `debian`) package manager
6. With RPM we can use either `yum` or `dnf`
7. third-party software configuration files are kept within `/etc/` directory

8. RPM guys are less user-friendly than debian ones

9. you can use `vboxmanage` command to work with virtual box
	* `scp` is to copy from one machine to another

10. To create a linux container: 
	* `lxc-create -n someName -t ubuntu`
	* to see the status: `lxc-ls --fancy`
	* `lxc-start -d -n containerName`: to start running
	* `lxc-attach -n containerName`: to launch a root shell
	* `shutdown -h now`
	* `shutdown -r now`

	- you can find containers located in `/var/lib/lxc/`
	- `rootfs` is container's `/`
