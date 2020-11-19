---
title: "Gmail and IMAP - an odd couple: How gmail plays nicely with IMAP"
date: "2012-11-03"
permalink: false
tags: ["misc", "post"]
---

[Lots](http://jeffschuette.com/2012/03/07/setting-up-apple-mail-to-rock-and-roll-with-gmail/) has [been](http://www.jasonhendriks.com/2011/05/using-gmail-with-apple-mail/) written [about](http://www.macworld.com/article/1157846/mailgmail.html) it. There is even an [official guideline](http://support.google.com/mail/bin/answer.py?hl=en&answer=78892) provided by Google. Many different ways to use it, but fact is that the default config is bloody useless. Partially because IMAP only knows hierarchical folders and gmail has labels, partially because IMAP has a few underspecified parts.

Here are my 2 cents of hands-on configuration for IMAP clients like Apple Mail or Microsoft Outlook:

- If you are on a mobile devices, use ActiveSync/Exchange connectivity. \[Reason: increase your lifetime by reducing blood pressure\]
- Modify Labels in gmail via Settings. Deactivate 'Show in IMAP' at least for 'All mail', maybe also for 'Starred', 'Important', 'Chat' \[Reason: Mails can be tagged with multiple labels and therefore show up in every folder derived from the labels. Hence a message tagged with more than one label will be duplicated in these folders.\]
- For custom labels use '\[Gmail\]/ as a prefix \[Reason: This way they will show up underneath the Default folder path \[Gmail\] in your mail client.\]
- Consider deactivating 'store draft messages on server' \[Reason: depending on your network this can slow down and eat up bandwidth together. Additionally it might happen that mails currently drafted and saved multiple times will show up as deleted mails whenever the auto save on the client happens.
- Store sent messages on the server, Store junk messages on the server, and Move deleted messages to the Trash mailbox \[Reason: keep these folders in sync with your gmail UI or other mail clients.\]
- Store deleted messages on the server and never permanently erase deleted messaged \[Reason: Use the trash just like in gmail. But remember that gmail automatically deletes your trash after 30 days. So don't use your trash folder as your hidden archive!\]
- Consider using the IMAP Path prefix of \[Gmail\] as all the folders/labels are mapped under the folder \[Gmail\] in IMAP.
- Tell your mail client which folders are used for Sent messages, Trash, Spam, Drafts. In Apple Mail right click in the corresponding Gmail folders and say: 'Use this mailbox for ...' \[Reason: IMAP knows about folders, but doesn't standardize these special folders (apart from the Inbox). So one client might use 'Deleted messages, while another client might use 'Trash' to store deleted messages. This tells the mail client that it should use the same folder gmail uses.\]

And now: Go and test it! Test it multiple times, in and out of every direction you can think of. Only use the setup if you are confident you didn't mess it up!

If your local mail client shows weird behavior after all these configs, invoke a Rebuild or Reconcile or however it is called from your client to re-sync mails with Gmail.
