---
title: "Migrate Windows (XP) guests from VMware Fusion to Virtual Box"
date: "2016-01-04"
permalink: false
tags: ["misc", "post"]
---

Kind of outdated toolset, but just that I don't forget it...

I still had some old VMware Fusion 6.0.6 virtual machines laying around on my Mac OS X 10.9.5. As I was recently using more advanced Virtual Box features, I decided to unify all virtual machine instances with Virtual Box. Turned out this is straight forward, if only you know what you do!

1. First of all delete unneeded snapshots as they couldn't be migrated anyways.
2. Then uninstall the VMware Tools (Guest additions).
3. Get [Disk2VHD](https://technet.microsoft.com/en-us/sysinternals/ee656415.aspx "Disk2VHD") from Microsoft Technet
4. Export the VHD image with disabled VHDx from within the VM you want to migrate
5. Create a new Virtual Box instance, instead of creating a new disk attach the VHD file as harddisk
6. Enable IO-APIC
7. Start up the VM and install Virtual Box guest additions

That's it.
