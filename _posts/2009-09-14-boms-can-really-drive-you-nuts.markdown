---
author: admin
comments: true
date: 2009-09-14 19:40:18+00:00
layout: post
slug: boms-can-really-drive-you-nuts
title: BOMs can really drive you nuts!
wordpress_id: 50
categories:
- Programming
tags:
- unicode
---

A BOM is an acronym for **byte-order mark** and is essentially used to tell the type of encoding of a data stream or file without having to explicitly specify it (for instance, through the content-type header in HTTP response).

I'd been having a particular issue with an API I built for a web application I'm managing and I just couldn't figure out what was wrong until I got to using the API in an application that had HEX output.

So I put the application in debug mode and watched the communication stream. The API was supposed to return an integer value but instead, I noticed a _EF BB BF_ hex sequence being prepended in the output. All attempts to remove this were futile.

Since I used the Symfony framework for the application, I suspected that it might be a bug and googled for a solution. The best answer I could get was to upgrade the framework, which I did but the problem persisted.

My big break came when I attempted to make another API call to a separate method that resulted in the correct output. While tracing the source of the problem, I traced it back to a php file that was incorrectly saved in the UTF-8 character encoding format; which was included when making the buggy API call. Opening and saving this file in ANSI format solved the problem.

So next time you run into a problem like this, make sure to check the encoding of your source files. Better still, you can use a tool like [iconv](http://en.wikipedia.org/wiki/Iconv) to convert your files to the appropriate character encoding format.
