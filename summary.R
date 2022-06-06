summary <- tabPanel(
  "Summary Takeaway",
  fluidPage(
    h1("Summary"),
    h3("Three Major Takeaways"),
    h4("Gas prices has generally increased every year."),
    p("Regardless of region, gas prices has increased each year with an upwards
      trend. According to the dataset ", code(("usregiongas.csv")), ", every region
      in the United States saw an increase in gas prices. In the US, the West Coast
      most commonly had the highest gas prices out of all other regions. According
      to the graph on the third visualization, there is an upward trendline; each
      year gas prices has generally increased."),
    h4("Gas prices reach a peak high then decrease in price."),
    p("Based from the data from ",  code(("usReport.csv")), ", gas prices reach
      a peak high then decrease in value the following years. In 2012, gas prices
      in the United States reached an all-time high, averaging $3.64 per gallon.
      In 2016 however, gas prices decreased to a yearly average of $2.14 per
      gallon, a 41% decrease compared to 2012. Gas prices have recently risen 
      even higher than 2012, indicating that in upcoming years gas prices may 
      decrease for a short period of time."),
    h4("Gas prices are a reflection of the economy."),
    p("Varying gas prices can often reflect the economy of the country. One reason
      gas may have peaked in 2012 is due to rising tensions between Iran and the
      West. Western countries would not be able receive oil from Iran, a major
      oil supply country."),
    h4("Gas prices will continue to increase."),
    p("Data from datasets ", code(("usReport.csv")), ", ", 
      code(("uscitiesgas.csv")), ", and", code(("uscitiesgas.csv")), "all reveal
      a positive trend in gas prices. The data supports the idea that gas prices
      will continue to increase, regardless if gas prices may temporarily 
      decrease.")
  )
)

