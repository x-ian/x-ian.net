const { DateTime } = require("luxon");
var slugify = require('slugify');
const pluginRss = require("@11ty/eleventy-plugin-rss");

module.exports = function(eleventyConfig) {
    eleventyConfig.addPlugin(pluginRss);
    eleventyConfig.addPassthroughCopy('css');
    eleventyConfig.addPassthroughCopy('js');
    eleventyConfig.addPassthroughCopy('img'); 

	eleventyConfig.addFilter("slugify", (input) => {
	  return mySlug(input);
	});
	
	eleventyConfig.addShortcode('postUrl', (post) => {
		"/{{ pagination.items[0].data.date | date: '%Y/%m/%d' }}/{{ pagination.items[0].data.title | slug }}/"
		
	    return "/" + formatDate(post.date) + "/" + mySlug(post.data.title) + "/"
	})

	eleventyConfig.addFilter('htmlDateString', (dateObj) => {
		return DateTime.fromJSDate(dateObj, {zone: 'utc'}).toFormat('yyyy-LL-dd');
	});

	return {
      passthroughFileCopy: true
    }
}

function mySlug(string) {
  const options = {
    replacement: "-",
    remove: /[&,+()$~%.'":*?<>{}]/g,
    lower: true
  };
  return slugify("" + string, options);
}

function formatDate(date) {
    var year = date.getFullYear().toString();
    var month = (date.getMonth() + 101).toString().substring(1);
    var day = (date.getDate() + 100).toString().substring(1);
    return year + "/" + month + "/" + day;
}