library(treesiftr)
library(ggtree)
library(ggplot2)
library(alignfigR)
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
  data(bears)
  output$treeAlign <- renderPlot({
  aln_path = "data/bears_fasta.fa"
  sample_df = generate_sliding(bears, input$min_val, input$max_val, input$steps)
  generate_tree_vis(sample_df = sample_df, alignment = aln_path,
                           tree = tree, phy_mat = bears, pscore = input$pscore,
                            lscore = input$lscore
                     )

  })

}

