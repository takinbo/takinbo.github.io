---
author: admin
comments: true
date: 2011-09-02 15:01:58+00:00
layout: post
slug: not-using-ssl-why-not
title: Not using SSL? Why not?
wordpress_id: 200
categories:
- Computer Security
---

First and foremost, if you're collecting sensitive information from your Internet users (sometimes even a username and password could be deemed very sensitive) and aren't using SSL, you're doing it the wrong way and potentially exposing your users to all sorts of security risks. I've also heard about administrators complaining about how costly it is to get SSL certificates these days - yes that could be excusable but not anymore. Some people use [self-signed certificates](http://en.wikipedia.org/wiki/Self-signed_certificate) but I generally advise against it unless you have educated (or savvy) users - browsers don't help much with the intense warning they emit when a user attempts to visits such a site and that's because the browsers don't trust the certificate - anyone could forge one.

Well the good news is that you can get a recognized certificate for your server for free. An amazing company called [StartCom](http://www.startcom.org/) allows you to create basic certificates that are recognized by all the major browsers for free.

Here's a [guide](https://github.com/ioerror/duraconf/blob/master/startssl/README.markdown) on how to go about the process.

Oh and if you ever needed higher class certificates (Class 2/3) or even Extended Verification (EV) certificates, they've got them and it will only cost you about a tenth of what it would cost to get the same certificate type from other vendors. Do check them out.
