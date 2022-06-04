<h2>Eleventh chapter: logging</h2>

- Initially `syslogd` was the daemon that deals with logs
	- it processes logs from data sources in `/dev/log` and
		redirect them to `/var/log`

- <img src="../image_folder/logs.png" width="300" height="600">

- Now it's ALSO handled by `journald` with command `journalctl`
	- `journald` stores data in binary files, not in plain text
		like `syslogd`
	- `journalctl` to display logs
		- `-n <fig>` to show n number of last logs
		- adding `-p emerg` to show emergency
		- adding `-f` allows to see in real time
		- `--since` && `--until` to specify ranges

- <img src="../image_folder/logs-journal.png" width="300" height="600">

- Syslogd:
	- messages are distributed by config in `50-default.conf`
		- `/etc/rsyslog.d/` in this folder

	- Individual applications will write data to separate files:
		- I.e. `/var/log/mysql`

- To make `journalctl` persist logs:
	- `mkdir -p /var/log/journal`
	- `systemd-tmpfiles --create --prefix /var/log/journal`

- `cat /var/log/auth.log | grep -B 1 -A 1 failure`
	- B means one before
	- A means one after
- `grep -nr` - to search within lines of files in current dir
	and also do it recursively

- `cat error.log | grep [Warning] | wc` - count number of
 	appearances. **BUT IT'S NOT CORRECT** -> `[]` to search for
 	any character => use `awk` to have a certain match
 	- `cat error.log | awk '$3 ~/[Warning]/' | wc`
 	<a href="https://java2blog.com/awk-print-1/">View awk</a>
- both `sed` & `awk` allows to parse a text, but `awk` is more
	powerfuls

- NIDS: network-based intrusion detection system
	* monitors a private network for evidence of infiltration.
	* compare baseline system with current
	* software for it: Snort, Nmap, Wireshark
- HIDS: host-based intrusion detection system
	* monitors servers for evidence system files have been maliciously altered
	* Tripwire