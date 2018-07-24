#' Generate a list of parsimony trees, based on subsamples from phylogenetic matrix
#' @description  Generate a list of phylogenetic trees based on subsamples from phylogenetic matrix, as generated from function generate_sets. Return return a vector of plots showing the tree and the specified data.
#' @param data_set Phylogenetic matrix
#' @param start Which character to begin sampling characters at
#' @param stop Which character to end sampling characters at
#' @param starting_tree Starting tree for parsimony search
#' @return Vector
#' @examples
#' tree <- generate_tree_vec(bears, 1, 2, tree)
#' @export

generate_tree_vec <- function(data_set, start, stop, tree){
  phy_mat <- phangorn::phyDat(data_set, levels = c(0, 1, "?"), type = "USER")
  charset <- c(start, stop)
  message("Generating tree for charset:", charset)
  small_mat <- subset(phy_mat, select=charset)
  tr <- phangorn::optim.parsimony(tree=tree, data = small_mat)
 return(tr)
}
