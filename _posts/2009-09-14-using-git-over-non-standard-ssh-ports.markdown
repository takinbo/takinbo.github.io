---
author: admin
comments: true
date: 2009-09-14 13:01:46+00:00
layout: post
slug: using-git-over-non-standard-ssh-ports
title: Using Git over non-standard SSH ports
wordpress_id: 43
categories:
- Programming
- Web Development
tags:
- git
- SSH
---

I've configured some deployment servers to use SSH over non-standard SSH ports and that can really be a problem when you want to use that with git. No matter what you do, git would always attempt to connect through the standard SSH port 22.

There was really no point in scratching my head and trying to pull my hair out in order to fix this. So I googled a solution. This [post](http://infovore.org/archives/2008/10/13/pulling-from-git-over-a-non-standard-ssh-port/) gave me a hint but wasn't helpful enough so I decided to write a blog post on how to go about solving this.

You'll have to configure your repository in your _.ssh/config_ file. Here's an example. Simply substitute the _#*#_ placeholders for the actual values


    
    
    Host #hostname#
      User #username#
      Hostname #hostname#
      Port #non-standard port#
    



And if you prefer to use private keys to login:


    
    
    Host #hostname#
      User #username#
      Hostname #hostname#
      Port #non-standard port#
      PreferredAuthentications publickey
      IdentityFile "#path_to_private_key#"
    
