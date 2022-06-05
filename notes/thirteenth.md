<h2>Thirteenth chapter: troubleshooting system performance issues</h2>

- 4 core eleements of the system:
	* CPU centeral processing unit
	* memory (RAM: physical and virtual)
	* storage devices
	* network load management

1. CPU issues:
	* `CPU load`
		* `load averages` - system activity over time 
		* `uptime` - command to see the `load averages`
		* I.e. load of 1.27 on **one core** means full capacuty + 27% in the queue
		* `top` to see the process information
			* `systemctl stop <name of the USER>`
			* if command above doesn't work - use `kill` "" `killall`
			* `systemctl disable <name of the USER>` - to prevent restart during next boot
		* `nice` - allows to tell the process how **nice** it should be
			* range of -20 to 19. The smaller the **less nice** the process - i.e. grabs lots of
				resources even if causes problems and vice versa. `nice -15 /var/...`
			* `-` is like plus, `--` is minus. See above for meaning
			* we can put nice in configs files. Also we can use `renice` to change the process
				even after it has started. `renice 15 -p 2145`
		* `yes > /dev/null &` - to load the system
	* `CPU utilization`

2. Memory issues:
	* `free` to see info about RAM
	* `vmstat` to see how swap works
		* swap is emergency partition/file on the storage as a source of virtual RAM
		* `si` to see data transfers from swap into system memory
		* `so` to see data transfers from system memory into swap
3. Storage availability:
	* storage availability: run `df` to see
	* **inode limits** - you can't have unlimited number of inodes on the system: `df -i`

4. Network load management
	* `iftop` to see the greediest network activity
	* `tc` - like `nice`