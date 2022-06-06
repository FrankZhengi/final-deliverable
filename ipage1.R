# Interactive page one
# Which region had the highest gas price for all grades?

library(ggplot2)
usregion <- read.csv("data/usregiongas.csv")
years <- usregion %>% 
  select(Date) %>% 
  pull()

ipage_1 <- tabPanel("Interactive Page 1",
                    titlePanel("Which region has the highest gas price for all grades in a chosen year?"),
                    p("On this interactive page, we are using data from the EIA, Energy Informatino Adminstration,
                      on annual gas prices by the dollar per gallon for U.S. regions to find which has the highest
                      gas price on a certain year. For the regions, we have the West Coast, which includes Alaska
                      and Hawaii, another West Coast that does not include California, the Rocky Mountains, the
                      Gulf Coast, East coast, and the East coast divided up to New England, Central Atlantic,
                      and Lower Atlantic."),
                    selectInput(inputId = "year_chosen", label = "What year would you like to chose?",
                                    choices = years, selected = 1),
                    plotOutput("regionplot"),
                    textOutput("regionmax")
) 

