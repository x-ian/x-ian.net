---
title: "Apple devices (MacBook Pro) and 5 GHz WiFi access points (Ubiquiti NanoStation)"
date: "2016-05-19"
permalink: false
tags: ["misc", "post"]
layout: "post.njk"

---

Deploying 5 GHz NanoStations as 'end-user access points' always gave some 'hiccups' with various Apple MacBooks. Usually they could see the signal, but were never able to connect to it. Finally with these settings they hooked up:

- Disable airMAX
- Set Country code to US
- Channel width 20 MHz
- Frequency 5785 MHz 
- Wifi security WPA2-AES

I simply assume that not all of these settings are required, but I'm simply too lazy to see which ones are required and which ones are optional.
