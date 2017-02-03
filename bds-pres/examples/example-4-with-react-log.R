# Author: brian_carter@optum.com
# Date: 06-Jan-2017

#### Intent ####
# illustrate reactive plots and Shiny UI Layout paradaigm
# Add option to allow to view the react log - see bottom for instructions

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
    head(diamonds, n=input$numRows)
  })
 
  # Create histogram 
  output$diaHist = renderPlot({
    ggplot(diamonds, aes_string(x=input$col)) + geom_histogram()
  })
  
})

options(shiny.reactlog = TRUE)
shinyApp(ui = ui, server = server ,options = list(launch.browser =T))

#To see the reactive log pres Ctrl+F3 or run
#showReactLog() from command line