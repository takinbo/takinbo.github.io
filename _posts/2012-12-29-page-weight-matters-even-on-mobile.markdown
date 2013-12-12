---
author: admin
comments: true
date: 2012-12-29 22:57:22+00:00
layout: post
slug: page-weight-matters-even-on-mobile
title: Page weight matters, even on mobile
wordpress_id: 255
categories:
- Mobile
- Mobile Web Development
- Web Development
tags:
- fast
- mobile
- mobile web
- performance
- speed
- web page
- web site
---

I just read Chris Zacharias' blog post on [Page Weight Matters](http://blog.chriszacharias.com/page-weight-matters), where he described his attempts of creating a Youtube Lite version (called Feather) and what his results were like. Just in case you don't have enough time to read it (even though I really suggest you do), he aimed at reading a video watch page to under 100kb and the biggest boost in traffic came from places like Southeast Asia, South America and Africa.

His post summarizes my thoughts on how web applications should be built for Africa, more especially the mobile web. In most parts of Nigeria, you would be very lucky to get a 3G connection and in my experience, surfing the web when you're out of 3G coverage can be a real pain in the butt. Why's this so? Besides the very high latencies you start to experience when you're dropped to 2.5G or 2G connections, bandwidth is highly limited. With some mobile web pages measuring up to 1MB in size, you cannot begin to imagine how long it will take for that page to be loaded. It takes an extremely large amount of patience to wait almost indefinitely for a web page to load and except the user has almost nothing to do and is just waiting for the bus to reach their destination, we would lose our users very fast. When we complain about low web usage on the continent, this is one of the reasons.

Here are a couple of tips on things you could do to keep your web pages as lean and fast as possible:



	
  * Choose light javascript frameworks - If all you need to do is a little AJAX and DOM manipulation, then use [Zepto](http://zeptojs.com/) instead of jQuery.

	
  * If the browser supports it, use server-side compression - This cannot be overstated. Even if you're unable to implement any of the other tips listed here, at the very least use this one.

	
  * Allow for proper caching of assets - The proper use of the Expires and Last-Modified headers give information to the browser on how long they are allowed to cache certain assets and encourage reuse. You should at least cache your js and css files since those ones change infrequently.

	
  * Try and keep your web pages as small as possible - If you're designing for mobile, recognize that it's better to have 10 smaller pages that load quickly than 1 page that takes a really long time to load. The ability for your user to move quickly through your web app or site will provide more user satisfaction than if they had one really large page providing every bit of information.

	
  * Recognize that size isn't everything - You can have a web page that is 1KB in size but takes 30s to generate; a 30KB web page that loads in 1s is way better. Speed matters and you should aim for 100ms or less. If your site is experiencing a lot of hits, the performance will degrade and you don't want your site slowing to a crawl.

	
  * Reduce the number of HTTP requests - Recognize that HTTP requests are expensive; latencies are not consistent. A resource may take 1s to load at one time and 10s another time. This has nothing to do with available bandwidth but network congestion and with every additional request the user's web browser has to make to fully load the page, the more pronounced the effect. Concatenate your javascript and css files to reduce the number of requests.

	
  * Defer your javascript loading - Most developers will place their external javascript script tags within the header section of the web page, except it is absolutely necessary that the javascript load before the web page is fully loaded, you should instead, place this just before the closing body tag.


There are many more tips to making your web pages load as quickly as possible, one of the best guides out there is the [Best Practices for Speeding Up Your Web Site](http://developer.yahoo.com/performance/rules.html).
