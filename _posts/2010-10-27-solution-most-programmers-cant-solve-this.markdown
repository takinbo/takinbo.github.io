---
author: admin
comments: true
date: 2010-10-27 16:13:42+00:00
layout: post
slug: solution-most-programmers-cant-solve-this
title: 'Solution: Most programmers cant solve this'
wordpress_id: 170
categories:
- General
---

In my [previous post](/2010/10/24/most-programmers-cant-solve-this/) on this, here's my solution (written in Python):



Like I explained in the previous post on this matter, the most important thing to note is that "divisibility" is determined using the modulus operator.

If **x** is divisible by **y**, then **x mod y** is equal to **0** (zero). In python, the modulus operator is represented by '**%**'. Hence **(not i % 5)** returns True if i is divisible by 5.

The second thing to note is that you need to check for the condition where the number is divisible by both 3 and 5 first, before testing individually for either 3 or 5. The reason might not be that obvious but if you test if it is divisible by 3 first, it will pass and skip the condition where both tests are true. Same also applies for testing for divisibility by 5.
