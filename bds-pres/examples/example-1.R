# Author: brian_carter@optum.com
# Date: 06-Jan-2017


### Intent ###
# illustrate input -> reactive -> render -> output of shiny paradaigm.


library(shiny)

ui <- shinyUI(fluidPage(
  
  textInput(inputId = "identity", label = "Who are you?", value = "World"),
  textOutput("helloAns")
))

server <- shinyServer(function(input, output) {
  
  #Caputre input$identity in a reactive function()
  myAnswer <- reactive (paste("Hello", input$identity))
  
  #Note call the function myAnswer()
  output$helloAns <- renderText({ myAnswer() })
  
})

#launch browser forces to open in tab. 
shinyApp(ui = ui, server = server ,options = list(launch.browser =T))



### ----- Just using a render -----

# output$helloAns <- renderText({ paste("Hello", input$identity)})


### ----  Question -------
# Question: why might we use a reactive to capture rather than just a render?
# Think about may subsetting a data.frame and we don't want to have to do 
# it multiple times for multiple plots. Create a reactive data.frame f