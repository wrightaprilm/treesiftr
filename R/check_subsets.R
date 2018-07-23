#' Generate list of character sets to visualize, removing any with NULL characters
#' @description  Generate a dataframe of start and stop values. These will determine what character sets from the total phylogenetic matrix will appear in each visualization. Removes any sets with NULL characters, which cannot be used in phylogenetic estimation. Sources of NULLs may include typos, or two sequences being different lengths.
#' @param data_frame Dataframe of start and stop vals for character set genereation
#' @param phylo_mat Name of the phylogenetic matrix from which character sets will be sampled
#' @return df
#' @examples
#' sample_df <- check_subs(sample_df, bears)
#' @export

check_subs <- function(data_frame, phy_mat){
  for (i in 1:nrow(sample_df)){
    char_set <- c(sample_df$starting_val[i], sample_df$stop_val[i])
    small_mat <- subset(phy_mat, select=char_set)
    if ( any(is.na(small_mat[[1]]))){
    sample_df <- sample_df[-i, ]
    }
  }
  return(sample_df)
}
