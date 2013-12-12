---
author: admin
comments: true
date: 2009-11-24 10:53:23+00:00
layout: post
slug: when-unique-isnt-really-unique
title: When unique isn't really unique
wordpress_id: 74
categories:
- Programming
- Web Development
tags:
- php
---

Sometimes, an auto-generated number isn't enough and what you really need is a unique identifier. Several people have different techniques for generating their unique identifiers. My favorite has been generating a random number and then hashing it through the md5 hash generator. Here's an example I was once using:

    
    <?php $unique_identifier = md5(rand(100000, 999999)); ?>


The problem with this is that I have given an allowance for only 899,999 possible values. I didn't realize my error until I started getting mysql integrity check errors for a unique column that stored that value.

I reverted to using a more elegant solution:

    
    <?php $unique_identifier = md5(uniqid(rand(), true)); ?>


The _uniqid_ statement generates a globally unique identifier with a _rand()_ prefix and using much more entropy (_true)._
