# Interactive Page two

library(ggplot2)
library(stringr)
library(dplyr)
library(shiny)
library(plotly)

usReport <- read.csv("data/usReport.csv", skip = 6) 
usReport$mean = apply(usReport, 1, mean, na.rm=T)


USyear <- unique(usReport$Year)


ipage_2 <- tabPanel("Interative Page 2", fluid = T,
                    selectizeInput(
                      inputId = "USyear",
                      label = NULL,
                      choices = c("Choose a year" = "", USyear),
                      multiple = TRUE
                    ),
                    plotlyOutput(outputId = "ye")
)

                    
                    
                    
        