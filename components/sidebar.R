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
    menuItem("SIR Models (/w susceptibility)", tabName = "sir2", icon = icon("dashboard"), selected = T),
    menuItem("Seasonal Effect Modeling", tabName = "tempmodel", icon = icon("dashboard")),
    menuItem("Agent Based Model", tabName = "covidmodel", icon = icon("dashboard"))
    
  )
)
