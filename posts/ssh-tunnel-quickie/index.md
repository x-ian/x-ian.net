---
title: "SSH tunnel Quickie"
date: "2009-10-13"
permalink: false
tags: ["admin-stuff", "post"]
---

Sometimes I prefer to have a private (read secure and non-observable) web connection - being a developer and admin makes you a bit more paranoid...

So how can you establish a connection that besides from being non-observable _may_ also bypass potential content filters or firewall rules? Of course with a simple SSH tunnel: `ssh -D 8080 -C -q -N user@server   (-f to put it in background?)`

Now simply configure your browser to use the SOCKS proxy running on your localhost at port 8080 and off you go.

The drawback is, that you need a Unix server outside to connect to. But who has not such a system [somewhere](http://www.firstprinciplesmanagement.com)? And even if not by now, maybe just go in the [clouds](http://aws.amazon.com/ec2/).

And for those unlucky guys running Windows and PuTTY: even you could do [that](http://vectrosecurity.com/content/view/67/26).

Update: It seems like SSH can even be misused to tunnel Remote Desktop connections. This might do the trick:

sudo ssh -D 8180 -p 8999 <SSH user>@<public external IP>  -L 127.0.0.1:3333:<internal IP of target RDP system>:3389
