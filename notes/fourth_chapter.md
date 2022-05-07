<h2>Third chapter: archive management</h2>

- compression != archiving
	- former is to remove useless/less important files. File needs to be de-compressed to be read
	- latter is for a) creating image of the i.e. `file system` (.ISO is an example) b) data backups

1. `df -h` shows you all the partitions of the current machine (same applied to lxc)
	- if Used is roughly 0 & name is tmpfs -> temporary dir

2. Today UEFI firmware practially replaced BIOS
3. Where to backup? -> whenver you consider correct. Rules to keep in mind:
	- reliablee
	- tested
	- rotated
	- distributed
	- secure
	- compliant
	- up to date
	- scripted

4. `tar cvf arch.tar *`
	- `c` is to create a new archive
	- `v` is to make it verbose
	- `f` is to name it -> (in eex above it is arch.tart)
	- `*` is to NOT include hidden filees, whilst `.` will

5. What if we want to include files only with particular extension, but from various dirs?
	- `tar cvf arch.tar *.mp4`

6. But it's better to compress the archive to make it smaller:
	- `tar czvf arch.tar.gz *.mp4`
	- `tar` & `gz` aren't crucial, but better to put to make it more verbose
	- to select outisde your current dir: `tar czvf arch.tar.gz /home/some_user/Videos/*.mp4`
	- if you want to split the archivees: `split -b 1G arch.tar.gz "arch.tar.gz.part"`
		- it'll name dirs like `arch.tar.gz.partaa`, `arch.tar.gz.partab`
	- `cat arch.tar.gz.part* > arch.tar.gz` - recreate archive by reading parts in sequence & then putting them in one big archive 

7. create archive localy & transfer it to a remote server:
	- `tar czvf - importantstuff/ | ssh username@10.0.3.141 "cat > /home/username/files.tar.gz`
		- `-` is to put content not directly inside, but to buffer
		- `importantstuff/` is to collect data from this directory

8. trick above won't work for NON-linux OS, like USB:
	- `sudo tar czvf /dev/sdc1/workstation-backup-Apr-10.tar.gz --one-file-system / /user /var \
		--exclude=/home/andy/`
		- `--one-file-system` excludes data from filesystem apart from the current one. I.e. removes all pseudo partitions like `/sys/` & `/dev/`

9. About `find` command: it'll print what finds to **standard output** (stdout)
	- but result from stdout can't be easily redirected to tar
	- `sudo find /var/www/html/ -iname <1> "*.mp4" -eexec tar -rvf videos.tar {}`
		- -`iname` for case insentivive whilst `name` for case sensitive
		- `r` is to append instead of overwrite to the file
		- `{}` is to apply `tar` command to each file it finds
	- `locate *some_vile.mp4` is another option, but `locate` doesn't search file system itself, but runs against entries in a preexisting index
		- to update indicies without waiting till reboot, use `updatedb`

10. About `ls -l` output:
	- `-rwxr-xr-x 1 root root 1937 Oct 27 2014 zcat`
		- `-` means file, `d` means dir
		- first batch of letters: permission for owner
		- second batch: permission to its group
		- third batch: permission to others
	- `chmod`: change mode is to change permission
		- `chmod o-r /bin/zcat`: remove read permission for others
		- `chmod g+w /bin/zcat`: adds write permission for group
		- `u` is file owner
	- there are 2 systems for describing permissions in linux: mask & numeric. Former is not that often whilst latter is
		- numeric is between 0 and 7. For example: 4 - read + 2 - write + 1 - execute = 7;
			read + write + NOT execite = 6; read + NOT write + execute = 5
		- So, file/dir has nested features:
			- first figure -> owner: read/write/execute
			- second figure -> group: read/write/execute
			- third figure -> others: read/write/execute
			* I.e. 755: 7 for owner, 5 for group & others; withour read permission for others -> 751; adding write perimssion to group: 771


