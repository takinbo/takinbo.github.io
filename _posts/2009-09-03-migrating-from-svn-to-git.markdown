---
author: admin
comments: true
date: 2009-09-03 06:25:02+00:00
layout: post
slug: migrating-from-svn-to-git
title: Migrating from SVN to GIT
wordpress_id: 37
categories:
- Programming
tags:
- git
- migration
- scm
- svn
---

One of the big benefits of using source code versioning (or source code management systems) is that it allows you to maintain a history of all the changes in code and allows for easy collaboration amongst several developers on the same code base. SCMs will allow you answer the following questions:



	
  1. Who made what change

	
  2. What change was made

	
  3. When was the change made


If you happen to have a number of developers and you're working on the same project (even if you're the only developer, this helps) you like to know when a change to the source code breaks the application (this happens alot). Not only that, having an SCM allows you to easily revert that change. This post is not about SCMs but I thought it necessary to provide a little background information.

I recently started using git and have really loved it (although it's not perfect, it does the job well). I prefer git over subversion (svn) for a major reason that it is distributed: does not require a connection to a server in order to commit to the repository.

Recently, I thought about migrating my svn repositories to git and I found a wonderful resource for that [here](http://www.simplisticcomplexity.com/2008/03/05/cleanly-migrate-your-subversion-repository-to-a-git-repository/). I'm not going to attempt to republish what has been said there here. Instead just point out a couple of things I had to do differently.

First of all, depending on the way your git is installed, these are basically the commands to run:

` git svn init svn://server/repo/trunk/ --no-metadata
git config svn.authorsfile /path/to/svn-authors
git svn fetch`

The difference here is to use _git svn_ instead of _git-svn_. Also, if you happen to have _blank_ authors (as I had in mine), then your svn-authors file should contain an entry similar to this:

`(no author) = Firstname Lastname <emailaddress>`
