<h2>Twelfth chapter: sharing data over a private network</h2>

- NFS: network file system
	* allows remote clients to have access to files on the server
 1. Example of mounting remote dir to local:
 	* `mkdir /media/mountdir/`
 	* `mount /dev/sdb1 /media/mountdir/`

 2. Steps:
 	- install NFS on the server
 	- define client access to it in `/etc/exports`
 		* `/home 192.168.1.11(rw,sync)` expose /home + subdirs to clients
 		* remember `no_root_squash`
 	- update NFS
 		* `exportfs -ra`
 		* call `exportfs` to view who has access to the server
 	- install NFS on the client
 	- mount an NFS share
 		- `mkdir -p /nfs/home/` create dir on the client side
		- `mount 192.168.1.23:/home /nfs/home/` IP address of server && dir which is
			exposed in `exports` file
 	- configure NFS share to mount at boot time
 		* use `fstab` file: `192.168.1.23:/home  /nfs/home  nfs`
 		* there are 5 fields in `fstab` file:
 			* file system: what to boot
 			* mount point: where to mount
 			* type: file system type
 			* dump: back up or not the device
 			* pass: order of check for `fsck` program
 	- open any firewalls if necessary

 3. **hard link** will link to a file even if file is moved whilst **symbolic link** wil perish
 	- `ln file1 file1-hard`
	- `ln -s file2 file2-sym`