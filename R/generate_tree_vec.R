#' Generate a list of parsimony trees, based on subsamples from phylogenetic matrix
#' @description  Generate a list of phylogenetic trees based on subsamples from phylogenetic matrix, as generated from function generate_sets. Return return a vector of plots showing the tree and the specified data.
#' @param data_set Phylogenetic matrix
#' @param start Which character to begin sampling characters at
#' @param stop Which character to end sampling characters at
#' @param starting_tree Starting tree for parsimony search
#' @return Vector
#' @examples
#' tree <- generate_tree_vec(bears, 1, 2, starting_tree)
#' @export

generate_tree_vec <- function(data_set, start, stop, starting_tree){
  phy_mat <- phyDat(data_set, levels = c(0, 1, "?"), type = "USER")
  char_set <- c(start, stop)
  message("Generating tree for charset:", char_set)
  small_mat <- subset(phy_mat, select=char_set)
  tr <- optim.parsimony(tree=starting_tree, data = small_mat)
 return(tr)
}
