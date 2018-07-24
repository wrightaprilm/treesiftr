library(phangorn)
test_that("Test tree_dat(data_set, start, stop, tree)", {
  data(bears)
  sample_df <- generate_sliding(bears, 0, 1, 1)
    tr <- generate_tree_vec(data_set = bears, start = sample_df$starting_val[1],
                            stop = sample_df$stop_val[1], tree = tree)
    tr <- tree_dat(tr, bears, sample_df$starting_val[1], sample_df$stop_val[1],                      pscore = TRUE, lscore = TRUE)
    expect_equal(length(tr$tip.label), 18)
    expect_equal(tr$pars, 1)
    expect_equal(tr$lik, -1.53, tolerance = .01)
})
