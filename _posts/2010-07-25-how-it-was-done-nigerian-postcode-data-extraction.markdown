---
author: admin
comments: true
date: 2010-07-25 09:26:46+00:00
layout: post
slug: how-it-was-done-nigerian-postcode-data-extraction
title: How it was done - Nigerian postcode data extraction
wordpress_id: 99
categories:
- Open Data
- Programming
tags:
- Nigeria
- postcodes
- python
- scraping
---

In my previous post, I talked about open data and how making the Nigerian postcode data open and more accessible has a wide potential for powering several applications. I've received several comments on Facebook with even more examples on how that data could be useful.

In this post, I would share how this extraction was done and how similar extraction scripts or scrapers could be written.

The first step in every scraping project I begin is to understand the HTTP dialog for the website I want to scrape. So I attempt to answer questions like these:



	
  1. Does the application need me to login?

	
  2. Is it sensitive to certain HTTP features like cookies or referrers?

	
  3. What urls do I access to view the content I want to extract?

	
  4. What variables can I set to change the view and specify what I want?


Determining the answers to these questions can be obtained by using tools that enable you view this dialog. I personally like to use [Firebug](http://getfirebug.com/) for this task.

[caption id="attachment_100" align="alignnone" width="300" caption="Click for a larger version"][![HTTP Dialog](/public/uploads/2010/07/http-dialog-nigeriapostcodes.com_-300x203.png)](/public/uploads/2010/07/http-dialog-nigeriapostcodes.com_-e1280048721758.png)[/caption]

After you've determined the HTTP dialog, you can then write your script to do the extraction. You can write scrapers in any language provided it has support to retrieve HTTP resources and parse HTML. The parsing aspect of a scraper is usually the most interesting part because a lot of parsing libraries choke when they encounter badly formed HTML.

In the code snippet below, I used [BeautifulSoup](http://www.crummy.com/software/BeautifulSoup/) for parsing the HTML and python's [urllib2](http://docs.python.org/library/urllib2.html) for the HTTP communication.

The code is [available on Github](http://gist.github.com/484852) and although it changes as more functionality is added, you can view the revision log of the gist to see the history of changes.
