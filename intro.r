intro<- tabPanel(
  "Introduction",
  fluidPage(
    img(src = "gaspricepic.png",  height = 400, width = 850),
    h1("Gasoline Prices"),
    h5(em("Frank Zheng, Ryan Nguyen, James Bang, Hansol Choi")),
    p("Gasoline prices are a critical aspect of everyday life that can also 
      reflect the economy. Recently, gas prices has surged an all-time high in
      America. The following datasets ",  
      code(("statesgas.csv")),", ", code(("usReport.csv")), ", ", 
      code(("uscitiesgas.csv")), ", ", code(("usgas.csv")),", and", 
      code(("usregiongas.csv")),"reveal gas prices from various states, cities, 
      and years. In this report, some major questions are the following:" ,
      span ("which region has the highest gas prices in America? How has gas prices
      changed throughout time? When were gas prices the highest? Are there any 
      outliers?", style = "color:blue"), "The following visualizations
      utilizes the data to depict how gas prices have dramtically changed 
      throughout the years in the Unites States and seek to answer the questions
      above.")
  )
)


  