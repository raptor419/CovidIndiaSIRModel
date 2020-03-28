###################
# server.R
# 
# For all your server needs 
###################

library(deSolve)
library(deSolve)
library(lubridate)
library(reshape2)
library(ggplot2)
library(gam)
source('./functions.R')

server <- function(input, output, session) {

  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    N <<- population[input$variable]
    Infected <<- infected_states[[input$variable]]
    Infected <<- Infected*input$mf
    
    init <<- c(population[input$variable]-Infected[1]-recovered[input$variable],Infected[1],recovered[input$variable])
    names(init) <<- c("S","I","R")
    Day <<- 1:length(Infected)
    Opt <- optim(c(0.5, 0.5), RSS,method = "L-BFGS-B",lower = c(0.001, 0.001), upper = c(1, 1))
    Opt_par <- setNames(Opt$par, c("beta","gamma"))
    # print(Opt_par)
    t <- 1:input$time
    fit <- data.frame(ode(y = init, times = t, func = SIR, parms = Opt_par))
    col <- 1:3 # colour
    matplot(fit$time, fit[ , 3:4], type = "l", xlab = "Day", ylab = "Number of subjects", lwd = 2, lty = 1, col = col)
    ## Warning in xy.coords(x, y, xlabel, ylabel, log = log): 1 y value <= 0## omitted from logarithmic plot
    points(Day, Infected)
    legend("topleft", c("infected", "recovered"), lty = 1, lwd = 2, col = col, inset = 0.05)
    title(title[input$variable], outer = TRUE, line = -2)

  }) 
  
  output$tempPlot <- renderPlot({

    
    leadtime <- input$leadtime
    state <- input$state
    data <- ts_ana_covid19(lead_Time = leadtime, State_nam = state)
    indian_cases_state_temp = data
    ymax = max(data$indian_cases_state_temp$Total.Confirmed.cases_diff, 70)
    par(mar = c(10,1,1,1))
    plot( indian_cases_state_temp$Total.Confirmed.cases_diff ~ indian_cases_state_temp$Date,
          type = "l", ylim = c(0,ymax),ylab = "Value" ,xlab = ".",las = 2 )
    lines(indian_cases_state_temp$Avg_temp[-1], col = "2")
    legend("topleft", legend = c("New Cases", "Avg Temperatue"), 
           col = c("black", "red"),lty=1:2, cex=0.8)

    title(title[input$state], outer = TRUE, line = -2)
    
  }) 
  
  output$tempPlot2 <- renderPlot({
    
    
    leadtime <- input$leadtime
    state <- input$state
    data <- ts_ana_covid19(lead_Time = leadtime, State_nam = state)
    indian_cases_state_temp = data
    ymax = max(data$indian_cases_state_temp$Total.Confirmed.cases_diff, 70)
    
    State_nam = state
    
    par(mar =c(6,2,8,2))
    par(mfrow = c(1,2))
    ccf(indian_cases_state_temp$Total.Confirmed.cases_diff,indian_cases_state_temp$Avg_temp , 
        main = paste0( State_nam," "  , "Average temperature Vs New confirmed cases"))
    ccf(indian_cases_state_temp$Total.Confirmed.cases_diff,indian_cases_state_temp$QV2M , 
        main = paste0( State_nam," "  , "Humidity Vs New confirmed cases"))
    
    title(title[input$state], outer = TRUE, line = -2)
    
  }) 

  output$gamsumm <- renderText({
    leadtime <- input$leadtime
    state <- input$state
    data <- ts_ana_covid19(lead_Time = leadtime, State_nam = state)
    indian_cases_state_temp = data
    ymax = max(data$indian_cases_state_temp$Total.Confirmed.cases_diff, 70)
    lead_Time = input$leadtime
    indian_cases_state_temp
    
    indian_cases_state_temp$Total_new_cases_lead2 <- lag(indian_cases_state_temp$Total.Confirmed.cases_diff, lead_Time)
    
    my_formula <- reformulate(termlabels = c("Total.Confirmed.cases_diff",
                                             "Avg_temp", "RH2M"),
                              response = "Total_new_cases_lead2")
    
    model <- gam(my_formula, data = indian_cases_state_temp, family=poisson)
    state_model_summ = summary(model)
    capture.output(print(state_model_summ))
    
    })
  # 
  # output$tempPlot <- renderPlot({
  #   
  #   
  #   leadtime <- input$leadtime
  #   state <- input$state
  #   data <- ts_ana_covid19(lead_Time = leadtime, State_nam = state)
  #   indian_cases_state_temp = data
  #   ymax = max(data$indian_cases_state_temp$Total.Confirmed.cases_diff, 70)
  #   par(mar = c(10,1,1,1))
  #   plot( indian_cases_state_temp$Total.Confirmed.cases_diff ~ indian_cases_state_temp$Date,
  #         type = "l", ylim = c(0,ymax),ylab = "Value" ,xlab = ".",las = 2 )
  #   lines(indian_cases_state_temp$Avg_temp[-1], col = "2")
  #   legend("topleft", legend = c("New Cases", "Avg Temperatue"), 
  #          col = c("black", "red"),lty=1:2, cex=0.8)
  #   
  #   State_nam = state
  #   
  #   par(mar =c(6,2,8,2))
  #   par(mfrow = c(1,2))
  #   ccf(indian_cases_state_temp$Total.Confirmed.cases_diff,indian_cases_state_temp$Avg_temp , 
  #       main = paste0( State_nam," "  , "Average temperature Vs New confirmed cases"))
  #   ccf(indian_cases_state_temp$Total.Confirmed.cases_diff,indian_cases_state_temp$QV2M , 
  #       main = paste0( State_nam," "  , "Humidity Vs New confirmed cases"))
  #   
  #   lead_Time = leadtime
  #   indian_cases_state_temp$Total_new_cases_lead2 <- lag(indian_cases_state_temp$Total.Confirmed.cases_diff, lead_Time)
  #   
  #   my_formula <- reformulate(termlabels = c("Total.Confirmed.cases_diff",
  #                                            "Avg_temp", "RH2M"),
  #                             response = "Total_new_cases_lead2")
  #   
  #   model <- gam(my_formula, data = indian_cases_state_temp, family=poisson)
  #   state_model_summ = summary(model) 
  #   
  #   
  #   title(title[input$state], outer = TRUE, line = -2)
  #   
  # }) 
  
}
