---
title: "Do-it-yourself WiFi Catcher"
date: "2010-08-01"
permalink: false
tags: ["admin-stuff", "post"]
---

Ever had to track down a client devices in an area covered by many (unmanaged) WiFi Access Points?

If tools like kismet/kismac are not working for you to track computers (e.g. because of unsupported hardware, crashes, bad wifi antenna on your laptop, then just build it yourself.

All you need is a flashable consumer-level wifi access point (like a Linksys WRT54) and flash it with [dd-wrt](http://www.dd-wrt.com). This can put the router in monitor mode and together with the addon [wi-viz](http://wiviz.natetrue.com/) you get an overview over all wireless activity.

And in case you want it mobile, simply put a bunch of batteries, e.g. 8 AA batteries with 1.5V each in a row and connect it to the router. Finally connect your laptop with an Ethernet cable, stuff everything in a little bag and walk around. If you know the MAC address of the devices your are looking for (laptop, handheld,...) just see very you have the strongest signal and walk in that direction. And voilà, you are able to geographically localize every WiFi device. Regardless of it's connection to a specific access point. Welcome wiFi Catcher. Welcome Jack Bauer.
