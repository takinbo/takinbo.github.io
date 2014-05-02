require 'active_support/all'

class Post < Thor
  include Thor::Actions

  desc "new", "Creates a new post"
  argument :title
  def new
    date = Time.now.strftime("%Y-%m-%d")
    create_file "_posts/#{(date + '-' + title).parameterize}.md", <<-eos
---
layout: post
title: #{title}
slug: #{title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}
date: #{date}
categories:
tags:
comments: true
---

    eos
  end

end
