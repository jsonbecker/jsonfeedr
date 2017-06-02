# jsonfeedr

`jsonfeedr` is a simple, silly package to go get [JSON feed](https://jsonfeed.org) data from the web.

## Example

[Six Colors](https://sixcolors.com) is one of my favorite sites on the web and they support JSON feed. If I wanted to get information about the site, I may grab some meta data from the feed like so:

```r
get_feed_info("https://sixcolors.com/feed.json")
```
Maybe what I want is the last set of posts, so I can analyze how frequently posts are made.

```r
items <- get_feed_items("https://sixcolors.com/feed.json")
table(as.Date(results$date_published))
```

Or if I want all of the info at once in a list, I can just `get_feed('https://sixcolors.com/feed.json')`.