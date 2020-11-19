---
title: "WiFi Performance FAQ"
date: "2011-04-18"
permalink: false
tags: ["admin-stuff", "post"]
---

I'm by no means an expert in WiFi network planning and installation, but over the past year I have collected some knowledge and best guesses on how things work in terms of performance. Here is an open call for everyone to correct my views and not so obvious elements that impact the speed of your wireless network.

**Which 802.x standards are relevant?** - 11a on 5 GHz; almost unused - 11b on 2.4 GHz; nominal up to 11 Mbit/s, effectively max 600 Kbyte/sec - 11g on 2.4 GHz; up to 54 Mbit/s, effectively max 3 Mbyte/sec - 11n on 2.4 GHz and 5 GHz; some devices only follow the draft spec and not the final one (impact?)

**Which standards has the best coverage/signal range?** Unclear. In general 5 GHz signals have a reduced signal range due to its higher frequency, but as 11n sends with higher power, the standard claims that the range is extended compared to 11b/11g.

**What are sources for Non-WiFi interference?** Technically everything in the license-free 2.4 GHz and 5 GHz frequency bands like Bluetooth, Microwaves, Babyphones, Wireless Video Transmission adapters, Amateur radio, Walkie-Talkies.

**Is WiFi using a shared medium?** Yes, kind of similar to a BNC or "hub-ed" ethernet every participant needs to share the same medium. Therefore the more traffic is seen on the medium or the more clients are using it, the more likely are collisions and therefore re-transmissions. Minimizing shared access to this shared medium is one element of improving WiFi network performance. In other words wireless is a shared medium, meaning that all clients and neighboring APs compete for the same limited bandwidth, in addition, each client’s speed varies depending on the protocol it is running (802.11 a/b/g/n) and the signal strength, interference and noise it is experiencing.

**Which channels for 11b/11g are available?** In the US 1 - 11; in Europe 1 - 13; in Japan 1 - 14 (14 only for 11b, note that channel 14 is not linear therefore channel 10 and 14 are completely non-overlapping). The availability of different channels will depend on the device and maybe the country setting. So channels 12+ are not guaranteed to be fully functional. However it might be worthwhile to configure backbone links to this unusual channels (even though it might be against local law). This leaves 4 channels (instead of the typical 1, 6, 11), namely 1, 6, 10, and 14 as (almost) non-overlapping channels.

**Airtime consumption / utilization** A wireless frame transmitted to or from a client connected at a low data rate may utilize 10 milliseconds of airtime, whereas it may take only 100 microseconds for a client connected at a high data rate. Even though the high speed client could have sent 100 frames in the time the slow client takes to send one frame, the fast client still has to compete fairly for the airtime on a frame by frame basis, so it spends most of its time sitting idly waiting for the slow client to finish so it can have another chance to transmit. Unfortunately this means that a single low speed client can slow down all of the other clients on the WLAN.

**What is the impact of client connected with poor signal strength?** As explained with the airtime consumption slow clients consume more airtime to transfer a given amount of data, leaving less airtime for other clients, decreasing network capacity and significantly degrading the performance of all clients on the network.

**What is a poor signal and how to detect it?**

RSSI: over -50 perfect, below -85 unusable

Noise: from 0 bad over 90 very good to -120 none

SNR: higher is better 25 min requred for full 54mbps link 40 dB Excellent signal strength 25-40 dB Very good signal s 15-25 dB Low signal 10-15 dB Very low signal 5-10 dB No signal strength

For the Voice you need a minimum -25 dB

In OS X option-mouseclick on WiFi icon to see stats of connected network. Open Performance windows of Wireless Diagnostics to track signal strength over time.

**What is the Basic Rate?** Depending on client device and signal strength the AP and client are handshaking about the maximum available performance. The farther away a client is from the AP (read the weaker the signal), the lower is the Basic Rate. 802.11g supports rates of 6, 9, 12, 18, 24, 36, 48, 54 in addition to the 802.11b rates of 1, 2, 5.5 and 11Mbps. These can be seen e.g. with inSSIDer. A client can fall back to lowest basic rate to save energy or to increase link stability.

