# Set Gateway ARP for Mac OS (BETA)

[ARP](https://en.wikipedia.org/wiki/Address_Resolution_Protocol) Spoofing is an old yet efficient way to carry out [MITM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) attacks on a local network. Although we may have mitigation mechanisms, like [DHCP Snooping](https://en.wikipedia.org/wiki/DHCP_snooping) and Dynamic ARP Inspection (DAI), set on the corporate network, when we are connected to a less secure environment, we may be at risk.

In a MITM ARP Spoofing scenario, the attacker will send spoofed ARP messages to victims in order to associate its own MAC Address with the network gateway allowing him to intercept and manipulate all traffic.

This project provides a set of simple scripts for Mac OS that automatically sets the gateway MAC address on the ARP table in a an way that it cannot be overriden by gratuitous ARP messages usually sent in attack scenarios.

## Tested OS versions

* High Sierra

## Installation

Copy **setgatewayarp.plist** to **/Library/LaunchDaemons**
```
sudo cp setgatewayarp.plist /Library/LaunchDaemons
```
Install the **setgatewayarp service** on Mac OS
```
sudo launchctl load /Library/LaunchDaemons/setgatewayarp.plist
```
Copy **setgatewayarp.sh** to **/usr/local/bin**
```
sudo cp setgatewayarp.sh /usr/local/bin
sudo chmod +x /usr/local/bin/setgatewayarp.sh
```
Done

## Check results

Open system Console logs (Applications -> Utilities -> Console) and filter for "setgatewayarp" while you connect to a different network (ie: WiFi). If everything is set properly, you may see the logs from scripts permanently setting the gateway ARP, as in figure bellow.

![setgatewayarp logs](https://cdn-images-1.medium.com/max/1600/1*uhgFPap0JHBxvfpa3Pj-eA.png)
Figure: Setting up gateway ARP.

Finally, you may check your system's ARP table:

![arp -an command](https://cdn-images-1.medium.com/max/1600/1*umkKNpDaRGyzJrjXdTTx7w.png)
Figure: ARP table with permanent gateway MAC Address

## Uninstall
```
sudo launchctl unload /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /usr/local/bin/setgatewayarp.sh
```

## Credits
Morphus Labs Team (morphuslabs.com)
