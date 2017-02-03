# Author: brian_carter@optum.com
# Date: 19-Jan-2017

#### Intent ####
# illustrate seperate ui.r and server.R files

library(shiny)
library(ggplot2)

server <- shinyServer(function(input, output) {
  
  # Show the first "n" observations
  output$diaRows <- renderTable({
    head(diamonds, input$numRows)
  })
  
  # Create histogram 
  output$diaHist = renderPlot({
    ggplot(diamonds, aes_string(x=input$col)) + geom_histogram(bins = input$numBins)
  })
  
})
