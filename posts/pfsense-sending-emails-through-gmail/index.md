---
title: "pfSense: Sending emails through gmail"
date: "2012-02-01"
permalink: false
tags: ["admin-stuff", "post"]
---

It seems troublesome to send email especially through gmail accounts from \*nix systems. Using pfSense as our Captive Portal box running on top of FreeBSD is no exception. So that's what we did to get pfSense sending us emails through shell scripts.

I've tried a couple of things, but eventually sticked to a perl module (including the BSD packages mailx and msmtp), but they all didn't work in one way or another. I came pretty far, but at the end figured out that TLS/SSL support is not build-in. And compiling the packages on the pfSense box seemed not advisable. After all it is a firewall.

To install it, simply invoke this from the shell: 
``` bash
pkg_add -r p5-Net-SMTP-TLS
```

In case you have a sligthly outdated pfSense installation like I do and this command fails, you might need to tune the package repository a little bit. 
``` bash
setenv PACKAGESITE ftp://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/i386/8.1-RELEASE/packages/Latest/
```

Afterwards use this [script](https://github.com/x-ian/pfSensePortal/blob/master/send_gmail.perl) as an example on how to send mails through the perl module.

Don't forget to put your gmail password in a file called send\_gmail\_config.txt (just the password, nothing else) and well protect it.
