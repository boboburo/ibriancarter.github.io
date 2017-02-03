# Author: brian_carter@optum.com
# Date: 06-Jan-2017

#### Intent ####
# illustrate reactive plots and Shiny UI Layout paradaigm
# illustrate that all inputs from a input are of type "character"
# R coerces where it can so "5" - 5 but for some libraries 
# e.g. ggplot need to operate with characters with aes_string()

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
  
 
server <- shinyServer(function(input, output) {
  
  # Show the first "n" observations
  output$diaRows <- renderTable({
    head(diamonds, 10)
  })
 
  # Create histogram 
  output$diaHist = renderPlot({
    ggplot(diamonds, aes(x=depth)) + geom_histogram()
  })
  
})

shinyApp(ui = ui, server = server ,options = list(launch.browser =T))

#1. add in diaRows: input$numRows
#2. add in geom_histogram:  bins = input$numBins
#3. add in ggplot: aes_string(x=input$col) - show without aes_string