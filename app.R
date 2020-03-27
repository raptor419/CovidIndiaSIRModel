###################
# app.R
# 
# Main controller. 
# Used to import your ui and server components; initializes the app.
###################
library(deSolve)
library(shiny)
library(shinydashboard)

source('./ui.R')
source('./functions.R')
source('./server.R')


shinyApp(ui, server)

