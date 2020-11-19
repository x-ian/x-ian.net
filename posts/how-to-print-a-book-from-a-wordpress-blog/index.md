---
title: "How to print a book from a wordpress blog"
date: "2012-11-12"
permalink: false
tags: ["misc", "post"]
---

Even in our digital world you might want to convert your wordpress blog into a paper book. Of course there are [services](http://blogbooker.com) [available](http://blurb.com) [claiming](http://blog2print.sharedbook.com) [to do so](http://lulu.com). But the ones I found didn’t match my specific requirements of

- Minor content tweaks
- Custom formatting
- Inline comments
- High resolution pictures for offline processing
- Picture captions and mouse-over labels
- DIY attitude

So after a lot of trial & error, I found out that I can

1. export the wordpress content as XML,
2. create a single page HTML file with all content locally,
3. automatically tweak some styles,
4. import the HTML into Word,
5. re-format as needed,
6. save as PDF and optionally create an eBook version.

If you want to follow my steps, you need these tools (highly ‚personalized’ and quite a bit developer-driven – it might not be the right process for you).

- Firefox & text editor
- Microsoft Word (for Windows)
- Ruby development environment with [nokogiri](http://nokogiri.org/) gem
- My [wordpress to single HTML page](https://github.com/x-ian/wordpress_to_word_to_ebook) script from github
- Optionally [Calibre](http://calibre-ebook.com/) for eBook creation

**Export the wordpress content as XML** Easily done through your Wordpress Dashboard.

**Create a single page HTML file with all content locally** Run the attached Ruby script to convert the WXR file into a single page HTML document. This is where most of the magic happens and also the most fragile part. The script is aligned to the elements I typically on my blogs and it might differ from others. But with a little bit f Ruby knowledge it shouldn't be too hard to tune this. Basically it takes the XML file, filters for the posted and published stories, tags the various elements with different HTML classes and has some processing around images to include captions and mouse-over titles. It returns the HTML on the console, so best is to invoke it like this: wordpress\_to\_single\_html.rb 'your wordpress export' > single\_html.html

Now the pictures are still on the wordpress server. Use Firefox to open the HTML and save it again with the option 'website complete' to have everything on your system (incl. pictures) for faster offline access.

Finally open the newly saved HTML file in a text editor and search&replace all relative img URLs with absolute paths (e.g. substitute 'myblog\_files/ with file:///c/myblog\_files/. This is sadly required for the Word import.

**import the HTML into Word & reformat styles** After opening/importing the HTML in Microsoft Word you can modify styles and ‚pimp’ the content as you want. Check for styles beginning with an \_ created by the Ruby script to mark different elements of the blog (content, headings, comments, post\_date, ...). Save as docx for future needs (and always keep the images folder with the docx).

**save as PDF and optionally create an eBook version.** Most print on demand services take a PDF, so simply save your document as a PDF. If you want to create an eBook version as well it you enter the ‚format hell’ for eBook content. Calibre seems to understand most formats and can also load the HTML export from Word to e.g. create a version in the epub format. (More [general info](http://ocio.osu.edu/elearning/toolbox/brief/epubs/9-things-you-should-know-about-epubs/) about ebooks.)

That's all. Isn't it simple?

_Note about Apple Pages_: Using Apple Pages seems the more obivous choice for text processing on a Mac. However the recent Pages versions removed the HTML import. So there wasn’t an easy way to get the wordpress content nicely formatted into Pages. Two workarounds are available: One ist to simply copy&paste content from the safari and the other is to use TextEdit (which still has a HTML import) to create a RTFD (RTF including attachents) and then load it into Apges. Unfortunately all pictures are scaled up tot he full page and this makes it painful if you have plenty of pictures embedded.

_Note about Microsoft Word for Mac_: It turned out that my mac version had multiple hiccups with a few hundred pages of text and plenty of included pictures. Switching to Windows made it less stressful for me.

_Note about Microsoft Word_: Seems plain wrong to me that recent versions of Word have problems with images you want to link in. My impression is that if you include a picture via a link to an external file, Word creates an absolute file path reference to this. Of course this makes it impossible to move the document and files around – even on your own local system. And when trying to embed to files right into the docx (which of course can seriously bloat the file size up), at least form e many pictures changed the scaling. Some oft hem were even uglily transformed.
