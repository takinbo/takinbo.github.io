---
author: admin
comments: true
date: 2010-07-24 07:53:11+00:00
layout: post
slug: nigerian-postcodes-a-case-for-open-data
title: Nigerian postcodes - a case for open data
wordpress_id: 93
categories:
- GIS
- Open Data
tags:
- LBS
- opendata
- postcodes
- scraping
---

For quite a while, the Nigerian postcode system has been operational but when you ask people to fill forms, they fill in 234 or something similar for their postcode. There's very little information available for postcodes and very little projects even use them. I will attribute it majorly to ignorance.

Why is a postcode system useful? It's essential for routing and location identification purposes. When someone specifies his street name as Adenuga Str in Lagos, is he referring to the Adenuga Str in Alausa or the one in Oremeji Ifako? With a postcode system, this ambiguity is removed because you can identify which location is being referred to. Another use is for package or mail routing or routing in general. If I need to deliver three packages to locations A, B and C. I can effeciently route those packages if I know that B comes before C and than A along a particular route. I'm talking from a logical perspective. I might not know what other industries use postcode systems to do and that brings me to the case of open data.

The open data movement is one that clamours for and encourages the sharing of data in a raw and as discrete form as possible. Why? The advantages are similar to why web applications have APIs - to enable repurposing or data reuse. If I'm using postcode data to know which hospitals are closest to which postcode locations, another project might use it for something equally or even more useful.

Postcode data (until now) has been something you could only access from a few websites - mostly the [Nigerian Postal Service](http://www.nigeriapostcodes.com/) website and a site like [AddressDoctor](http://www.addressdoctor.com/). The utility only enabled individuals to know their postcodes - very little utility I would say. However, with my effort and the efforts and inspiritation from folks like [Dipo Fasoro](http://twitter.com/dfasoro) of WangoNet (who's a strong believer and evangelist of open data) and [Kayode Muyibi](http://twitter.com/kazey) of Nairahost, we've been able to obtain this information from the Nigerian Postal Service website and convert it to a form that can be used by other applications.

Imagine the possibilities - dating websites could use the postcode to identify the location of a person and match their profiles to people in their area or ecommerce websites that could use that to batch delivery of orders. The applications are enormous. Eventually we hope to be able to map center points for each of these postcodes even increasing the utility.

The data as it is, is exactly in the form it was extracted. We've identified a number of corrections to be made and we're crowdsourcing (essentially getting interested fellows from the public) the cleanup of the data.

There's a lot of data locked up on sites like the Nigerian Postal Service and what we've demonstated with the postcode data is that this data can be put to more use if it can be made open and made available in a form that computers can use.

You can access the data that has been put on Google Fusion Tables [here](http://tables.googlelabs.com/DataSource?dsrcid=221410).
