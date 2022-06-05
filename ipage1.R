# Interactive page one
# Which region had the highest gas price for all grades?

library(ggplot2)
usregion <- read.csv("data/usregiongas.csv")
years <- usregion %>% 
  select(Date) %>% 
  pull()

ipage_1 <- tabPanel("Interactive Page 1",
                    titlePanel("Which region has the highest gas price for all grades in a chosen year?"),
                    selectInput(inputId = "year_chosen", label = "What year would you like to chose?",
                                    choices = years, selected = 1),
                    plotOutput("regionplot"),
                    textOutput("regionmax")
) 

