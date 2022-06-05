library(shiny)
library(ggplot2)
library(dplyr)

usregion <- read.csv("data/usregiongas.csv")

  ui <- fluidPage(
    navbarPage("Final Project",
               intro,
               ipage_1,
               ipage_2,
               ipage_3,
               summary
    )
  )

  
  server <- function(input, output) {

    # plot of region gas prices 
    output$regionplot <- renderPlot({
      year <- input$year_chosen
      region_names <- gsub("\\.", " ", colnames(usregion))
      regiondf <- usregion %>% 
        filter(Date == year) %>% 
        select(East.Coast:West.Coast..PADD.5.)
      region_datadf <- data.frame(region = region_names[-1],
                                  price = as.numeric(regiondf[1, ]))
      ggplot(region_datadf, aes(x = region, y = price, fill = region)) + 
        geom_bar(stat = "identity") + ggtitle(paste(year, "U.S. Region Gas Prices"))
    })
    
    output$regionmax <- renderText({
      year <- input$year_chosen
      regiondf <- usregion %>% 
        filter(Date == year) %>% 
        select(East.Coast:West.Coast..PADD.5.)
      region_found <- colnames(regiondf)[max.col(regiondf)]
      region_found <- gsub("\\.", " ", region_found)
      paste("The region with the largest gas price is", region_found)
    })
  }

  shinyApp(ui = ui, server = server)
  