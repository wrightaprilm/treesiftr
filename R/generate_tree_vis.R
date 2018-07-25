#' Combine trees and phylogenetic matrix data as a ggplot object
#' @description  This function calls generate_tree_vec() to generate a vector of phylogenetic trees under parsimony. It then plots them alongside the phylogenetic matrix that was used to estimate the tree. Optional decorations can be added displaying parsimony and likelihood scores.
#' @param sample_df Dataframe specifying how to subsample phylogenetic matrix
#' @param alignment String specifying path to alignment
#' @param tree Starting tree for parsimony analysis. Phylo object.
#' @param phy_mat Phylogenetic matrix to be subsampled
#' @param pscore Optional boolean specifying if you would like figures annotated with parsimony score of tree given data. Default FALSE.
#' @param lscore Optional boolean specifying if you would like figures annotated with likelihood score of tree given data under the Mk model. Default FALSE.
#' @return vector Vector of ggplot2 objects
#' @examples
#' \dontrun{
#' output_vector <- generate_tree_vis(sample_df = sample_df,
#'                                    alignment = aln_path, tree = tree,
#'                                    phy_mat = bears, pscore = TRUE,
#'                                    lscore = TRUE)
#' }
#' @export

generate_tree_vis <- function(sample_df, alignment, tree, phy_mat,
                              pscore = FALSE, lscore = FALSE){
  vis_vec <- list()
  phy_mat <- phyDat(phy_mat, levels = c(0, 1, "?"), type = "USER")
  sample_df <- check_subs(sample_df = sample_df, phy_mat = phy_mat)
  for (i in 1:nrow(sample_df)){
    char_set <- c(sample_df$starting_val[i], sample_df$stop_val[i])
    tr <- as.phylo(generate_tree_vec(phy_mat, sample_df$starting_val[i],
                                     sample_df$stop_val[i], tree))
    pl <- ggtree::msaplot(p=ggtree(tr), fasta=alignment, window=  char_set,                                    width = .1, offset = 9 ) + geom_tiplab() +
                          ggtitle(char_set)

    if (pscore == TRUE) {
        tr <- tree_dat(tr, phy_mat, sample_df$starting_val[i], sample_df$stop_val[i],                      pscore = TRUE)
        ps <- as.character(tr$pars)
        plab <- paste("PScore ", ps)
        print(char_set)
        pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", plab))
    }
    if (lscore == TRUE) {
      tr <- tree_dat(tr, phy_mat, sample_df$starting_val[i],
                     sample_df$stop_val[i], lscore = TRUE)
      l <- as.character(tr$lik)
      lab <- paste("LScore under Mk model ", l)
      pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", lab))
    }
    if (lscore & pscore == TRUE) {
      pl <- pl + ggtitle(paste0(char_set[1],"\n",char_set[2], "\n", lab,
                                "\n", plab))
    }
    vis_vec[[i]] <- pl
  }
  return(vis_vec)
}
