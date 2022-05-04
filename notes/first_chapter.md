<h2>First chapter: intro</h2>

- Linux is a `UNIX` type `OS`
- `Distribution/distro` is a customized stack of software that goes along with the kernel and distributed with
	tools to install the working version of Linux of user computers

1. What is a `file system`? -> **data table/index** that creates apparent connections between files/group of files
	with identifiable locations on a disk
	![Alt text](image_folder/directories.png)
	* why do we need an **index**? -> files may not remain static + hard drive/USB aren't divided into folders/directories, so
		we need some index to make a link between file and place on the disk
	* single disk division - `partition`. So, index provides appearance for organized set of files & directories within a partition
	* `/` is a root directory. All files in a disk partition are kept in directories beneath the root directory
	* `top level directories` - directories located just beneath the root:
		- `etc`
		- `var`
		- `home`
		- `sbin`
		- `bin`
		- `lib`
		- `usr`
	![Alt text](image_folder/sub_root.png)

2. Commands
	* ls - view
	* ls -l - view the content + permissions etc
		- can apply to files & directories
	* ls -lh - view in a human readable format
	* ls -R /folder - shows all the folders
	* pwd - to view current directory
	* cat - to see the content. I.e. `cat /etc/fstab` is an absolute path
	* less - same as above, but allows you to scroll the file with arrows

3. **Absolute path** - starts with `/`. Like `/home` which allows you to visit it from totally different place
	**Relative path** - path that is relative to your current directory

4. Unique collection of metadata which represents each file in
	a system is called an `inode`. Index is built from the metadata
	associated with all the many inodes on a drive
	* `stat som_file` to see the file info
	* when create/update/delete files -> changes happen to `inode`
	* `rmdir`to delete empty directory
	* `rm -r some_dir` to delete non-empty directory
	* `cp` is to copy file into another directory
	* `cp -r` is to copy one dir into another
	* `mv` a) is to move completely, without a copy b) to rename if no such directory exist

5. `globbing`: applying wildcards to commands
	* `mv * /some/other/directory` - to move contents of one dir to another
	* `mv file? /some/other/directory` is to move files with name file & only one character after

6. Deleting files:
	* `rm` to delete files
	* you can apply `globbing` here as well: `rm file*`
	* `rm -r *` - to delete files & folders in the current dir

7. Shortcuts:
	* `shift + control + c` is copy
	* `shift + control + v` is paste
	* use `tab` to tell make bash makes predictions

8. pseudo file systems:
	* generally located in `sys` & `proc` directories
	* don't exist in traditional sense & represent specific values
	* `/sys/block/` to see drives of the system
		- linux organizes attached storage as **block devices**
		- `loop` is a pseudo device that allows a file to be used as though it's an actual physical device
		- `sda1`, `sda2` etc are one of the partitions (single disk division)
	```
	sda 				sdb
	/   \				/ \
   sda1	sda2 etc	   sdb1 sdb2 etc	
	```
9. `sudo` is to make command line treat think about current user<b> 	as a super-user (*root user*)
10. `man` command is to look at the command usage: `man ls`
11. `info` is like a library of content
	* use arrows & press **enter** to view the more precise description
12. `|` - pipe is used when you want output of the first part
	to be used as input for the second part of the command
	`journalctl | grep filename.php`
	`journalctl | grep AppArmor | grep sha1`
	* `journalctl` is a command to see the system logs
		- to see inverted results (aka `~`): `journalctl | grep some.txt | grep -v error`


SideNote1: `-` is for short & `--` for more verbose commands
SideNote2: CLI interpreter is usually `bash`. It is the most popular UNIX shell
SideNote3: terminal session is often referred as `shell` 
SideNote4: what is `shell`? -> any user interface that interprets a user's commands either through a CLI or GUI.
	So, we talk to computer though a shell