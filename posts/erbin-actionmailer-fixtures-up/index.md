---
title: "ERb’in \"ActionMailer fixtures\" Up"
date: "2009-06-16"
permalink: false
tags: ["ruby-rails", "programming-stuff", "post"]
---

I don't know if my slightly outdated Rails 2.2.2 is the problem. But unlike in the fixtures for normal unit tests, I can't use ERb for my ActionMailers templates.

Add this method to your ActionMailer::TestCase to let ERb pre-process your fixtures: 
``` ruby
def read_fixture(action) 
	a = super 
	template = ERB.new(a.join) 
	template.result(binding) 
end
```

