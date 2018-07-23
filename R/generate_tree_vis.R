#' Generate a list of parsimony trees, based on subsamples from phylogenetic matrix
#' @description  Generate a list of phylogenetic trees based on subsamples from phylogenetic matrix, as generated from function generate_sets. Return the input dataframe, with a column of phylogenetic trees.
#' @param sample_df Dataframe specifying how to subsample phylogenetic matrix
#' @param alignment String specifying path to alignment
#' @param tree Starting tree for parsimony analysis. Phylo object.
#' @param data_set Phylogenetic matrix to be subsampled
#' @param pscore Optional boolean specifying if you would like figures annotated with parsimony score of tree given data. Default FALSE.
#' @param pscore Optional boolean specifying if you would like figures annotated with likelihood score of tree given data under the Mk model. Default FALSE.
#' @return vector Vector of ggplot2 objects
#' @examples
#' output_vector <- generate_tree_vis(data_frame = sample_df, alignment = aln_path, tree = tree, data_set = bears, pscore = TRUE, lscore = TRUE)
#' @export

generate_tree_vis <- function(data_frame, alignment, tree, data_set,
                              pscore = FALSE, lscore = FALSE){
  vis_vec <- list()
  phy_mat <- phyDat(data_set, levels = c(0, 1, "?"), type = "USER")
  sample_df <- check_subs(sample_df, phy_mat)
  for (i in 1:nrow(sample_df)){
    char_set <- c(sample_df$starting_val[i], sample_df$stop_val[i])
    tr <- as.phylo(generate_tree_vec(data_set, sample_df$starting_val[i],
                                     sample_df$stop_val[i], tree))
    pl <- msaplot(p=ggtree(tr), fasta=alignment, window=  char_set,                                                              width = .1, offset = 9 ) +                                 geom_tiplab() + ggtitle(char_set)

    if (pscore == TRUE) {
        tr <- tree_dat(tr, data_set, sample_df$starting_val[i], sample_df$stop_val[i],                       pscore = TRUE)
        ps <- as.character(tr$pars)
        plab <- paste("PScore ", ps)
        print(char_set)
        pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", plab))
    }
    if (lscore == TRUE) {
      tr <- tree_dat(tr, data_set, sample_df$starting_val[i], sample_df$stop_val[i],                      lscore = TRUE)
      l <- as.character(tr$lik)
      lab <- paste("LScore under Mk model ", l)
      pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", lab))
    }
    if (lscore & pscore == TRUE) {
      pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", lab, "\n", plab))
    }
    vis_vec[[i]] <- pl
  }
  return(vis_vec)
}
