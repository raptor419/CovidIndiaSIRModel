###################
# sidebar.R
# 
# Create the sidebar menu options for the ui.
###################
library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(

    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    
  )
)
