#!/bin/bash
# Set Gateway ARP
# Initial version by Morphus Labs

COUNTER=0
ARPSET=0
while [ $COUNTER -lt 10 ]; do
	
	let COUNTER=COUNTER+1

	# Collecting gateway IP and ARP addresses
	gatewayip=`route -n get default | grep gateway | awk '{ print $2 }'`
	gatewaymac=`arp -an | grep "("$gatewayip")" | awk '{ print $4 }'`

    	if [ ! -z $gatewayip ]; then
		# Logging
		logger "#setgatewayarp: setting up permanent gateway arp configuration to $gatewayip / $gatewaymac"

		# Inserting gateway ARP entry
		arp -s $gatewayip $gatewaymac 
		ARPSET=1

        	# exit the loop
        	let COUNTER=COUNTER+10
        	break
    	fi
    	# give a little time for a network to get up
	logger "#setgatewayarp: giving a litte time for network to get up"
    	sleep 2
done

if [ "$ARPSET" -eq "0" ]; then
	logger "#setgatewayarp: error setting up permanent gateway arp."
fi
