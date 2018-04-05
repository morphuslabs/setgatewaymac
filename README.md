# setgatewayarp (BETA)

ARP Spoofing is an old but yet efficient way to carry out attacks MITM attacks on a local network. Although we may have mitigation machanisms, like DHCP Snoop and Dynamic ARP Inspection (DAI), set on the corporate network, when we are connected to a more insecure environment, we may be at risk.

In a MITM ARP Spoofing scenario, attacker will send spoofed ARP messages to victims in order to associate its own MAC Address with the network gateway allowing him to intercept and manipulate all the traffic.

This project provides a set of simple scripts for MAC OS (tested on High Sierra) to automatically set current gateway MAC address on system ARP table in a permanent state. It will avoid the system to accept ARP gratuitous messages usually sent in such attack scenarios.  

# Installation
  
Copy gatewayarp.plist to /Library/LaunchDaemons
sudo cp setgatewayarp.plist /Library/LaunchDaemons

Install setgatewayarp service on MAC OS
sudo launchctl load /Library/LaunchDaemons/setgatewayarp.plist

Copy setgatewayarp.sh to /usr/local/bin
sudo cp gatewayarp.sh /usr/local/bin
sudo chmod +x /usr/local/bin/setgatewayarp.sh

Done
