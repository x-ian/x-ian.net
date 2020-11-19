---
title: "Making your EMR work in resource-poor settings"
date: "2012-10-20"
permalink: false
tags: ["misc", "post"]
---

Lots has been written about EMRs. Most of it for the 'developed world' and most of it indicates that there are some '[issues](http://www.kevinmd.com/blog/2012/02/emr-dirty-word-doctors.html)' in [making](http://www.slideshare.net/HealthInfoAssoc/eight-things-that-will-make-your-emr-work-for-you) it [work](http://curemd.wordpress.com/2012/05/23/making-your-emr-work/). Now how can someone think this can possibly work in resource-poor settings? Settings that constantly attract classifications like under-staffed, under-trained, under-paid, under-motivated, under-equipped?

Well, among a few others [Partners In Health](http://www.pih.org) tries. In my role as the Medical Informatics Manager for [APZU](http://www.pih.org/where/malawi/) in Malawi we took the open source medical record system [OpenMRS](http://www.openmrs.org) and were looking for ways to adapt it. Finally we could scale up and keep the system running. Even with the ongoing decentralization of clinical services when we went from 0 to 12 distributed, remote clinics and from 0 to thousands of patient records. At that time we might have had the only working EMR capturing the population of a whole District and being compliant to the guidelines for HIV services defined by the Ministry of Health in Malawi.

> First lesson: Go local

If you look for an EMR for high-volume clinics in Malawi, get in touch with [Baobab Health](http://baobabhealth.org/). They have the most complete set of tools for the health care sector in Malawi and were a constant source of inspiration.

> Second lesson: Go OpenMRS

If you still find gaps and the need for other tools, or you aren't in Malawi, check out [OpenMRS](http://www.openmrs.org). But be aware and don't see it as a ready-to-be-used system. Health care systems can be different, so are users and particular workflows. Therefore a one-size-fits-all system might fail. OpenMRS tries to address this by providing a framework for building your own EMR. But a framework doesn't necessarily address _your_ problems, _your_ workflows, or _your_ user skills off the shelf. Be prepared to adapt it. Just like for the 'western world', efficient, easy-to-use, simple, error-avoiding interfaces are the key, they are for resource-constraint environments. Maybe even more so.

> Third lesson: Know your users (and your 'stakeholders')

To make it short: The current UI of OpenMRS 1.x ... sucks. A big part of data entry is ... well ... data entry. So make this easy and fool-proof. Otherwise you have a perfect example of [GIGO](http://en.wikipedia.org/wiki/Garbage_in,_garbage_out).

- Use common sense: It is sometimes surprisingly uncommon.
- Start small and stay focused: 10 half-solved problems are nothing compared to 1 solved one.
- Make data entry error- and fool-proof.
- Say 'no'. Double question requirements from 'stakeholders' (whoever they might be) as they often have a vision beyond the scope and possibilities of your environment.
- Simplify the UI: Simple things can already help. Try to bring the number of user interactions close to the number of words you need to describe an action. If you need 25 mouse-clicks for an activity like 'transfer this patient to another clinic' in the system, then go back to point #1.

> Fourth lesson: [KISS](http://en.wikipedia.org/wiki/KISS_principle)

Well known and often referred too. But almost as many times (cluelessly) ignored. Throw away stuff were you (or someone else!) feel that it _might_ be _interesting_ after _X_ years (with X anything greater than 1) to look at _Y_. Yes, famous question of 'numbers of goats living in a household': [YAGNI](http://en.wikipedia.org/wiki/You_ain't_gonna_need_it)!

> Fifth lesson: Setting up a system initially is hard, but keep it running is even harder.

This does not only apply to an EMR, but already to a clinic itself. Often little things can decide about winning or loosing. And in almost all cases it is not about the big upfront design of the form, but how you ensure that is going to be used over time. And if it is not used, then it is useless. Especially in environments where there is so much of 'nothing'. Don't waste time and energy. There are too many variations of 'no plain paper available', 'no batteries for weight scale', 'no drugs for a certain disease' to address all of them upfront. If you design it, be part of it the first 6 months. If you can't or don't want to, don't design it!

All of this is based on a couple of years of experience living and working in rural Malawi. It might be totally different for other, yet similar places. But always take it 'one day at a time'.


--

Additional remarks:
- admitting failure (‘failure report’)
- shut up and listen (and observe!)
- donor driven instead of driven by beneficiaries
- ‘whatever it takes’ is one problem

