#Define
langTable <- function(){
  data.frame(language = c("English", "Irish", "Hindi"),
             salutation = c("Hi", "Dia Duit", "Namaste"))
  }

ui <- shinyUI(fluidPage(
  
  textInput("identity", "Who are you?", value = "World"),
  selectInput("language","What language would you like?", 
              choices = langTable$lanaguge,
  textOutput("helloAns")
))

server <- shinyServer(function(input, output) {
   output$helloAns <- renderText({
    paste(langTable$salutation[langTable$language==input$language], input$identity)
   })
})

shinyApp(ui = ui, server = server, onStart = langTable())