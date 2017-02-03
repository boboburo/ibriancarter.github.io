# Author: brian_carter@optum.com
# Date: 19-Jan-2017

#### Intent ####
# illustrate seperate ui.r and server.R files
# save in a folder and run the shiny app by calling that folder. 
# Make sure you are in the correct working directory to see folder.
# setwd("~/mapr/learning/shiny-server/r-shiny-20-Jan-17/examples/example-5")



library(shiny)

runApp("example-5a",launch.browser =T)
