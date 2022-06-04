library(shiny)

  ui <- fluidPage(
    navbarPage("Final Project Introduction",
               ipage_1,
               ipage_2,
               ipage_3,
               summary,
    )
  )

  server <- function(input, output) {
    
  }