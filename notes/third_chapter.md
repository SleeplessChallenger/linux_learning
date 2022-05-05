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

	* How to force a process load/unload when machine starts:
		- `systemctl enable ssh`
		- `systemctl disable ssh`

	- ![Alt text](../image_folder/handshake_process.png?raw=true)

	- `ssh name_of_the_account_on_the_server@ip_address mkdir -p .ssh`: create directory .ssh
	- `cat .ssh/id_rsa.pub | ssh name_of_the_server@host_number "cat >> .ssh/authorized_keys"`
		- if a file doesn't exist -> create else append

	- So, to log in: `ssh ubuntu@10.0.3.142`
		- first is name of the account on the server & second is IP address
