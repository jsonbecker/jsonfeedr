context('Test that retrieving JSON feeds works')

test_that("get_feed retrieves a JSON feed with expected fields",{
  expect_silent(get_feed('https://sixcolors.com/feed.json'))
  results <- get_feed('https://sixcolors.com/feed.json')
  expect_is(results, 'list')
  expect_is(results$items, 'data.frame')
})

test_that("get_feed_info retrieves JSON feed meta data",{
  expect_silent(get_feed_info('https://sixcolors.com/feed.json'))
  results <- get_feed_info('https://sixcolors.com/feed.json')
  expect_is(results, 'list')
  expect_null(results$items)
})

test_that("get_feed_items retrieves JSON feed posts",{
  expect_silent(get_feed_items('https://sixcolors.com/feed.json'))
  results <- get_feed_items('https://sixcolors.com/feed.json')
  expect_is(results, 'data.frame')
  expect_true(all(!is.null(results$id)))
})