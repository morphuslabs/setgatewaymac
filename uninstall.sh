#!/bin/sh

sudo launchctl unload /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /Library/LaunchDaemons/setgatewayarp.plist
sudo rm /usr/local/bin/setgatewayarp.sh
