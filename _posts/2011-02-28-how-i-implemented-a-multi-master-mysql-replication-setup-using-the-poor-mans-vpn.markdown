---
author: admin
comments: true
date: 2011-02-28 05:23:46+00:00
layout: post
slug: how-i-implemented-a-multi-master-mysql-replication-setup-using-the-poor-mans-vpn
title: How I implemented a multi-master MySQL replication setup using the poor man's
  VPN
wordpress_id: 188
categories:
- Systems Administration
---

### The folks at [my company](http://www.timbaobjects.com/) and I recently deployed a web application for a client. During initial discussions, we were made aware of the fact that most of the users of the application will be accessing the app from one location. We couldn't have the application hosted in-premises because there were components of the app that needed to be online all the time and accessible from the Internet. Given the conditions under which hosting the application in-premises will be subjected to, we decided to have the app hosted on a VPS. Performance, however was key and given that the location was likely to have a poor Internet connection, we then decided to have two servers - one for the version that was hosted externally and another for the in-house version. Since the application was essentially the same, we didn't have to create two application versions but synchronizing the databases was going to be key.


Up until now, I had never implemented a MySQL replication setup before and knew only about one-master-multiple-slaves-type replication using MySQL. I was planning of using PostgreSQL for the multi-master replication setup until I discovered a way to implement [multi-master replication in MySQL](http://capttofu.livejournal.com/1752.html).

This setup works on the premise that both machines are able to "see" each other - meanining I can connect to the MySQL instance running on each of the machines from the other. In our scenario, we were dealing with a server that was on the Internet (which the local server didn't have any problems connecting to) and another server that was behind a firewall at the client location - which meant that the Internet server was incapable of connecting to the MySQL instance on the local machine. Also in this case, port forwarding was not an option.


### Solution


SSH tunneling is fondly called the poor man's VPN because with it, you can setup tunnels that will allow you gain access to services running on a local server from the Internet. With a simple:

`ssh -R 8000:localhost:8000 username@remoteserver`

Issued from a local machine to a remote server with an Internet reachable IP address, a service hosted locally on port 8000 finally becomes accessible from the remote machine. In the case of making MySQL running on a local machine accessible from the remote server, this can be accomplished by using the syntax:

`ssh -R 3307:localhost:3306 username@remoteserver`

and now you can connect to it from the remote server:

`remoteserver username$ mysql -h localhost -P 3307 --protocol=TCP`

It's sometimes essential to specify the connection protocol as MySQL tends to use the UNIX pipe to connect to MySQL by default and that would mean that it will connect to the MySQL server running on the current machine irregardless of the -P option.

I configured [autossh](http://www.harding.motd.ca/autossh/) to automatically connect to the remote server on startup and reconnect if the connection gets severed for any reason. Because of the unstable Internet connectivity, I configured a cronjob to always attempt to connect to the remote server in the event that it's unable to do so at startup.

What was left, was to configure the right master settings for each of the servers. The only difference was the addition of _**master-port**_ in the mysqld configuration file to specify which port to connect to the master. In the mysqld configuration file for the remote server, I set master-port to 3307 and master-host to localhost. On the local server, I configured master-host also to localhost and master-port to 3307. This was for the sake of consistency. So I was able to do this because I had created a tunnel linking port 3307 on the local machine to port 3306 on the remote server and port 3307 on the remote server to 3306 on the local server.

**Remote server mysqld configuration**
`
auto_increment_increment = 10
auto_increment_offset = 1
master-host = localhost
master-port = 3307
master-user = <replication user>
master-password = <replication password>
`

**Local server mysqld configuration**
`
auto_increment_increment = 10
auto_increment_offset = 2
master-host = localhost
master-port = 3307
master-user = <replication user>
master-password = <replication password>
`

After this setup and sorting out some replication-related issues, both servers started synching with each other and it performs pretty well even with a 128k link and with lots of activity on both servers. The only issue I've had is with the timestamp fields, they seems to always have the same minute (e.g. 10:02, 23:02, 13:02) and I've not been able to figure out why.

Are there other (better) ways this could have been implemented?
