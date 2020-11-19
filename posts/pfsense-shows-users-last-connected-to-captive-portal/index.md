---
title: "pfSense: Shows 'Users last connected' to Captive Portal"
date: "2012-02-07"
permalink: false
tags: ["admin-stuff", "post"]
---

Using pfSense with the built-in FreeRADIUS can give you quite a lot of information; they are just not always visible through the Web UI.

For instance if Radius logging is turned on you can keep track of all Captive Portal sessions by accessing the log files. This is particular useful when the users have the ability to create their own accounts on the fly through a custom portal page based on their MAC addresses. But you might want to clean old and unused accounts once in a while.

In order to spot accounts that have been inactive for some time, you need to know who connected when for the last time. With shell access, simply copy and invoke this [script](https://github.com/x-ian/pfSensePortal/blob/master/create_user_last_seen_csv.sh). This compiles a CSV list of all users ever registered with their MAC addresses together with the last time they have been connected through the Captive Portal. Import the CSV into Excel, filter and sort by the last connected column to see which accounts are ready for removal.

The result looks like this: 
```
MAC;TYPE;NAME;EMAIL;HOSTNAME;INITIAL_IP;REGISTERED;LAST_SEEN 
904ce5a76256;apzu;Public_IT;abc@pih.org;APZU-30;2011-09-15;20120128 
904ce5a76249;apzu;Public_IT;abc@pih.org;APZU-33;2011-09-16;20111019 
001217dfc379;priv;user1;abc@pih.org;APZU-DFA08FCD6D;2011-09-16;20120128 
001a7367b7ff;priv;user2abc@pih.org;;2011-09-18;20120127
```

(Note that part of the above dump has some custom information as it is tight to they way we use pfSense with a self-register capability for new users. But it should be straight forward to customize this.)

It would be simple to do this automatically (e.g. delete every account not connected in the last 3 months), but as I have some VIP users that I don't want to clear, I just do this once in a while manually. Additionally it could be run as a cronjob every now and then and I guess you could automatically publish it through a web page or mail it to someone. Let me know if you did this, then I can steal it from you ,)
