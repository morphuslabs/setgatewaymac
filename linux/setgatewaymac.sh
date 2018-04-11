#!/bin/bash
# Set Gateway MAC - Linux
# Linux version by Morphus Labs

COUNTER=0
ARPSET=0

action=$2

# If the second argument is not 'up', exit
[ $action != "up" ] && exit 0

while [ $COUNTER -lt 10 ]; do
	
	let COUNTER=COUNTER+1

	# Collecting gateway IP and ARP addresses
	gatewayip=`ip route | grep default | awk '{ print $3 }'`
	gatewaymac=`arp -an | grep "("$gatewayip")" | awk '{ print $4 }'`

    	if [ ! -z $gatewayip ]; then
		# Logging
		logger "#setgatewaymac: setting up permanent gateway arp configuration to $gatewayip / $gatewaymac"

		# Inserting gateway ARP entry
		arp -s $gatewayip $gatewaymac 
		ARPSET=1

        	# exit the loop
        	let COUNTER=COUNTER+10
        	break
    	fi
    	# give a little time for a network to get up
	logger "#setgatewaymac: giving a litte time for network to get up"
    	sleep 2
done

if [ "$ARPSET" -eq "0" ]; then
	logger "#setgatewaymac: error setting up permanent gateway arp."
fi
