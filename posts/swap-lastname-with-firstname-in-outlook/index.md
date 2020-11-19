---
title: "Swap Lastname with Firstname in Outlook"
date: "2009-05-01"
permalink: false
tags: ["programming-stuff", "post"]
---

Even my \[ of course way too old, grandpa-style, ugly, quite unsexy, and nothing close to a nerd gadget \] mobile phone Nokia 6230 offers a PC sync. OK. They were supposed to offer this even in the last millennium. But ever since then I was struggling with it. Not even with a real day-to-day sync but just with a one-time copy operation of my contacts from my PC to the phone. Surely, if I only had/have a Mac. But life is never easy and you should always challenge yourself...

But why on earth is Nokia only offering one entry for a combined name field. In digits: 1, in letters again: ONE. But even more why on earth am at least I not able to put my Outlook contacts in the "Lastname Firstname" order to the phone. The PC Suite seems just to know it better and doesn't let me. Therefore an alphabetic sort on the phone just shows of all the firstnames first. Crap and I need another solution.

So as I'm a developer I was refusing to simply look for already working solutions or even spend money. I had to do it the do-it-yourself way (for sure hundreds must have done this before).

So here is a small [Outlook macro](http://github.com/x-ian/outlook-swapnames/tree/master) which takes all of your entries in the address book and places them in a new outlook address book called NokiaAddressBook. There it simply swaps lastname with firstname and I get my "Lastname Firstname" style. Stupid ugly, but also stupid simple.

Too bad my Nokia broke recently and now I switched to a Sony Ericsson.

PS1: This solution was heavily [influenced](http://www.telefon-treff.de/showthread.php?s=&threadid=131735&ighlight=outlook+AND+sortieren). Thanks! PS2: If you do the sync, close the Nokia Phone browser as it seems to block to connection of the PC Suite to your phone. PS3: The Nokia Phone Browser supports an import/export of vCards. But (not surprisingly) Outlook does not. Another but: The standard windows address reads vCards. So import vCards first to the Windows addressbook and from there to Outlook...
