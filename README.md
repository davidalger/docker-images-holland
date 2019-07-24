# Holland Backup Manager Docker Images

Executes holland backup job at 3 AM each day via a crontab at `/etc/cron.d/holland` (this can be overriden by mounting a file on top of it). Data at `/var/spool/holland` is stored on a docker volume by default.
