library(ggplot2)
library(ggtree)
library(phangorn)
test_that("Test generate_tree_vec(data_set, start, stop, tree)", {
  data(bears)
  sample_df <- generate_sliding(bears, 1, 10, 1)
  for (i in 1:nrow(sample_df)){
    tr <- generate_tree_vec(data_set = bears, start = sample_df$starting_val[i],
                            stop = sample_df$stop_val[i], tree = tree)
    expect_equal(tree$Nnode, 16)
    expect_equal(length(tr$tip.label), 18)
  }
})
