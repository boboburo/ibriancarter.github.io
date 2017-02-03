# Author: brian_carter@optum.com
# Date: 19-Jan-2017

#### Intent ####
# illustrate seperate ui.r and server.R files

library(shiny)
library(ggplot2)

ui <- shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Finally a plot"),
  
  sidebarLayout(
    sidebarPanel(
      #When input$col changes plot will update
      selectInput("col", "Choose numeric column to graph:", 
                  choices = c(colnames(diamonds[,sapply(diamonds, is.numeric)]))),
      
      #When input$numBins changes, plot will update.
      sliderInput("numBins","Choose number of bins",
                  min = 5,max = 30,value = 10),
      #when input$nowRows changes, plot will update
      numericInput("numRows", "Number of rows to view:", 10)
    ),#End sidebarPanel
    
    mainPanel(
      h4("Histogram"),
      plotOutput("diaHist"),
      
      h4("Observations"),
      tableOutput("diaRows")
    )# End main panel
  )#end sidebarLayout
)#end fluidPage
)#end UI
