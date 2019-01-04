library(shiny)
library(treesiftr)
library(ggtree)
library(ggplot2)
library(alignfigR)
library(Biostrings)
library(phangorn)
library(shinyBS)


data(bears)
# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("treesiftr"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
   sidebarPanel("Below, indicate at which characters you would like to begin 
                 visualization, and how many characters to visualize.
                 Mouse over options and tree for further information.",
        
    
      popify(el = numericInput(inputId = "min_val",
                  label = "First character to visualize:",
                  min = 1,
                  max = 61,
                  value = 1),
              title = "Characters",
              content = "Character at which to begin visualizing data. For \\
                         example, to begin visualizing from the fifth character \\
                         in the matrix, enter `5`",
              trigger = "hover"
             ),
      
      popify(el = numericInput(inputId = "step_val",
                   label = "Number of characters to visualize (max 5):",
                   min = 1,
                   max = 5,
                   value = 3),
             title = "Number of Characters",
             content = "Number of Characters from the matrix to visualize. For \\
                        example, to visualize 3 characters, choose `3`",
             trigger = "hover"
      ),

      popify(el = checkboxInput(inputId = "pscore",
                                label = "Print the parsimony score?",
                                value = FALSE,
                                width = NULL),
             title = "Parsimony or likelihood score",
             content = "The parsimony score or the likelihood score under the \\
                        Mk model of morphological evolution, for the visualized \\
                       characters along the visualized tree, as calculated in \\
                       Phangorn",
             trigger = "hover"
      ),
      
  checkboxInput(inputId = "lscore",
                label = "Print the likelihood score under the Mk
                        model?",
                value = FALSE,
                width = NULL),


  popify(el = checkboxInput(inputId = "random_tree",
                          label = "View random set of trees rather than an 
                                  estimated tree",
                          value = FALSE,
                          width = NULL),
      title = "Random tree",
      content = "Rather than estimating a tree for the selected characters, \\
                map the characters to a randomly-generated topology",
      trigger = "hover"
  
  )
  ),
  
    # Main panel for displaying outputs ----
    mainPanel(

      popify(el = plotOutput(outputId = "treeAlign"),
             title = "Dataset",
             content = "The dataset is from Abella et al. 2012  \\
             https://doi.org/10.1371/journal.pone.0048985",
             trigger = "hover"
      )

    )
  )
)



