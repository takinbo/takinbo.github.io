---
author: admin
comments: true
date: 2010-09-23 00:20:11+00:00
layout: post
slug: installing-python-2-6-on-centos-5
title: Installing Python 2.6 on CentOS 5
wordpress_id: 148
categories:
- Programming
- Systems Administration
tags:
- CentOS
- Django
- python
---

I'm not such a fan of CentOS but I have to work with it every now and then. I recently was attempting to start deployment of a Django application and was actually amazed when I realized CentOS 5 ships with Python 2.4.

A number of utilities and apps in CentOS use the Python package that ships with it and in order not to break compatibility with those apps, it might be necessary not to upgrade the Python package.

To install Python 2.6 (which installs separately and so doesn't conflict with the original Python version), I took the following steps.

`
# wget http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/i386/epel-release-1-1.ius.el5.noarch.rpm
# wget http://dl.iuscommunity.org/pub/ius/stable/Redhat/5/i386/ius-release-1.0-6.ius.el5.noarch.rpm
# rpm -ivh epel-release-1-1.ius.el5.noarch.rpm ius-release-1.0-6.ius.el5.noarch.rpm
# yum install python26
`

And that's it. To use Python 2.6, use python26 instead of just python in your scripts or on the command line.
