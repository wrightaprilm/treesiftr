test_that("Test generate_sliding(sample_df, phy_mat)", {
  sample_df <- generate_sliding(bears, 1, 10, 1)
  expect_is(sample_df, "data.frame")
  a <-dim(sample_df)
  expect_equal(a[1], 10)
  expect_equal(a[2], 2)
})

