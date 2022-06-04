library(shiny)
library(ggplot2)
library(dplyr)
usregion <- read.csv("data/usregiongas.csv")

  ui <- fluidPage(
    navbarPage("Final Project Introduction",
               ipage_1,
               ipage_2,
               ipage_3,
               summary
    )
  )

  
  server <- function(input, output) {
    
    region_data_finder <- function(year) {
      region_names <- gsub("\\.", " ", colnames(usregion))
      regiondf <- usregion %>% 
        filter(Date == year) %>% 
        select(East.Coast:West.Coast..PADD.5.)
      region_found <- colnames(regiondf)[max.col(regiondf)]
      region_found <- gsub("\\.", " ", region_found)
      region_datadf <- data.frame(region = region_names[-1],
                                  price = as.numeric(regiondf[1, ]))
      regionplot <- ggplot(region_datadf, aes(x = region, y = price, fill = region)) + 
        geom_bar(stat = "identity") + ggtitle(paste(year, "U.S. Region Gas Prices"))
      region_data <- list(region_found, regionplot)
      return(region_data)
    }
    
    region_ans <- region_data_finder(reactive(input$year_chosen))
    output$regionplot <- renderPlot({
      region_ans[[2]]
    })
  }

  shinyApp(ui = ui, server = server)
  