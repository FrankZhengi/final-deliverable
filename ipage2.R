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
                    titlePanel("Average Gas Price"),
                    p("On this page, you will find the average gas prices of unleaded regular, per gallon/3.785 liters in U.S.
                      city average (not seasonalyl adjusted) to find the gas price averages over a year, within the
                      span of 46 years, and compare how the average prices of -- ie. 1980 -- differed from the average 
                      gas prices of year 2000. We have a range from the year 1976, to 2022"),
                    selectizeInput(
                      inputId = "USyear",
                      label = NULL,
                      choices = c("Select a year" = "", USyear),
                      multiple = TRUE
                    ),
                    plotlyOutput(outputId = "ye")
)

                    
                    
                    
        