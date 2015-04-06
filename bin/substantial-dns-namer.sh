#! /usr/bin/env bash

# Usage Notes:
# Call with an argument to set your hostname
# Call without an argument to see what current values are
echo "Current Values"
echo "-------------------"
echo "HostName: `scutil --get HostName`"
echo "LocalHostName: `scutil --get LocalHostName`"
echo "ComputerName: `scutil --get ComputerName`"

if [ -z "$1" ]
then
    exit 0
fi


name="$1"
echo "Setting all values to '$1'"
sudo scutil --set HostName $name
sudo scutil --set LocalHostName $name
sudo scutil --set ComputerName $name