---
author: admin
comments: true
date: 2009-09-25 07:57:33+00:00
layout: post
slug: using-git-hooks-to-check-syntax-errors
title: Using git hooks to check syntax errors
wordpress_id: 53
categories:
- Programming
- Web Development
tags:
- drupal
- git
- php
---

Git is currently my favorite source code versioning tool and while I used Subversion, I knew about something called hooks that I never used.

Essentially, hooks allow you to execute custom scripts when you perform certain actions on your repository like committing files, pulling updates and so on. This is a very useful as you can write hook scripts to (say for example) automatically ftp a file to your web server when a change has been made.

A whole lot of really cool hook scripts have been written and if you use any code versioning tools, you should check out the ones that have been written for the tool you use.

In particular, I find that sometimes developers could check in code that has syntactic bugs. This happens in environments where there are no strict code testing rules. It can be really annoying when you or someone else does this and you have to fix that and then commit again... not professional at all. So I came across [this post](http://phpadvent.org/2008/dont-commit-that-error-by-travis-swicegood) by Travis Swicegood that lists code that does a php lint on your PHP files before committing them to the repository. PHP lint (php -l) basically checks the syntax of your code and either gives an "ok" or prints the offending line.

For one of the projects I'm working on, I had to change line 11 of Travis' code to read:

`$filename_pattern = '/\.(php|engine|theme|install|inc|module|test)$/';`

instead of

`$filename_pattern = '/\.php$/';`

If you've done Drupal coding, you'll quickly recognize that :)
