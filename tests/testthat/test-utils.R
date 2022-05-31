test_that("sanitize_version() works", {
  expect_equal(sanitize_version("2.1"), "2.1")
  expect_equal(sanitize_version("0.60.1"), "0.60")
  expect_equal(sanitize_version("4.1.1"), "4.1")
  expect_snapshot_error(sanitize_version("blop"))
})
