#! /bin/sh

# reindex source by OpenGrok
# Copyright (C) 2019-2019 Oak Chen <oak@sfysoft.com>

export PATH="/usr/local/tomcat/bin:/usr/local/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

logfile=/var/log/reindex/`date +%Y-%m-%d`.log
exec 1> $logfile
exec 2>> $logfile

date +%Y-%m-%d:%H-%M-%S

cd /opengrok/src
# If source uses repo, sync it
if [ -d .repo ]; then
	repo sync --no-repo-verify -c -f
fi

/scripts/index.sh
