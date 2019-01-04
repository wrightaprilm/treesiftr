#' Combine trees and phylogenetic matrix data as a ggplot object
#' @description  This function calls generate_tree_vec() to generate a vector of phylogenetic trees under parsimony. It then plots them alongside the phylogenetic matrix that was used to estimate the tree. Optional decorations can be added displaying parsimony and likelihood scores.
#' @param sample_df Dataframe specifying how to subsample phylogenetic matrix
#' @param alignment String specifying path to alignment
#' @param tree Starting tree for parsimony analysis. Phylo object.
#' @param phy_mat Phylogenetic matrix to be subsampled
#' @param pscore Optional boolean specifying if you would like figures annotated with parsimony score of tree given data. Default FALSE.
#' @param lscore Optional boolean specifying if you would like figures annotated with likelihood score of tree given data under the Mk model. Default FALSE.
#' @param random_tree Optional boolean specifying if you would like to view a vector
#' of random trees
#' @return vector Vector of ggplot2 objects
#' @importFrom phangorn phyDat
#' @importFrom ape as.phylo
#'@importFrom ape rtree
#' @importFrom ggtree msaplot
#' @importFrom ggtree ggtree
#' @importFrom ggplot2 ggtitle
#' @examples
#' \dontrun{
#' output_vector <- generate_tree_vis(sample_df = sample_df,
#'                                    alignment = aln_path, tree = tree,
#'                                    phy_mat = bears, pscore = TRUE,
#'                                    lscore = TRUE)
#' }
#' @export

generate_tree_vis <- function(sample_df, alignment, tree, phy_mat,
                              pscore = FALSE, lscore = FALSE, random_tree = FALSE){

  vis_vec <- list()
  phy_mat <- phangorn::phyDat(phy_mat, levels = c(0, 1), type = "USER")
  sample_df <- check_subs(sample_df = sample_df, phy_mat = phy_mat)
  for (i in 1:nrow(sample_df)){
    if (random_tree == FALSE){
    chars <- c(sample_df$starting_val[i], sample_df$stop_val[i])
    tr <- ape::as.phylo(generate_tree_vec(phy_mat, sample_df$starting_val[i],
                                     sample_df$stop_val[i], tree))
    pl <- ggtree::msaplot(p=ggtree::ggtree(tr), fasta=alignment, window = chars,                                    width = .1, offset = 9 ) + ggtree::geom_tiplab() +
                          ggplot2::ggtitle(paste0(chars[1],"\n",chars[2]))
    }
    
    if (random_tree == TRUE) {
        chars <- c(sample_df$starting_val[i], sample_df$stop_val[i])
        tr <- ape::as.phylo(ape::rtree(18, tree$tip.label, rooted= TRUE))
        pl <- ggtree::msaplot(p=ggtree::ggtree(tr), fasta=alignment, window = chars,                                    width = .1, offset = 9 ) + ggtree::geom_tiplab() +
          ggplot2::ggtitle(paste0(chars[1],"\n",chars[2]))      
        small_mat <- subset(phy_mat, select=chars[1]:chars[2], site.pattern=FALSE)
        p_score <- phangorn::fitch(tr, small_mat)
        tr$pars2 <- p_score
        print(tr$pars2)
        p_tr <- phangorn::acctran(tr, data = small_mat)
        fit <- phangorn::pml(p_tr, data = small_mat)
        tr$lik <- fit$logLik
    }

    if (pscore == TRUE) {
        ps <- as.character(tr$pars2)
        plab <- paste("PScore ", ps)
        pl <- pl + ggplot2::ggtitle(paste0(chars[1],"\n", chars[2], "\n", plab))
    }
    if (lscore == TRUE) {
      l <- as.character(tr$lik)
      lab <- paste("LScore under Mk model ", l)
      pl <- pl + ggplot2::ggtitle(paste0(chars[1],"\n", chars[2], "\n", lab))
    }
    if (lscore & pscore == TRUE) {
      pl <- pl + ggplot2::ggtitle(paste0(chars[1],"\n", chars[2], "\n", lab,
                                "\n", plab))
    }

  }
  vis_vec[[i]] <- pl
  
  return(vis_vec)
}
