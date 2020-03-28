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
          sliderInput("mf",
                      "Multiplication Factor:",
                      min = 2,
                      max = 10,
                      value = 4),
          selectInput("variable", "Variable:",
                      c("Uttar Pradesh" = "up",
                        "Rajasthan" = "rj",
                        "Karnataka" = "kr",
                        "Delhi" = "dl",
                        "Maharashtra" = "mh",
                        "Kerala" = "k", 
                        "India" = "ind")),
          
          
        ),
        # PLOT THE THTINGS
        # box( tableOutput("data") ),
        box( plotOutput("distPlot")),
        
       
      )
    ),

    ########################
    # Second tab content
    ########################
    tabItem(
      tabName = "covidmodel",
      includeHTML("./components/covid.html")
    ),

    tabItem(
      tabName = "tempmodel",
      fluidRow(
        
        # CONTROLS
        box(
          
          title = "Parameters",
          
          sliderInput("leadtime",
                      "Lead Time:",
                      min = 0,
                      max = 200,
                      value = 100),
          
          selectInput("state", "State:",
                      c("Kerala" = "Kerala",
                        "Delhi" = "Delhi",
                        "Maharashtra" = "Maharashtra",
                        "Rajasthan" = "Rajasthan",
                        "Karnataka" = "Karnataka")),
          
        ),
        # PLOT THE THTINGS
        # box( tableOutput("data") ),
        box( plotOutput("tempPlot")),
        box( plotOutput("tempPlot2")),
        box( pre(textOutput("gamsumm")), tags$style(type="text/css", "#gamsumm {white-space: pre-wrap;}"))

      )
        
    )

  )
)	