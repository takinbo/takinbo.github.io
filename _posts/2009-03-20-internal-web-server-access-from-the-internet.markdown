---
author: admin
comments: true
date: 2009-03-20 00:09:31+00:00
layout: post
slug: internal-web-server-access-from-the-internet
title: Internal web server access from the Internet
wordpress_id: 17
categories:
- Web Development
tags:
- Apache
- Linux
- SSH
---

Here's the synopsis, I have a web development machine that has a NAT connection to the Internet and what that means is that I cannot access the machine directly from the Internet. So if I wanted a friend or colleague to test my work or say I'm at someplace remote and want to be able to view my web application, that will not be possible. However, using some techniques (which I will describe in this post), you can actually make this machine accessible on the Internet.

Here are certain assumptions:



	
  1. You are using Windows XP or Vista as your local machine.

	
  2. You have a Linux/UNIX host as your remote machine.

	
  3. You are using the Apache web server on both machines.

	
  4. You have basic Linux/UNIX administration skills.

	
  5. You're comfortable with basic level Apache configuration and know what .htaccess is.




## Step 1


First of all, we will be using a technique known as SSH port forwarding. This makes it possible to have an SSH server that has a public routable address (public IP) to forward an arbitrary port number to our local machine. For this demonstration, I chose to forward port 8080 on the remote machine to port 80 on my local machine.

SSH servers by default are now being configured in such a way that this _forwarded port_ is only accessible from within the remote machine (AKA localhost). In order to ensure that this _forwarded port_ is accessible to any machine connecting from the Internet, you need to tweak the settings of the SSH server running on the remote machine.

Simply edit the _/etc/ssh/sshd_config_ (the path may be different) file on the remote machine and comment out the line _GatewayPorts no_. Change the value from _no_ to _yes_. Save the file and reload the SSH server.


## Step 2


Next on your local machine, you will need to create the SSH tunnel to the remote machine. This can easily be done using the plink application in the PuTTY suite of applications. Please visit [http://www.chiark.greenend.org.uk/~sgtatham/putty/](http://www.chiark.greenend.org.uk/~sgtatham/putty/)

Simply launch the plink application from your command prompt using the following syntax:

`
plink -R %REMOTE_PORT%:%LOCAL_IP%:80 %USERNAME%@%SERVER_ADDR%
`

%REMOTE_PORT% is the remote port you wish to forward. In my case it was 8080.
%LOCAL_IP% is your local machine's IP address. In my case, I simply used the localhost IP - 127.0.0.1
%USERNAME% is your username on the remote machine and %SERVER_ADDR% is either the IP address or hostname of the remote machine.

Once you've logged in, the port on the remote machine is forwarded to your machine. If your web server is running on a port different from 80, change the syntax accordingly.

You can test connectivity by going to http://%SERVER_ADDR%:%REMOTE_PORT%/. This should display contents from your local web server. If you wish to simply use this, you're fine but if you want something cleaner and more invisible, then you'll want to proceed.


## Step 3


Next step is configuring your hosting account (a subdomain will be best) to proxy requests to your local machine's web server.

Create your subdomain and navigate to the document_root of that subdomain. Edit/create a .htaccess file and put the following into it.

`
RewriteEngine on
RewriteRule ^(.*)$ "http://%DOMAIN%:%REMOTE_PORT%/$1" [P,L]
`

Here, %DOMAIN% is either localhost or your domain/subdomain (which of course should have previously been configured to point to the remote machine), %REMOTE_PORT% is the remote port configured on the remote machine. The _magic_ being performed here is done by the [P,L] directive that proxies any requests to the local machine through the tunnel accessible from the remote port. The $1 parameter passes on any url parameters to the local web server.

Once this has been completed, visiting http://%DOMAIN%/ will bring up content from your local machine. This is made possible by virtue of the proxy features in the Apache web server.


## Step 4


This final step is only needed if you intend to be able to log the original ip address the request came from before the proxying was done.

This involves modifying your local machine's web server configuration.

Simply locate the VirtualHost or main configuration section in the Apache configuration file and add this:

`
LogFormat "%{X-Forwarded-For}i %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" proxylog
CustomLog logs/custom-access.log proxylog
`

This directive is a modified combinedlogs directive to use the HTTP_X_FORWARDED_FOR header parameter instead of the IP address in logging the request.

Save the file and reload/restart your web server.
