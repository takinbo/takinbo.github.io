---
author: admin
comments: true
date: 2010-10-08 17:44:36+00:00
layout: post
slug: investigations-on-resumable-file-uploads
title: Investigations on resumable file uploads
wordpress_id: 160
categories:
- HTML5
- Mobile
- Mobile Web Development
- Programming
- Web Development
---

"Developer scratch your own itch." That's usually how it starts.

So I took a video yesterday on some flooding around the Ikorodu area in Lagos and I was going to upload it to Facebook directly from my mobile. The file was only about 40MB in size and 10% down the line and 15 minutes later, the upload failed - I'd just lost 15 minutes of time and you cannot imagine the frustration I had. I knew that if I wanted to continue this upload, I would have to start from the beginning.

I'm pretty sure this is a major issue nearly every Nigerian faces when they try to upload media to the Internet. How do we go about solving this problem? Enter resumable http requests.

So I started searching the Internet on the possibility and I met with really good results. Apparently, the Google Gears team came up with a [proposal](http://code.google.com/p/gears/wiki/ResumableHttpRequestsProposal). Unfortunately, Google Gears has been deprecated and is no longer being developed. However, Google Data APIs, support [resumable media uploads](http://code.google.com/apis/gdata/docs/resumable_upload.html), although you need a supporting client for this to work.

File uploads on the mobile or desktop browser are currently not resumable and so even if your application used a technique similar to what Google Data APIs had for resumable media uploads, you would not natively be able to support that from the mobile or desktop browser. An additional app would be required for this. Initially I thought if it were possible to have a server connected to the Nigerian Internet Exchange, media could be uploaded to this server and then there would be programs on this server that provided the service to upload these files to whatever service you wanted to have those files or media uploaded to.

However, the best option is if you could get it working directly from the browser. The problem with resuming uploads is that the mechanism you use on the browser must be able to randomly seek on the file to read any portions of that file for the upload. The only way this has been solved was using a Java applet. Solutions like [Thin File](http://upload.thinfile.com/docs/resume.php) and [Rad Upload](http://www.radinks.com/upload/plus/large.php) were the only options available until HTML5.

The HTML5 [File API](http://www.w3.org/TR/FileAPI/) provides an interface to enable several file operations to be scripted on the browser. After reading the [spec](http://www.w3.org/TR/FileAPI/) and [two](http://hacks.mozilla.org/2009/12/uploading-files-with-xmlhttprequest/) [tutorials](https://developer.mozilla.org/en/Using_files_from_web_applications) on the use of the File API, I got to say I'm very optimistic of a solution.

Essentially my attempt will be to write a helper methods or middleware that would enable an application handle resumable uploads and also work on Javascript that provides an interface to either send files in chunks to the server or attempt resumption of the file uploads from where they stopped in the event that there's a connectivity failure.

I'll like to encourage a discussion on how you might go about solving this as a developer or if you have any suggestions on this proposed solution.
