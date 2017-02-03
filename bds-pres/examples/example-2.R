# Author: brian_carter@optum.com
# Date: 06-Jan-2017

#### Intent ####
# illustrate Shiny input widgets

library(shiny)

ui <- shinyUI(fluidPage(
  
  textInput("identity", "Who are you?", value = "World"),
  selectInput("language","What language would you like?", 
              choices = c("English", "Irish", "Hindi"),
              selected = c("Irish")),
  textOutput("helloAns")
))

server <- shinyServer(function(input, output) {
  
  langTable <- data.frame(
    language = c("English", "Irish", "Hindi"),
    salutation = c("Hi", "Dia Duit", "Namaste")
  )
  
  output$helloAns <- renderText({
    paste(langTable$salutation[langTable$language==input$language], input$identity)
  })
})

shinyApp(ui = ui, server = server ,options = list(launch.browser =T))