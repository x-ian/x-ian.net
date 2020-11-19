---
title: "Outlook-iPhone birthday synchronisation"
date: "2009-05-30"
permalink: false
tags: ["programming-stuff", "post"]
---

- Not satisfied with the way Outlook (2003) handles birthdays and anniversaries?
- Want to have multiple birthdays just for one contact entry (maybe because you have one contact for a family, but want to track the birthdays of the countless kids)?
- Do you need to control the reminders for the birthdays?
- Wish you had the classical Palm solution ([Feiertage](http://www.nhueck.de/)) for your iPhone or iPod touch?

Yippee! [Macro time](http://github.com/x-ian/outlook-birthdays-done-right/tree/master) - ([again](http://x-ian.net/2009/05/01/swap-lastname-with-firstname-in-outlook/))!

**LegeGeburtstageUndJahrestageImKalendarAn**

Add multiple birthdays to the notes of your contact and create proper recurrent events. Basically enter for every birthday you want to track for this contact in a new line with the format GEB Name: 24.12.2000 (Note the European style date format day.month.year and the prefix GEB (german abbreviation for Geburtstag = birthday)). Simply add all of your birthdays or anniversaries to your contacts, run the macro, and of you go. For more details see the linked docu.

**LoescheGeburtstageUndJahresTageImKalendar()**

Remove all (automatically) created recurrent events (e.g. for cleanup purpose)

And if your Outlook asks you for every single modification for allowance, use [Advanced Security for Outlook](http://www.mapilab.com/outlook/security/) to suppress those questions.

If you are interested: This is all my knowledge about the way Outlook 2003 handles it's standard birthday field:

1. While saving the current contact Outlook automatically creates a new yearly recurrent event for birthdays and anniversaries.
2. Sometimes this series is created, even if an existing entry is simply modified. E.g. if you change parts of name, then Outlook seems to consider this a new entry and creates a new recurrent event. Of course without removing the old event...
3. Even just change an existing birthday or anniversary and Outlook doubles the event as the old one is not removed.
4. You can see the list of all associated events of a contact in the tab activities. (Therefore somehow the calendar entries are linked with the contact.
5. There is (sometimes?) a dedicated and predefined calendar view for yearly events.
6. Besides those small caveats the major drawback is that there is no easy and reliable way to have more birthday entries per contact (not taken into account that you could misuse the concept and iterativly overwrite the birthdays and rename the contact to create multiple recurrent events).

--

May 30th, 2009 at 21:04 | #1Reply | Quote

BTW: Sometimes my birthday entries in the calendar are going from 23:00 one day before the birthday up to 23:00 at the birthday (instead of occupying just the whole day). Why is it like that?
- Timezone?
- Daylight saving time?
- 42?

--

May 30th, 2009 at 21:56 | #2Reply | Quote

And just another hint. Maybe you want to use Outlook for your calendar stuff, but not really as your mail program.

Not a really good thing to do as Windows allows only to set one mail program system-wide via the MAPI interface. So one for all users and all purposes.

Give DefaultMail (http://windowsxp.mvps.org/defaultmail.htm) a try as this at least has a convenient way to change the MAPI default and introduces a per-user default MAPI policy.