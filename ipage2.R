# Interactive Page two

library(ggplot2)
library(stringr)
library(dplyr)

usReport <- read.csv("data/usReport.csv", skip = 6) 


ipage_2 <- tabPanel("Interative Page 2", fluid = T,
                    sidebarLayout(
                      sidebarPanel(
                        selectInput(inputId = "type", label = strong("Year"),
                                    choices = unique(usReport$Year)),
                        
                        dataRangeInput("date", strong("Data")))
                    )
)
