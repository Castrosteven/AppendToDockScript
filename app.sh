#!/bin/sh

# Uses OSX defaults tools to modify the dock's preferences list (plist)
# It's located in $HOME/Library/Preferences/com.apple.dock.plist
# For info on how to use defaults: https://ss64.com/osx/defaults.html
# Castrosteven.com

# Declare An array of string with paths to the locations of the applications we want to add to the dock
declare -a itemsList=("/System/Applications/Mail.app" "/System/Applications/Notes.app" "/System/Applications/System Preferences.app" "/Applications/Google Chrome.app")
# clear items (Needs to clear or you might have duplicates it will not over-write if it already exists.)
defaults write com.apple.dock persistent-apps -array
# Loops trough itemsList array and adds each of the apps to the dock.
for dockItem in "${itemsList[@]}"; do
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>'"$dockItem"'</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    echo added $dockItem
done
# Resets the dock service so changes can take place
killall Dock

