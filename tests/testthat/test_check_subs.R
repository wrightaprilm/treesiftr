test_that("Test check_subs(sample_df, phy_mat)", {
  sample_df <- generate_sliding(bears, 1, 3, 1)
  phy_mat <- phangorn::phyDat(bears, levels = c(0, 1), type = "USER")
  test_df <- check_subs(sample_df = sample_df, phy_mat = phy_mat)
  if (apply(test_df, 2, function(x) any(is.na(x))) == TRUE) {
    message("NA characters in matrix")
    stop
  }
})

