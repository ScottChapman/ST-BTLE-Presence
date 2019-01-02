# ST-BTLE-Presence
SmartThings presence using BTLE with Node-Red on Raspberry Pi.

## Description
The idea with this project is to use run of the mill Bluetooth Trackers (like PebbleBee) as presence device for SmartThings. It is a set of Node-Red flows designed to run on a Raspberry Pi. The general design looks like this:

Scanner -> MQTT -> Device Handler -> SmartThings MQTT Bridge -> SmartThings

With this approach, you can have as many `Scanners` as you need to provide good coverage for your house/property. They can be run a simple/inexpensive Pi Zero devices (which is what I use).
Each `Scanner` simply reports what BTLE devices is sees to a single MQTT topic. Then each `Device Handler` (with represents a specific key finder device) looks for it's own ID and updates SmartThings using the corresponding MQTT topic.

## Setup.
This is the general list of what you need to be able to run this:
- Scanner
  - Node-Red (current is fine)
    - node-red-contrib-noble - contrib module (others might work, but this is what I've used here)
  - Node 8.10.1 (needed for the specific BTLE scanner)
- Device Handler
  - Node-Red (current is fine)
  - Node (current is also fine)
  - [SmartThings MQTT Bridge](https://github.com/stjohnjohnson/smartthings-mqtt-bridge)
  - The Device flow has a configuration node where you enter:
    - BTLEID - the lowercase, without colons UUID for the device
    - topic - the full name of the MQTT topic to publish (e.g. `/smartthings/<virtual device name>/presence`)
- SmartThings
  - Virtual Presence device (one for each device flow above)
