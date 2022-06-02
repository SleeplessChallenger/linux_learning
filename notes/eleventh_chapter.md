<h2>Eleventh chapter: logging</h2>

- Initially `syslogd` was the daemon that deals with logs
	- it processes logs from data sources in `/dev/log` and
		redirect them to `/var/log`

- <img src="../image_folder/logs.png" width="300" height="600">

- Now it's ALSO handled by `journald` with command `journalctl`
	- `journald` stores data in binary files, not in plain text
		like `syslogd`

- <img src="../image_folder/logs-journal.png" width="300" height="600">