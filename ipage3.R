library(ggplot2)
library(dplyr)

us_city_avg_df <- read.csv("Data/usReport.csv", skip = 6)

# average pricing for each year
us_city_avg_df <- us_city_avg_df %>% 
  mutate(yearly_average = 
           rowMeans(select(us_city_avg_df, Jan:Dec), na.rm = TRUE))

# create line chart of average gas pricing over years

ipage_3 <- tabPanel("Interactive Page 3",
                    sidebarLayout(
                      sidebarPanel(
                        h4("Controls")
                      ),
                      mainPanel(
                        plotOutput(outputId = "price_trend")
                      )
                    )
  
)