---
author: admin
comments: true
date: 2010-08-02 17:04:54+00:00
layout: post
slug: ubuntu-10-04-installation-caveats
title: Ubuntu 10.04 Installation Caveats
wordpress_id: 104
categories:
- General
tags:
- ubuntu
---

After the Python Africa Tour that [held in Abuja](http://python.org.ng/node/51) about two months ago, I decided to return to running Linux full time on my workstation. Up until that time, I'd been doing my development on a virtual machine running Debian Lenny.

So I shrunk my primary partition and created another partition to give Ubuntu 10.04 a trial. After running it for close to a month, I finally made the switch from Windows 7 to Ubuntu 10.04 - completely removing windows.

This post is about some of the issues I found while installing it and how I got them resolved.


### Locale settings


If you choose Nigeria for your country and Nigeria for your keyboard layout, you get a lot of cool keyboard remapping. First off, the dollar sign on a regular US keyboard is replaced with the Naira symbol ₦ :)

Unfortunately, this new locale setting which turns out to be _en_NG_ causes a lot of problems for certain applications as they cannot resolve it to something they can use. This usually affects python-based applications and scripts. Until this is fixed, here's what you could do to fix this.

You'll need to edit the file /usr/lib/python2.6/locale.py and add the following lines:

`
'en_ng':                                'en_NG.ISO8859-1',
'en_ng.iso88591':                       'en_NG.ISO8859-1',`

Between the line containing the text:

`'en_in':                                'en_IN.ISO8859-1',`

and

`'en_nz':                                'en_NZ.ISO8859-1',`


### Seekable media playback


This particular issue can really be a pain if not resolved and what happens is that using the default Totem player, you are unable to drag the seek bar to any section you want to listen to. Resolving this problem is very easy. Simply install the **_gstreamer0.10-plugins-ugly_** package.
