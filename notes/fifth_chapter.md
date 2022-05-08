<h2>Fifth chapter: automated administration</h2>

- There are 2 approaches to scheduling: `cron` & `systemd timers`

1. `#!` means that Linux will read it and use as an active shell: `/bin/sh`
	- this string is known as a **shebang line**

2. Look at `back_up.sh` to see for comments of bash script
	- being put in `/etc/cron.daily/` will make it execute daily

3. 2 ways to create users: 
	- `sudo useradd -m some_name`
	- `sudo adduser some_name`

	- latter is better as it a) creates acc for user in `/home` b) prompts you to assign password
	- former will create dir only if you add `-m` & for password: `sudo passwd new-useer-name`

4. you can give `sudo` rights to users joining the team by writing them in `/etc/shadow`:
	- `sudo:x:27:steve,newuser,neweruser`

5. to make script executable you need to run: `chmod +x upgrade.sh`
	- run this **before putting script** to `/etc/cron.daily/`

6. By default `cron` runs as a root
	- but if you want to run it from command like: `sudo ./some_script.sh`

7. Looking at cron related files in `/etc/`
	- if you want script to be executed hourly: put in `cron.hourly` etc
	- `cron.d` is where you put file with precise time: those `* * * * *`
		- you don't need a script for this command
		- you need to put user: like `root`
	- `crontab`: same as above, but no need to create a separate file
		- in the book it's said that `cron.d` is better as `crontab` highly
			likely will be overwritten
		- run `crontab -l` to see which crons are schedules for you
		- `crontab -e` to edit **crontab** and execute from your user (not root)
		- `test -x` is a command to check status of an object before launching a related operation
		- same as with `cron.d`: you need user like `root`
	- `anacrontab` is a file which allows to run commands after each boot
		- I.e. you can't guarantee that you'll have you system turned on for general cron
		- there are 2 figures: day interval & how many minutes after the boot
		- `anacron` is given priority over cron, that's why there are `cron.something`<b>
				commands there
			- logs are saved to: `/var/spool/anacron`

8. `systemd timers` are more complicated than `cron`, but come with much more diversity
	- create script which you want to eexecute
	- `/etc/systemd/system` || `/lib/systemd/system`
	- create `.service` file: to describe & define system service
		- `Description` is to name what service does
		- `ExecStart` points to file/script
	- create `.timer` file is for when you want the service to run
		- Timer section is where you put schedule & `Unit` **line** points to servic file

	- start the service by `systemctl start some_service.timer`
	- load the service to load automatically when the system boots: `systemctl enable some_service.timer`
	- check status by: `systemctl is-enabled some_service.timer` & `systemctl is-active some_service.timer`
	- **after editing:** `systemctl daemon-reload`
	- diff between reload & restart: Reload will tell the service to reload its configuration files, but keep the same process running. Restart tells it to shut down entirely, then restart

9. Below are the examples for described above `systemd timer`:

* `.service file`
```
[Unit]
Description=Backup Apache website

[Service]
Type=simple
ExecStart=/home/username/site-backup.sh

[Install]
WantedBy=multi-user.target
```

* `.timer file`
```
[Unit]
Description=Backup Apache website - daily

[Timer]
OnCalendar=*-*-* 5:51:00
Unit=site-backup.service

[Install]
WantedBy=multi-user.target
```

# TODO: write to author about 2 errors: with test -x & with systeemctl is-enabled
