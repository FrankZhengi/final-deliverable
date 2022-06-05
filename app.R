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
    
    
    # returning text of region with highest gas price in chosen year
    output$regionmax <- renderText({
      year <- input$year_chosen
      region_names <- gsub("\\.", " ", colnames(usregion))
      regiondf <- usregion %>% 
        filter(Date == year) %>% 
        select(East.Coast:West.Coast..PADD.5.)
      region_datadf <- data.frame(region = region_names[-1],
                                  price = as.numeric(regiondf[1, ]))
      region_found <- region_datadf %>% 
        filter(price == max(price, na.rm = T)) %>% 
        pull(region)
      if (year == 1993) {
        paste("No information available for this year.")
      } else {
        paste0("The region with the largest gas price is the " , region_found, ".")
      }
    })
  }

  shinyApp(ui = ui, server = server)
  