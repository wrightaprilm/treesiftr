library(shiny)

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
      sliderInput(inputId = "min_val",
                  label = "First character to visualize:",
                  min = 1,
                  max = 61,
                  value = 3),


    sliderInput(inputId = "max_val",
                label = "Last character to visualize:",
                min = 1,
                max = 62,
                value = 5),


  sliderInput(inputId = "steps",
              label = "Step size (how many characters to plot at once",
              min = 0,
              max = 62,
              value = 2),

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

