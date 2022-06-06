library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

source("intro.r")
source("ipage1.R")
source("ipage2.R")
source("ipage3.R")
source("summary.R")

usregion <- read.csv("data/usregiongas.csv")
minimized_df <- us_city_avg_df

  ui <- fluidPage(
    navbarPage("Final Project",
               intro,
               ipage_1,
               ipage_2,
               ipage_3,
               summary
    )
  )

  
  server <- function(input, output, session) {

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
    

    
    
    # Interactive page 2

    
    
    USyears <- unique(usReport$Year)
    #plot output for interactive page 2
    output$ye <- renderPlotly({
      req(input$USyears)
      if (identical(input$USyears, "")) return(NULL)
      ye <- ggplot(data = filter(usReport, Year %in% input$USyears), mapping = aes(Year, median)) +
        geom_line()
      height <- session$clientData$output_ye_height
      width <- session$clientData$output_ye_width
      ggplotly(ye, height = height, width = width)
    })

  
        

    # plot output for interactive page 3
    output$price_trend <- renderPlot({
        minimized_df <- filter(us_city_avg_df, Year >= input$min_year)
        ggplot(minimized_df, mapping = aes(x = Year, y = yearly_average)) + 
        geom_line() +
        geom_point() +
        labs(title = "US Yearly City Average Gas Prices",
             subtitle = "unleaded regular gasoline, per gallon",
             y = "Yearly Average Gas Price (in USD)")
    })
    
    # table output for interactive page 3
    output$year_price_gas <- renderTable({
      nearPoints(minimized_df, input$single_year, xvar = "Year", yvar = "yearly_average")
    })
    
    output$sumtable <- renderTable({
      region_names <- gsub("\\.", " ", colnames(usregion))
      regiontable <- usregion %>% 
        summarize_at(vars(East.Coast:West.Coast..PADD.5.), mean, na.rm = T)
      colnames(regiontable) <- region_names[-1]
      regiontable
    })
  }
  
  
    
  
  shinyApp(ui = ui, server = server)
  