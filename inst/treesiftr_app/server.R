library(treesiftr)
library(ggtree)
library(ggplot2)
library(alignfigR)
library(Biostrings)
library(phangorn)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  data(bears)
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot


  output$treeAlign <- renderPlot({
  aln_path = "data/bears_fasta.fa"
  step <- input$step_val - 1
  sample_df = generate_sliding(bears, input$min_val, input$min_val,
                               step)
  print(sample_df)

 for (i in 1:length(sample_df$starting_val)){
    vis_vec <- generate_tree_vis(sample_df = sample_df, alignment = aln_path, tree = tree, phy_mat = bears, pscore = input$pscore, lscore = input$lscore)
    print(vis_vec)
    }

})
}
