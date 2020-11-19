---
title: "Your very own SMS - Internet gateway with Arduino"
date: "2012-10-09"
permalink: false
tags: ["programming-stuff", "post"]
---

There are [plenty](http://www.clickatell.com/) of [SMS](http://nexmo.com/) [services](http://www.twilio.com/) on the web to link SMS and the Web together. However especially if you need a local SMS number in an unsupported country like Malawi or simply want to DIY, then this [Arduino](http://arduino.cc/)\-based solution might be your right choice. For sure you could also go big-scale with your own full-blown SMS gateway like [Kannel](http://kannel.org/). But where is the tinkering fun?

Combining an Arduino [Uno](http://store.arduino.cc/eu/index.php?main_page=product_info&cPath=11_12&products_id=195), a GSM/GPRS shield like the one from [Seeedstudio](http://www.seeedstudio.com/depot/gprs-shield-p-779.html), and an [Ethernet shield](http://store.arduino.cc/eu/index.php?main_page=product_info&cPath=11_12&products_id=197) is all you need besides a SIM card. Now simply stack everything together and upload this Sketch.

**Process incoming SMS** Depending on your requirements you might want to modify the code. E.g. one obvious case would be an SMS-to-Email forwarder, but for the typically free email service like gmail.com the Arduino lacks resources and power to process their TLS/SSL security. But other ways are possible. The code is already prepared to post an incoming text message right into a Google Spreadsheet with a way described on [open-electronics](http://www.open-electronics.org/how-send-data-from-arduino-to-google-docs-spreadsheet/). Or you could notify your own web app with a custom HTTP request. Or simply forward the incoming text message to another mobile number. Or what else can you think of?

As the SoftwareSerial library is used the code also inherits its default buffer size of 64 bytes. Not too much even in the context of SMS. Better patch the Arduino code (argh!) and increase it to something like 128 bytes as I've done. Still not the full size of a SMS, but enough for my purpose. Carefully check the [documentation](http://www.seeedstudio.com/wiki/GPRS_Shield#SoftwareSerial_library_Notes) - it can save you days!

**Process incoming HTTP requests** For the opposite way of sending text messages to mobile phones from the Internet you could use a provider specific solution. E.g. some (many?) providers offer email addresses like @smsmail.eplus.de. Every incoming mail is forwarded to the corresponding text phone as a text message. Just check if you can find information about your [specific provide](http://www.makeuseof.com/tag/email-to-sms/)r. But in case where your provider doesn't provide this solution, or you need to find a generic way across different providers, or you want to do it via HTTP requests rather than emails, this Arduino Sketch can also be used.

As the sketch will run a little local HTTP server, you might need to change the current IP (192.168.1.177) to fit your needs. Once the system is available in the local network you can use a simple HTTP post to send out a text message, e.g. with curl:

`curl --data "number=&message=innovative message" 192.168.1.177/sendsms`

Of course you should protect the access to it as otherwise you might invite hitchhikers to misuse your airtime.

[Feel free to have a look and use this code the way you want.](https://github.com/x-ian/arduino-sms-internet-gateway)

Note that the code uses the [SimpleTimer library](http://www.arduino.cc/playground/Code/SimpleTimer) so make sure this is installed locally first.
