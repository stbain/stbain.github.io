---
title: "The Move to Jekyll"
description: "Explaining the migration from WordPress to Jekyll static site generation during the 2020 COVID-19 pandemic, and the benefits of simplifying web hosting."
author: "Stuart Bain"
pubDate: 2020-04-15T12:51:51-04:00
tags: ["Jekyll", "WordPress", "Static Sites", "GitHub Pages", "Web Development", "COVID-19"]
category: "technical"
---


## Where have you been?

Long time, no post. I've been very busy with work, life, etc. If you notice the dates, this is the first post in years. Nobody really reads this site much, so I went ahead and decided to kind of stop updating it. For the past decade or so, I've been hosting this much-abused and ignored website on a WordPress Multi-site installation hosted on a Linux server at [Linode](https://linode.com). As many of you may know, I have been using Linux since 1996, so keeping a Linux server updated and maintaining a WordPress installation on it is right up my alley. I had most of it automated, and it really wasn't much of a hassle. In addition to my personal and side-business website, I also hosted a variety of websites for other organizations that I interact with regularly.

## What's new?

Now that the COVID-19 pandemic has forced me, along with many others, to work from home, I find myself with a little bit of time to make some changes. First off, I really don't need a full-blown WordPress site, much less a site at all. I decided to go ahead and convert my WordPress site, which is backed by a dynamic programming language (PHP) and a database (MySQL) to a static site. It's much simpler, offers far less features and interactivity, and thus no longer requires me to maintain a server with a database, backups, security updates, etc. 

There are plenty of ways to maintain and update a static website; however, I decided to do some research and come up with an alternative that would let me continue to easily add, remove, and edit content when I choose to do so. I went with [Jekyll](https://jekyllrb.com/). This software is a widely used and well-maintained static website generator written in the Ruby programming language. It has more than enough features for my use, and I am familiar with the markup languages that it can process. 

**NOTE:** Jekyll is not for everyone. It can get a little complex for people who are not used to working with text files and command line commands often. If you are looking to build a website and don't have experience with things like Linux, Vim, Markdown, etc., you may want to look into a website builder such as [Wix](https://wix.com) or [WordPress](https://wordpress.com).

For hosting, a static website requires much less horsepower, and there are plenty of alternatives available for hosting the content. I chose to take advantage of the Pages feature at [GitHub](https://github.com/). This feature of GitHub allows users and organizations to easily upload, maintain, and generate websites using the Git revision control system. Once the files are uploaded into a repository, it serves up the pages directly from GitHub with no server or programming language required.

## What does this mean?

Whether or not I will be making more regular updates or not remains to be seen; however, keeping up with the Linux server previously used to host my personal website will free up a little time. Not much (think minutes per week), but every second counts when you have a full plate. Hopefully I'll find enough seconds to add some regular content to the website.

Stay safe, all.