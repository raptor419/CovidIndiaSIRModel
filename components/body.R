###################
# body.R
# 
# Create the body for the ui. 
# If you had multiple tabs, you could split those into their own
# components as well.
###################
library(shiny)
library(shinydashboard)

body <- dashboardBody(
  tabItems(
    
    ########################
    # First tab content
    ########################
    tabItem(
      tabName = "dashboard",
      fluidRow(
        
        # CONTROLS
        box(
          
          title = "Parameters",
          
          sliderInput("time",
                      "Time of Prediction:",
                      min = 0,
                      max = 200,
                      value = 100),
          selectInput("variable", "Variable:",
                      c("Uttar Pradesh" = "up",
                        "Rajasthan" = "rj",
                        "Karnataka" = "kr",
                        "Delhi" = "dl",
                        "Maharashtra" = "mh",
                        "Kerala" = "k", 
                        "India" = "in")),
          
          
        ),
        # PLOT THE THTINGS
        # box( tableOutput("data") ),
        box( plotOutput("distPlot")),
       
      )
    )
  )
)