**Will one client with a low basic rate slow down other clients?** Depends. If the client is not busy than there shouldn't be a big impact. But if the far away client is busy transmitting and receiving many connection drops and re-transmissions, the whole shared medium air should be congested. Additionally the latency should be higher, so that errors are detected later. In these cases even closer clients with a high Basic rate should suffer.

**What is the maximum number of concurrent connected clients to one AP?** Numbers seem to vary quite a bit. There are some Enterprise-devices which limit the number of connected clients to 10. Consumer APs seem to be more open, but the performance will suffer as all of them are talking on the same channel. Looks like above 20 is unreasonable.

**What happens if clients with different 802.11 standards are mixed on one AP?** If 11b clients are connected to a 11b/11g AP point or 11g clients to a 11g/11n AP it will decrease the performance. Statements vary from "just a little bit for everyone" to "bigger performance penalty" due to the compatibility mode that one AP is using for these mixed cases. It seems like if possible the mixed mode should be avoided, e.g. if still legacy 1b clients are present (most likely the case in our environments), than a dedicated AP 11b only could overcome this.

**What is the best alignment of external antennas for indoor APs?** Sometimes APs have up to 3 external antennas that can be aligned in different angles. Facing them in all three room axes is best to increase signal strength and to reduce interference. If there are less than 3 (up to none) antennas, then they will be molded inside of the case. Knowing its position might help with mounting or placing such an AP.

**Can one Wifi client bring down an AP?** To a good degree: yes. If the client is misbehaving (accidentally though wrong configs or drivers or purposely e.g. by trying to break into encryption) it can flood the shared medium air with packets. This way there will be many collision with other clients and therefore packet losses and re-transmissions. This way one client can monopolize the whole network segment.

**What impact has a client-to-client communication?** As every communication goes through the AP, the sending client first needs to send the data, which is then repeated by the AP for the receiving client. Therefore the same message goes over the air twice and leaving only half of the available throughput.

