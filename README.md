# Set Gateway ARP for Mac OS (BETA)

ARP Spoofing is an old yet efficient way to carry out MITM attacks on a local network. Although we may have mitigation machanisms, like DHCP Snooping and Dynamic ARP Inspection (DAI), set on the corporate network, when we are connected to a less secure environment, we may be at risk.

In a MITM ARP Spoofing scenario, attacker will send spoofed ARP messages to victims in order to associate its own MAC Address with the network gateway's allowing him to intercept and manipulate all the traffic.

This project provides a set of simple scripts for MAC OS (tested on High Sierra) to automatically set current gateway MAC address on system ARP table in a permanent state. It will avoid the system to accept ARP gratuitous messages usually sent in such attack scenarios.  

## Installation
  
Copy setgatewayarp.plist to /Library/LaunchDaemons
```
sudo cp setgatewayarp.plist /Library/LaunchDaemons
```
Install setgatewayarp service on MAC OS
```
sudo launchctl load /Library/LaunchDaemons/setgatewayarp.plist
```
Copy setgatewayarp.sh to /usr/local/bin
```
sudo cp setgatewayarp.sh /usr/local/bin
sudo chmod +x /usr/local/bin/setgatewayarp.sh
```
Done

## Check results

Open system Console logs (Applications -> Utilities -> Console) and filter for "setgatewayarp" while you connect to a different network (ie: WiFi). If everything was set up properly, you may see the logs from scripts setting up the gateway ARP in a permament way, as in figure bellow.

![setgatewayarp logs](https://cdn-images-1.medium.com/max/1600/1*uhgFPap0JHBxvfpa3Pj-eA.png)
Figure: Setting up gateway ARP in a permament way.

Finally, you may check your system's ARP table:

![arp -an command](https://cdn-images-1.medium.com/max/1600/1*umkKNpDaRGyzJrjXdTTx7w.png)
Figure: ARP table with permanent gateway MAC Address set

## Uninstall
```
sudo launchctl unload /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /usr/local/bin/setgatewayarp.sh
```

## Credits
Morphus Labs Team (morphuslabs.com)
