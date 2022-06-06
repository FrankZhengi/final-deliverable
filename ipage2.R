# Interactive Page two

library(ggplot2)
library(stringr)
library(dplyr)
library(shiny)
library(plotly)

usReport <- read.csv("data/usReport.csv", skip = 6) 


USyears <- unique(usReport$Year)

ipage_2 <- tabPanel("Interative Page 2", fluid = T,
                    selectizeInput(
                      inputId = "USyears",
                      label = NULL,
                      choices = c("Choose a year" = "", yearofUS),
                      multiple = TRUE
                    ),
                    plotlyOutput(outputId = "ye")
)
                  
                    
                    
                    
        