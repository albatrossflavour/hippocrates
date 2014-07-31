#!/bin/sh 

# Source configuration and variables
. /Users/tgreen/Dropbox/bin/lib/bsfl
. /Users/tgreen/Dropbox/bin/lib/global-functions
. /Users/tgreen/Dropbox/bin/lib/global-variables
. /Users/tgreen/Dropbox/bin/hippocrates/lib/hippocrates-variables
. /Users/tgreen/Dropbox/bin/hippocrates/lib/hippocrates-functions

# Gather options and validate arguments 
msg_debug "Gathering options"
while getopts "t:l:m:hcp?v" c;do
	case $c in
  		t) 		TICKET=$OPTARG;;
  		l) 		LEVEL=$OPTARG;;
  		m) 		MODE=$OPTARG;;
		h)		QUERY="$QUERY health";;
		p)		QUERY="$QUERY performance";;
		c)		QUERY="$QUERY compliance";;
  		v|d)	DEBUG=y;;
  		?)		die 1 "$USAGE" ;;
	esac
done

msg_debug "Starting run"

# Check for a lock file and create one if needed
lockfile 

case $LEVEL in 
	[1,2,3]) ;;
	*) die 1 "Invalid level - only levels 1-3 are valid" ;;
esac

case $MODE in 
	manual);;
	triggered);;
	scheduled);;
	*)
	die 1 "Invalid mode - only modes manual, triggered or scheduled are valid" ;;
esac

case `uname` in
	Darwin)		OS="darwin" ;;
	Solaris)	OS='solaris' ;;
	Linux)		OS='linux' ;;
esac

msg_debug "Ensure data directory structure is there"
if [ -n "$TICKET" ]
then
	msg_debug "Ticket defined : $TICKET"
	data_directory $TICKET
else
	msg_debug "Ticket not defined, using mode : $MODE"
	data_directory $MODE
fi

msg_debug "Checking which scripts we should run"

if [ -z "$QUERY" ]; then QUERY="health"; fi
for TYPE in $QUERY
do
	CHECKS="$CHECKS `$LS -1 $CHECK_DIR/[1-${LEVEL}]_unix_${TYPE}* $CHECK_DIR/[1-${LEVEL}]_${OS}_${TYPE}* 2>/dev/null`"
done

msg_debug "Begining checks"
for CHECK in $CHECKS
do
	msg_debug "Performing check : $CHECK"
	CHECKNAME=`$BASENAME $CHECK`
	$CHECK "${BASEFILE}_${CHECKNAME}" 2>&1 1> "${BASEFILE}_${CHECKNAME}.txt" || msg_warning "Issues running $CHECK"
done
msg_debug "Completed checks"

# Clean up
msg_debug "Removing $LOCKFILE"
$RM $LOCKFILE || die 1 "Couldn't remove $LOCKFILE"
msg_debug "Finished run"
