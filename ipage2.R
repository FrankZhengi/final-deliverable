# Interactive Page two

library(ggplot2)
library(stringr)
library(dplyr)
library(shiny)
library(plotly)

usReport <- read.csv("data/usReport.csv", skip = 6) 

usReport$median = apply(usReport, 1, median, na.rm=T)

USyears <- unique(usReport$Year)

ipage_2 <- tabPanel("Interative Page 2", 
                    selectizeInput(
                      inputId = "USyears",
                      label = "Select a Year",
                      choices = unique(usReport$Year),
                      multiple = TRUE
                    ),
                    plotlyOutput(outputId = "ye")
)




# ipage_2 <- tabPanel("Interative Page 2", fluid = T,
#                     selectizeInput(
#                       inputId = "USyears",
#                       label = NULL,
#                       choices = c("Choose a year" = "", USyears),
#                       multiple = TRUE
#                     ),
#                     plotlyOutput(outputId = "ye")
# )
#                   
                    
                    
                    
        