**Hiding SSIDs** Hiding SSIDs will not improve security as special WiFi clients (I refer to them as promiscuous WiFi stacks, but I'm not sure whether this is technical true) are still able to sniff transmissions within hidden SSID and extract the SSID from there. But hiding SSIDs might get rid of the beacon announcements at the basic rate. Additionally if this is used for backbone links they don't indicate the availability of an AP to ordinary users if there is no for them. On the other side a hidden SSID will not be detected by survey tools like inSSIDer and therefore make the channel planning less obvious: If your neighbor doesn't see your SSID and channel, he might be not aware of a collision.

**How to test real-world WiFi speed?** iperf daemon running on a server and iperf client on a wireless client measures the "real-world" IP performance.

**Mixing encryption** Some AP offer multiple encryption methods (like WPA2/AES and WPA2/TKIP). Even though it is supposed to work seamlessly there seem to be sometimes performance problems in the wild; especially with 11n networks. So the rule of thumb should be to not allow mixed encryption. As TKIP needs to be seen as almost broken anyways, switching to WPA2/TKIP for at least 11g networks is a good advice.

**Which features offer "enterprisey" components?** - Centrally managed through a WiFi controller - VoIP support through QoS - Roaming between multiple AP (internal roaming); helpful especially for mobile VoIP phones - Load Balancing - Ability to run AP with reduced power. This can be used to place the APs a lot closer together (higher density) while still avoiding radio interference among access points, resulting in more consistent coverage

**What is Client Isolation (sometimes called AP isolation)?** When activated an AP is blocking all client-to-client communication in his wireless network segment (is done on layer 2 through MAC addresses). Even though it seems common understanding that this doesn't have any impact on performance, it might not be the whole truth. Client-to-client communication is always happening with half of the max speed as it always goes through the AP: First the client needs to send out his message, the AP picks it up and re-distributes it in the wireless segment. Thus the same message goes over the air twice. Now for general broadcasts and Windows shares this might happen more often than expected and for this case AP isolation should block and therefore eliminate unnecessary traffic resulting in higher performance. Unsure: Will this help against tools like Firesheep in unprotected networks?

**Which tools are available to troubleshoot WiFi problems?** - inSSIDer - GPS device - Others: NetStumpler, EarthStumpler, KnsGem, Kismet - External scanners (necessary if Non-WiFi interference should be detected)

**What are Wireless repeaters or Wireless Distribution systems (WDS)?** Although the details vary both technologies can be used to increase the coverage of a WiFi area. In a nutshell they pick up a WiFi signal from another AP and re-distributes it into its area. Usually they operate (they have to?) with the same settings for channel and encryption and could also offer a roaming capability. The drawback is that it reduces the maximum speed significantly as the signal will be re-send as many times as there are repeaters or WDS with the same settings (must be so, but I could only find reference to reduce the speed once by 50%). So they can be used to easily extend the coverage, but need to be carefully chosen to not introduce more bottlenecks.

**Are multicasts in WiFi settings different than in wired settings?** From a high point of view, no. But as an AP needs to make sure that every connected client is able to receive the multicast (same for broadcasts?), it will send out multicast packets with the lowest basic rate configured for the AP. And here the airtime consumption is (much) higher (leaving lesser room for other packets) and the available maximum throughput is capped at the basic rate (making HD video broadcasting impossible).

**What is a "hidden node"?** Two Wireless clients can be connected from the opposite ends of the coverage area to an AP point. Both see the AP, but are not able to see each other. This is one of the reasons why every traffic always goes through the AP.

**What impact has the Beacon interval?** Every AP announces its presence and configurational details in the interval of the beacon. Typically every minute a broadcast is send with the lowest basic rate so that clients can pick up the details. For static backbone link there is no need to constantly announces their details so increasing the interval will reduce the number of broadcast. Unsure if turning out the SSID broadcast also eliminates the beacon at all.

**What is the ACK Timeout (Sensitivity Range)?** (todo)

**Conclusions** Keep WiFi signal locally wherever possible Don't give client access to wireless backbone links; separate backbone from enduser connections

--

May 11th, 2011 at 17:48 | #1Reply | Quote

What impact has the Polarization?

Seems like usually V-Pol (vertical polarization) is used. Although I could find some talk about H-Pol (horizontal polarization) for high density areas. For Point-to-Point you can use both as long as both endpoints are configured the same way. For a forest area between the links, H-Pol may work slightly better.

--

May 16th, 2011 at 08:33 | #2Reply | Quote

Order of WiFi signals to connect to

Looks like most Operating Systems treat the latest configured WiFi network with the highest priority. This means that it tries to connect to WiFi networks in reverse order of it’s first configuration; not necessarily to the ones with best signals strength/coverage. When having a few high power/long distance antennas and multiple local Access Point could lead to the point where even though a local Access Point with good signal is available, the system tries to connect to the low speed (due to above reasons), weak signal long distance antennas. Align the order to the ones with the most local signal first.

--

July 24th, 2011 at 11:10 | #3Reply | Quote

Interference

Wi-Fi 11b uses Direct Sequence Spread Spectrum (DSSS) (http://en.wikipedia.org/wiki/Direct-sequence_spread_spectrum). Its carrier does not hop or change frequency and remains centered on one channel that is 22 MHz-wide. While there is room for 11 overlapping channels in this 83 MHz-wide band, there is only room for three non-overlapping channels. Thus there can be no more than three different Wi-Fi networks operating in close proximity to one another.”

WiFi 11g uses OFDM (http://en.wikipedia.org/wiki/OFDM) for 54 Mbps and DSSS for 11 Mbps and is designed to reduce interference.

Question: If 11g falls back to speed 11 Mpbs and below, does it also move back to DSSS?

--

July 24th, 2011 at 11:11 | #4Reply | Quote

Bluetooth Interference

Bluetooth use FHSS (frequency-hopping spread spectrum) http://en.wikipedia.org/wiki/Frequency-hopping_spread_spectrum as an AFH (adaptive frequency hopping) technology to ensure that anti-interference robustness in the 2.4 Hz band. All the 79.1 channel with each 1 Mhz hopping 1,600 times per second.