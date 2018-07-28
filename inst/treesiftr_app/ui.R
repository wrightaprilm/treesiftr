library(shiny)
library(treesiftr)

data(bears)
# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("treesiftr"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      numericInput(inputId = "min_val",
                  label = "First character to visualize:",
                  min = 1,
                  max = 61,
                  value = 3),
      numericInput(inputId = "step_val",
                   label = "Number to visualize (max 5):",
                   min = 2,
                   max = 5,
                   value = 3),


  checkboxInput(inputId = "pscore",
                label = "Do you want to print the parsimony score?",
                value = FALSE,
                width = NULL),
  checkboxInput(inputId = "lscore",
                label = "Do you want to print the likelihood score under the Mk
                        model?",
                value = FALSE,
                width = NULL)
),

    # Main panel for displaying outputs ----
    mainPanel(

      plotOutput(outputId = "treeAlign")

    )
  )
)


