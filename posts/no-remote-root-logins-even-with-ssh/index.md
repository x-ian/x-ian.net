---
title: "No remote root logins (even with SSH)"
date: "2009-05-19"
permalink: false
tags: ["admin-stuff", "post"]
---

OK. Not really "Programming stuff" anymore. But still important:

> Don't allow remote root logins at all, even with SSH

Why not? Because:

- User name of root is known, therefore the account is vulnerable for brute-force attacks
- Working as root should be an explicit switch and not the default policy. Just like being aware of switching hats.
- Bad for auditing, if multiple users have root access.

But now you say: "I don't care as I use SSH for logins".

- Depending on the auth method, password is still transfered over the wire.
- But using public key auth instead of passwords might be even worse. Still you have to trust all(!) clients that the private key is stored safely. Read:

- "Good enough" passphrase.
- There is no way to tell from the public key (which is the only thing known by the server), if the private key has a passphrase at all.
- Trust the client system (that it is not compromised)
- Auto lock of the client system must be enabled after a few minutes of inactivity.
- Sensible use of background daemons like ssh-agent or Pageant(Putty for Windows) on client systems necessary. What if the users start the keyring app, enters his passphrase and never shuts down his system. And now imagine a laptop running out-in-the-wild without any local password protection having an open private key in its memory!

What to do? Dunno. Maybe:

- Use "ordinary" user accounts
- SSH with either public key or passwd auth (depending on your decisions reg the previous points)
- Enforce sudo (better) or su (less better) to gain temporarily root privileges

Anything else???
