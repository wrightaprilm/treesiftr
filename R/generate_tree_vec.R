#' Generate a list of parsimony trees, based on subsamples from phylogenetic matrix
#' @description  Generate a list of phylogenetic trees based on subsamples from phylogenetic matrix, as generated from function generate_sets. Return return a vector of plots showing the tree and the specified data.
#' @param phy_mat Phylogenetic matrix
#' @param start Which character to begin sampling characters at
#' @param stop Which character to end sampling characters at
#' @param tree Starting tree for parsimony search
#' @return Vector
#' @examples
#' tr <- generate_tree_vec(bears, 1, 2, tree)
#' @export

generate_tree_vec <- function(phy_mat, start, stop, tree){
  phy_mat <- phangorn::phyDat(phy_mat, levels = c(0, 1), type = "USER")
  chars <- c(start, stop)
  message("Generating tree for charset:", chars)
  small_mat <- subset(phy_mat, select=chars[1]:chars[2],
                      site.pattern=FALSE)
  tr <- ape::multi2di(phangorn::optim.parsimony(tree=tree, data = small_mat))
  p_score <- phangorn::fitch(tr, small_mat)
  tr$pars2 <- p_score
  p_tr <- phangorn::acctran(tr, data = small_mat)
  fit <- phangorn::pml(p_tr, data = small_mat)
  tr$lik <- fit$logLik
  return(tr)
}
