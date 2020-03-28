###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    
    menuItem("SIR Models", tabName = "dashboard", icon = icon("dashboard"), selected = T),
    menuItem("SIR Models (/w sucep)", tabName = "sir2", icon = icon("dashboard"), selected = T),
    menuItem("Temperature Models", tabName = "tempmodel", icon = icon("dashboard")),
    menuItem("Spread Simulation", tabName = "covidmodel", icon = icon("dashboard"))
    
  )
)
