#!/bin/sh

sudo cp setgatewayarp.plist /Library/LaunchDaemons
sudo cp setgatewayarp.sh /usr/local/bin
sudo launchctl load /Library/LaunchDaemons/setgatewayarp.plist
sudo chmod +x /usr/local/bin/setgatewayarp.sh
