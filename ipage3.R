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
                        h4("Controls"),
                        sliderInput(
                          inputId = "min_year",
                          label = "Filter by minimum year",
                          min = min(us_city_avg_df$Year),
                          max = max(us_city_avg_df$Year),
                          value = min(us_city_avg_df$Year)
                        ),
                        p("This page seeks to answer the question of how gas prices
                           has changed over the years. From the graph we can see that
                           the current price of gas is the highest it has ever been 
                           when looking at the last 45 years or so. The last time that
                           gas prices has come close to the current price was around
                           2012. We can see a general trend of increasing gas prices 
                           during the modern era.")
                      ),
                      mainPanel(
                        plotOutput(outputId = "price_trend", click = "single_year"),
                        tableOutput(outputId = "year_price_gas")
                      )
                    )
  
)