#!/bin/bash
NOW=$(date + "%m_%d_%Y")
tar czvf /var/backups/site-backup-$NOW.tar.gz /var/www