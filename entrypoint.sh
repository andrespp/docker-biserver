#!/bin/bash

# Sets script to fail if any command fails.
set -e

start_biserver() {
	echo /biserver-ce/start-pentaho.sh $@
	/biserver-ce/start-pentaho.sh $@
	sleep 5
	tail -f /biserver-ce/tomcat/logs/pentaho.log
}

stop_biserver() {
	echo /biserver-ce/stop-pentaho.sh $@
	/biserver-ce/stop-pentaho.sh $@
}

print_usage() {
echo "

Usage:	$0 COMMAND

Pentaho BI Server (biserve)

Options:
  help		        Print this help
"
}

case "$1" in
    help)
        print_usage 
        ;;
    start)
	shift 1
        start_biserver "$@"
        ;;
    stop)
	shift 1
        stop_biserver "$@"
        ;;
    *)
        exec "$@"
esac
