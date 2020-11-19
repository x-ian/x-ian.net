---
title: "pfSense: Self-registration for Captive Portal"
date: "2012-02-14"
permalink: false
tags: ["admin-stuff", "post"]
---

Managing your users is good. But the work that comes with creating user accounts upfront is tedious and boring. At one point we got lost in trying to hook up each system manually to our WiFi. So we decided to outsource this to our users so that they have to register their devices by themselves.

Luckily pfSense proves to be extremely flexible, so with a custom portal page and some additional scripts we are able to get the important information we need. We ask the user to provide

- User
- Email address (to get in touch with the user) and
- Accept our Acceptable use policy.

From there the system automatically detects

- MAC address (for device identification)
- Initial IP during registration (the subnet from where the users connects tells us roughly from which geographical area the devices is connected to)
- Date of registration
- Hostname

Every time a new devices is connected to the network, the system redirects the very first HTTP request to our custom portal page. After entering the required fields and hitting 'Register' the system automatically detects MAC address and system hostname and creates a new user in our FreeRADIUS installation. If successful, the user is granted access to the network. If the system connects again, it uses RADIUS MAC authentication to see whther the user is already registered. If yes, then access is permitted. If not, the user is redirected to the portal page again.

(Note: Using solely the MAC address makes the system vulnerable to spoofing attacks. However our users typically don't have this knowledge. At least not yet.)

During this self-signup, the user is only granted access with restricted traffic limits (we make use of pfSense' WISPr-Bandwidth-Max-Down and WISPr-Bandwidth-Max-Up capability with low initial values). From there the admins can promote the system to higher traffic caps if found eligible.

The whole configuration/deployment process is a little bit more complex. If someone wants to dive deep into it, make sure to check out our [project page](https://github.com/x-ian/pfSensePortal).
