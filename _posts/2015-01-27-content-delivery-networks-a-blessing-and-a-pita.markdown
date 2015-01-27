---
layout: post
title: content delivery networks - a blessing and a PITA
slug: content-delivery-networks---a-blessing-and-a-pita
date: 2015-01-27
categories:
tags: dns, cdn
comments: true
---
UPDATE: added screenshots of name lookups and traceroutes

Content Delivery Networks (CDNs) are designed in such a way that content retrieval is routed to the closest server to you. This, in general, should make for faster downloads. How does the CDN know which server to present for content retrieval? This is usually done during the name lookup phase of the request.

Say you wanted to retrieve content from `d1u2s20mo6at4b.cloudfront.net`; your browser will ask the network for the IP of that address. Depending on how your name resolution is setup, you can have varied results. For most people who use the default name servers that their ISPs give them, you *should* be fine. For me, it was more interesting. You see, I don't normally use the default name server settings; I use [dnscrypt.eu](https://dnscrypt.eu/) for my name resolutions; so you can imagine the surprise I had when I noticed downloads from the [CloudFront](https://aws.amazon.com/cloudfront/)'s CDN were quite slow; after further investigations, I noticed that for some reason, CloudFront was giving me a server located in Singapore to retrieve content from.

![name lookup results](/public/uploads/2015/01/name-lookups.jpg)

![traceroute of cloudfront singapore server](/public/uploads/2015/01/cf-sin-traceroute.jpg)

Now I live in Lagos, Nigeria and so it made no sense that I would be downloading content from a server in Singapore when Europe is closer to me and would get better download speeds. After close inspection, the culprit ended up being my name resolution service provider - dnscrypt.eu. Although having servers in Europe, for some odd reason, CloudFront thinks the closest servers are in Singapore. By simply switching to a public DNS like [Google's](https://developers.google.com/speed/public-dns/) (or even using the default provided by my ISP), I was able to download faster from a server in Frankfurt and then later in London.

![traceroute of cloudfront paris server](/public/uploads/2015/01/cf-cdg-traceroute.jpg)