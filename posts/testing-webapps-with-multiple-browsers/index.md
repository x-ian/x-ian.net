---
title: "Testing Webapps with multiple browsers"
date: "2009-05-13"
permalink: false
tags: ["ruby-rails", "post"]
---

Developing web applications can be fun and hard almost at the same time.

But when it comes down to testing, it can be a [...](http://www.thefreedictionary.com/pain+in+the+ass).

Sure every developer has his [favorite environment](http://x-ian.net/2009/05/11/develop-with-firefox/) and develops against it. But his special browser is just a part of the big picture and there are way to many different browsers and versions out there in the wild. Of course you know them all:

- Internet Explorer \[ [6](http://iedeathmarch.org/) | 7 | 8 with [Compatibility View](http://blogs.msdn.com/ie/archive/2008/08/27/introducing-compatibility-view.aspx) | 8 \]
- FireFox \[2 | 3 \]
- Safari \[ 3 | 4 \]
- Chrome
- Opera

And those are only the traditional desktop browsers for MacOS, Win and Linux. (Personally I assume, that one browser behaves almost the same on different OS when it comes to the programming model. But this is not necessarily true for layout issues). Note that this list totally ignores the growing mobile market. I don't know yet how to deal with them...

It will get even ridiculous if you could only install one version of a browser at the same time. Yes, IE - most credits go to you! There are some [hacks](http://tredosoft.com/Multiple_IE) out there to install the Internet Explorer in different versions on one system.

In the past I've simply virtualized my system and got one image for every single browser. Worked, but it always felt like "[shooting cannons to sparrows](http://en.wikipedia.org/wiki/Who_breaks_a_butterfly_upon_a_wheel%3F)". There is quite some overhead involved to install and actually fire up the VM image.

Why not simply virtualize the browser? That's exactly what [Xenocode](http://www.xenocode.com/Browsers/) is doing. Download, run and test. Nice. The seamlessly network integration even make those things like [local proxy servers](http://x-ian.net/2009/04/23/network-http-speed-simulator/) work.

--

January 21st, 2010 at 17:31 | #1Reply | Quote

maybe https://browserlab.adobe.com/index.html is worth a try too…
