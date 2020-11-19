---
title: "Gboard: Arduino-compatible board with integrated GSM/GPRS"
date: "2013-02-11"
permalink: false
tags: ["programming-stuff", "post"]
---

With my [recent](http://marsmonitoring.com) [work](http://www.marsgeneral.com) (aka pet project) on embedded systems mainly based on Arduino I finally came across an Arduino board with built-in GSM/GPRS connectivity. Getting an Arduino with an GSM/GPRS shield is pretty straight forward, but if the device is meant to be strong and durable, these shields don't feel good.

[Itead's Gboard](http://imall.iteadstudio.com/im120411004.html) does. And it is also pretty cheap; definitely cheaper than e.g. the ordinary [Arduino Uno](http://store.arduino.cc/ww/index.php?main_page=product_info&cPath=11_12&products_id=195) with a [GSM/GPRS shield](http://www.seeedstudio.com/depot/gprs-shield-p-779.html) from Seeedstudio.

However. The Gboard is "Arduino-compatible" and as such I was expecting a few hiccups to get it up and running. And as usual _a few_ turns quickly into _a lot_. So let's have a look.

**Jumpers**

Like most communication boards the GSM chips is connected through a serial port. But the Gboard just like the Arduino Uno only has one. And this one is also used for programming purpose. In order to use both programming and GSM connection, make sure jumpers are set to ST-D2 and SR-D3 ('Software UART to SIM900, Hardware UART to Specific').

**Programming connection**

Just like the [Arduino Ethernet board](http://arduino.cc/en/Main/ArduinoBoardEthernet) (and others) the Gboard doesn't have its own USB connection. So a 'FTDI-style basic USB-to-serial board' is required. But unfortunately the ones from Adafruit or Sparkfun don't work out of the box. First you need to be careful as the boards from Arduino itself require 5 Volts. But the FTDI connection on the Gboard only takes 3.3 Volts. Don't mix this up! Additionally the wires aren't compatible. It seems best to spend the few additional dollars to get the dedicated [FOCA board](http://imall.iteadstudio.com/im120525005.html) from Itead. But of course this removes the fun of tinkering and I wanted to reuse my existing programming board. Connecting GND, DTR, TX, and RX with dedicated wires does the trick (I had to swap the TX and RX connections). In order to power up the board either a 3.3V connection is required, or simply remove the VCC connection at all and power the Gboard through an external power supply.

**External power source**

If you need to test the GSM features, make sure you have an external power source connected. Just because the lights go on with a FTDI connection doesn't make the GSM chip work.

**Digital ports**

The connections of the Gboard differ quite a bit from the default Arduino layout. In particular the board doesn't list any digital ports; just connections labeled with A0 to A7. But in the Arduino world the first 6 analog ports can be used as digital ones as well. Address them by starting from digital pin 14 for A0. The interface on the Arduino is called 'Electronic brick interface' and it seems to be used in other boards as well. So there are pre-made 3 pin connections with sensors available. But as long as you connect +, -, and Signal in the proper way, most other sensors will work too.

**Arduino IDE**

I assume other options might work as well, but for me the board 'Arduino Duemilanove w/ ATmega328' and Programmer 'Arduino as ISP' did the trick. Sometimes an upload to the board fails, but most often a single repeat will be successful.

If it still doesn't work, consider this [trick](http://stackoverflow.com/questions/19765037/arduino-sketch-upload-issue-avrdude-stk500-recv-programmer-is-not-respondi) by pressing the Arduino RST button at the right point in time.

**GSM/GPRS features**

Finally there is a [dedicated lib](https://github.com/jgarland79/GSM_Shield) to ease the use of the GSM chip. I assume sending AT command straight to the soft serial port will work as well, but I haven't tried it. But even though the lib claims it is compatible with the Arduino 1.x IDE, it didn't work in my environment. I had to do a couple of tweaks to the lib (but I don't remember every single step). Steps like removing newsoftserial from lib folder and adding '#include' in GSM\_Shield.cpp.

**Driver hiccups**

Sometimes, especially under Windows it seems as if the wrong drivers are taken for the FTDI communication. Check [here](http://www.developergarden.com/de/forum/?tx_mmforum_pi1%5Baction%5D=list_post&tx_mmforum_pi1%5Btid%5D=1596) to see get an idea of the correct ones. Note that installing the correct driver might fail as a wrong one is somehow blocking it. Follow [FTDIs uninstall instructions](http://www.ftdichip.com/Support/Utilities/CDM_Uninst_GUI_Readme.html) and try re-installing the driver again.
