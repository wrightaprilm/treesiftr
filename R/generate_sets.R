#' Generate list of character sets to visualize
#' @description  Generate a dataframe of start and stop values. These will determine what character sets from the total phylogenetic matrix will appear in each visualization
#' @param data_set Name of the phylogenetic matrix from which character sets will be sampled
#' @param start_value Integer indicating where in the data set to begin generating character sets
#' @param tree Integer indicating where in the data set to stop generating character sets
#' @param step Integer indicating how amny characters will be in each set
#' @return df
#' @examples
#' sample_df <- generate_sliding(bears, 1, 10, 2)
#' @export

generate_sliding <- function(data_set, start_char, stop_char, steps){
  maximum_len <- length(data_set[[1]])

  starts <- seq(start_char, stop_char, steps)
  stops <- starts + 1

  starts_name <- "starting_val"
  stops_name <- "stop_val"

  if ((tail(stops, n=1) >= maximum_len) == TRUE){
    stops <- head(stops, -1)
    starts <- head(starts, -1)
    sample_df <- data.frame(starts, stops)
    names(sample_df) <- c(starts_name,stops_name)
    } else {
    sample_df <- data.frame(starts, stops)
    names(sample_df) <- c(starts_name,stops_name)
  }
  return(sample_df)
}
