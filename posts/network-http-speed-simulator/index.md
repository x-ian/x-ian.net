---
title: "Network (HTTP) speed simulator"
date: "2009-04-23"
permalink: false
tags: ["programming-stuff", "post"]
---

If you're seriously developing a webapp, sooner than later one of your clients will come with some Internet Explorer 6 related complains. Still in 2009, the year of the [IE Death](http://iedeathmarch.org/) march. So what to do if they say: With IE6 is takes 3x longer to load the page than with \_any other browser\_?

But even if it is not the IE6, you still might wonder how your app behaves with different connection speeds. There are some (windows) applications out there, which try to simulate different network connections. There must be others, but I've found [Netlimiter](http://www.netlimiter.com/) and [Speed Simulator](http://www.ngcoders.com/downloads/internet-speed-simulator-proxy-throttler) as out-of-the-box solutions. But Netlimiter is not free and Speed Simulator seems to have some problems with certain requests (AJAX, forwards, ... who knows).

When it comes to HTTP-related things, why not using [Squid](http://www.squid-cache.org/) as the de-facto standard for Proxy Servers?

Installing Squid is not as difficult as it may sound, even under [Windows](http://squid.acmeconsulting.it/). Just make sure that the [Delayed Pools](http://wiki.squid-cache.org/Features/DelayPools?highlight=(faqlisted.yes)) Feature is enabled.

For your personal development you can leave all of the default configs in the squid.conf, except those:

```
1. # allow all requests 
acl all src 0.0.0.0/0.0.0.0 
http_access allow all 
icp_access allow all

2. # delayed pools 
delay_pools 1 
delay_class 1 1 
delay_access 1 
allow all delay_parameters 1 4000/4000 
# 64000 = 64 kbytes = 512 kbits 
#  8000 =  8 kbytes =  64 kbits 
#  4000 =  4 kbytes =  32 kbits
```

To change the connection speed, simply tweak the values for delay\_parameters e.g. to 64000/64000.

And if your are using Firefox as one of your development browsers, simply install the [SwitchProxy](https://addons.mozilla.org/firefox/addon/125) Addon. This allows you to quickly switch between preconfigured proxy settings on-the-fly.

[And if you really what to go "pro", set-up multiple instances of Squid with different connection speeds, provide their services under different ports, and create different proxy configs for SwitchProxy. Then you don't even have to modify the squid.conf every time you want to switch the speed.]
