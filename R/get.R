

#' Retrieve a JSON Feed
#'
#' @param url the URL of a feed
#'
#' The key \code{items} contains the information about individual posts.
#' The top level keys relate to data about the feed itself. If only the meta
#' data are required, use \link{get_feed_info}, but if only the \code{items}
#' are required, use \link{get_feed_items}.
#'
#' @return a list with all of the JSON feed components.
#' @export
#'
#' @examples
#' get_feed("https://sixcolors.com/feed.json")
#'
get_feed <- function(url) {
  con <- curl::curl(url, 'r')
  on.exit(close(con))
  jsonlite::fromJSON(readLines(con, warn = FALSE))
}

#' Retrieve JSON feed meta data
#'
#' @param url the URL of a feed
#'
#' Contains only the information about a feed.
#'
#' @return a list of the metadata about a feed. This does not contain post content.
#' @export
#'
#' @examples
#' get_feed_info("https://sixcolors.com/feed.json")
get_feed_info <- function(url){
  response <- get_feed(url)
  response$items <- NULL
  names(response$author) <- paste('author', names(response$author), sep = '_')
  response <- append(response, response$author)
  response$author <- NULL
  response
}

#' Retrieve JSON feed posts
#'
#' @param url the URL of a feed
#'
#' A data.frame with all of the post items in a JSON feed.
#'
#' @return a data.frame of JSON feed posts

#' @export
#'
#' @examples
#' get_feed_items("https://sixcolors.com/feed.json")
get_feed_items <- function(url){
  response <- get_feed(url)
  response$items
}