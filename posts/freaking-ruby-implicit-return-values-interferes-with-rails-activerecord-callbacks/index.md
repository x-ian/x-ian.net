---
title: "Freaking Ruby implicit return values interferes with Rails ActiveRecord callbacks"
date: "2012-10-25"
permalink: false
tags: ["ruby-rails", "programming-stuff", "post"]
---

I just need to rant that (again) I run into a problem with unexpected side-effects of the usually neat feature of implicit return values in Ruby. This (although not really obvious) feature always [returns the value](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls#Return_Values) of the last executed statement in a method as a return value. But this isn't always as obvious as it sounds. This can cause strange side-effects.

As an example take the Rails callbacks for ActiveRecord. These callbacks like :before\_create are typically used to handle data validation. Thus if they return 'false', the process to save the record is canceled.

But now instead of validation you want to ensure that certain other attributes are automatically set depending on other attributes; maybe even boolean attributes like in this block:

``` ruby
class Message < ActiveRecord::Base 
	belongs_to :probe 
	attr_accessible :probe_id, :value1, :value2, :probe_enabled

	before_create :set_probe_enabled 
	private def set_probe_enabled 
		self.probe_enabled = self.probe.enabled? true 
		# if only this would have been obvious... 
	end 
end
```

Here we simply want to set the boolean attribute enabled? depending on the value of the enabled attribute of the associated probe. Obviously the probe.enabled? can either return true or false. Unfortunately in case of false the whole statement ' self.probe\_enabled = self.probe.enabled?' returns false. And if this is the last statement being executed, the whole method will return false. And a false in such a callback will cancel the creation of the object...

Take-away lesson: Pay attention to implicit return values especially in Rails ActiveRecord callback methods when dealing with boolean values.
