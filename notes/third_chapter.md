<h2>Third chapter: virtualization</h2>

- At first there was **Telnet**

1. `encryption key`: small file containing random sequence of characters
2. Purpose: quickly encrypt before transmitted & decrypt at the other end

3. How to install?
	- `sudo apt install openssh-server`
	- `dpkg -s some_package` to check if it's installed
	- `apt search some_package`: to search for package & it'll show whether it's
		installed already

4. Sometimes linux programs aren't turned on by default:
	- `systemctl start ssh`
	- `systemctl stop ssh`
	- `systemctl status`
	- `systemctl restart ssh`

	* How to force a process load/unload when machine starts:
		- `systemctl enable ssh`
		- `systemctl disable ssh`

	- ![Alt text](../image_folder/handshake_process.png?raw=true)

5. Logging to the remote server with ssh:
	- `ssh name_of_the_account_on_the_server@ip_address mkdir -p .ssh`: create directory .ssh
	- `cat .ssh/id_rsa.pub | ssh name_of_the_server@host_number "cat >> .ssh/authorized_keys"`
		- if a file doesn't exist -> create else append

	- So, to log in: `ssh ubuntu@10.0.3.142`
		- first is name of the account on the server & second is IP address
	- `ssh -i ..sh/mykey.pem account_on_the_server@ip_address`: to specify which pair to use if multiple are present

6. `cp` can be used to copy from one machine to another, but it's not secure
	* `scp` is to copy from one machine to another: `s` stands for secure
	* if `.ssh` directory already exist on remotee machine: 
		- `scp .ssh/id_rsa.pub ubuntu@10.0.3.142:/home/ubuntu/.ssh/authorized_keys`
	* to copy **from** remote to local: `scp -i mykey.pem remote_account_name@ip_address:/home/remote_account_name/some_file ./some_folder/` - relative to the current dir on local you're in

7. `ssh-copy-id -i .ssh/id_rsa.pub account_on_remote@ip_address` - copy concrete public key & it'll b automcatically moved to the appropriate dir

8. What is **X11 forwarding**? Launch app on the server & through ssh forward th display to the client
	* `/etc/ssh/ssh_config` are the files on host & client machines to be edited
	* after you've edited some config files -> restart ssh session with `systemctl`
	* How to start a session with `-X`? -> `ssh -X ubuntu@10.0.0.142`

<h3>A little bit about linux process management</h3>

![Alt text](../image_folder/systemctl_examplee.png?raw=true)

9. PID: process id
10. On Ubuntu the first process when Linux PC boots is `init`
11. `ps` is to display active processes
	* `ps -ef | grep init` 
		- `-e` is to show all processes like parent ones right to the very `init`
			- parent is GUI desktop session, terminal is child as former is an earlier process
				and latter is laucnhed through it
