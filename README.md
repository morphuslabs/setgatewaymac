# Set Gateway MAC for Mac OS (BETA)

[ARP](https://en.wikipedia.org/wiki/Address_Resolution_Protocol) Spoofing is an old yet efficient way to carry out [MITM](https://en.wikipedia.org/wiki/Man-in-the-middle_attack) attacks on a local network. Although we may have mitigation mechanisms, like [DHCP Snooping](https://en.wikipedia.org/wiki/DHCP_snooping) and Dynamic ARP Inspection (DAI), set on the corporate network, when we are connected to a less secure environment, we may be at risk.

In a MITM ARP Spoofing scenario, the attacker will send spoofed ARP messages to victims in order to associate its own MAC Address with the network gateway IP address allowing him to intercept and manipulate all traffic.

This project provides a set of simple scripts for Mac OS that automatically sets the gateway MAC address on the ARP table in a an way that it cannot be overriden by gratuitous ARP messages usually sent in attack scenarios.

## Tested OS versions

* High Sierra

## Installation

Copy **setgatewaymac.plist** to **/Library/LaunchDaemons**
```
sudo cp setgatewaymac.plist /Library/LaunchDaemons
```
Install the **setgatewaymac service** on Mac OS
```
sudo launchctl load /Library/LaunchDaemons/setgatewaymac.plist
```
Copy **setgatewaymac.sh** to **/usr/local/bin**
```
sudo cp setgatewaymac.sh /usr/local/bin
sudo chmod +x /usr/local/bin/setgatewaymac.sh
```
Done

## Check results

Open system Console logs (Applications -> Utilities -> Console) and filter for "setgatewaymac" while you connect to a different network (ie: WiFi). If everything is set properly, you may see the logs from scripts permanently setting the gateway MAC on your system ARP table, as in figure bellow.

![setgatewayarp logs](https://cdn-images-1.medium.com/max/1600/1*znuMKd2kdj-HU-NiGths2w.png)
Figure: Setting up gateway MAC.

Finally, you may check your system's ARP table:

![arp -an command](https://cdn-images-1.medium.com/max/1600/1*umkKNpDaRGyzJrjXdTTx7w.png)
Figure: ARP table with permanent gateway MAC Address

## Uninstall
```
sudo launchctl unload /Library/LaunchDaemons/setgatewaymac.plist
sudo rm /Library/LaunchDaemons/setgatewaymac.plist
sudo rm /usr/local/bin/setgatewaymac.sh
```

## Credits
Morphus Labs Team (morphuslabs.com)
