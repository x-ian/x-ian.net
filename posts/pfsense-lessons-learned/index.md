---
title: "pfSense: Lessons learned"
date: "2012-01-29"
permalink: false
tags: ["admin-stuff", "post"]
---

In my current role as the 'IT guy' for [Partners In Health](http://www.pih.org/) I'm also managing the whole IT including our networks in [Malawi](http://www.pih.org/pages/malawi/) (note: It is only a rumor that 'IT guy' translates to everything that has a power plug...). We not only provide Internet access to our employees, but also for the government including the local Ministry of Health. As our project has grown a lot in the last few years, so did the numbers of computers that are connected to the network.

Currently we are have connect 20+ access points and with this roughly ~100 devices are connected to the network every day (designed partially on top of [this](http://x-ian.net/2011/04/18/wifi-performance-faq/)). And all of them squeeze through our tiny satellite link. We came a long way with adding network management tools and traffic shaping to manage the scarce bandwidth better, but at the end we also depend on the fairness of the users: If someone (or his/her system) is misbehaving, it impacts everyone else. With this it is crucial to know who is using the network and how: Welcome to the world of [pfSense](http://pfsense.org/).

Throughout the upcoming months some of the important lessons learned and findings are shared here. This will include topics like

- Deployment
- [Email notifications](http://x-ian.net/2012/02/01/pfsense-sending-emails-through-gmail/)
- Traffic limits
- [Active Users](http://x-ian.net/2012/02/07/pfsense-shows-users-last-connected-to-captive-portal/) & Accounting
- Bandwidth Management / Traffic shaping
- [Captive Portal self registration with custom portal page](http://x-ian.net/2012/02/14/pfsense-self-registration-for-captive-portal/)
- Basic HTTP filtering based on time of the day
- Monitoring

With all this I guess we may run one of the biggest (if not \_the\_ biggest) freely available public hotspot in Malawi. I like my work in the low-resource settings...
