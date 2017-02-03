# Author: brian_carter@optum.com
# Date: 06-Jan-2017

#### Intent ####
# illustrate Shiny UI Layout paradaigm

library(shiny)

ui <- shinyUI(fluidPage(
  
  sidebarLayout(
    sidebarPanel(
 
      checkboxInput("dummyBox","Check and uncheck"),
      sliderInput("dummySlider","Move the slider",
                  min = 0,max = 1,value = 0.5)
    ), #end of sidebarPanel
    
    mainPanel(
      h1("Nothing here to see")
      ) #end of mainPainel
  )#end of sidebarLayout
)#end of fluidPage
)#end of UI

server <- shinyServer(function(input, output) {
  
})

shinyApp(ui = ui, server = server)

### 
#tabsetPanel(
#tabPanel("Tab1",h1("Not a lot in tab1")),
#tabPanel("Tab2", h2("Or tab two but smaller")))