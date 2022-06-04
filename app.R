library(shiny)
source("ipage3.R")

  ui <- fluidPage(
    navbarPage("Final Project Introduction",
               ipage_1,
               ipage_2,
               ipage_3,
               summary
    )
  )

  server <- function(input, output) {
    output$price_trend <-renderPlot({
      ggplot(us_city_avg_df, mapping = aes(x = Year, y = yearly_average)) + 
        geom_line() +
        labs(title = "US Yearly City Average Gas Prices",
             subtitle = "unleaded regular gasoline, per gallon",
             y = "Yearly Average Gas Price (in USD)")
    })
  }
  
  shinyApp(ui = ui, server = server)