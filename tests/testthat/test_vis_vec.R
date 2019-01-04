library(ggplot2)
library(ggtree)
library(phangorn)
library(Biostrings)
test_that("Test generate_tree_vis(data_frame, alignment, tree, pscore, lscore)", {
  data(bears)
  aln_path = "testdata/bears_fasta.fa"
  sample_df = generate_sliding(bears, 1, 10, 1)
  vec <- generate_tree_vis(sample_df = sample_df, alignment = aln_path,
                           tree = tree, phy_mat = bears)
    testthat::expect_equal(length(vec), 10)
    expect_equal(length(vec[[1]]$layers), 0)
    expect_is(vec[[1]]$labels$title, "character")
})
