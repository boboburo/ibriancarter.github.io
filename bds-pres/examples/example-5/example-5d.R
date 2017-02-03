# Author: brian_carter@optum.com
# Date: 19-Jan-2017

#### Intent ####
# illustrate shinydashboard layouts. 
# biggest issue here will be brackets and commas missing 

library(shinydashboard)
library(shiny)
library(ggplot2)
library(DT)

ui <- dashboardPage(
  dashboardHeader(title = "Example 5d"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      column(width = 12,
        box(width = 4,title = "Controls",
            selectInput("col", "Choose numeric column to graph:", 
                    choices = c(colnames(diamonds[,sapply(diamonds, is.numeric)]))),
            
            sliderInput("numBins","Choose number of bins",
                    min = 5,max = 30,value = 10),
        
          numericInput("numRows", "Number of rows to view:", 10)
      ),#end box
      box(width = 8,title = "Table",
          dataTableOutput('table')
          )#end box
      )),#end column fluidRow
  fluidRow(
    column(width = 12,
           box(width = NULL,title = "Plot",
               plotOutput("diaHist")
               )#end box
           ))# end column, fluidRow
  )#end dashboardBody
)# end dashboardPage


server <- function(input, output) {

  output$table <- renderDataTable({
    head(diamonds[,1:4],n=input$numRows)})
  
  # Create histogram 
  output$diaHist = renderPlot({
    ggplot(diamonds, aes_string(x=input$col)) + geom_histogram(bins=input$numBins)
  })

  }


shinyApp(ui = ui, server = server ,options = list(launch.browser =T))
