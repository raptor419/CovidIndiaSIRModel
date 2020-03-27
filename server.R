###################
# server.R
# 
# For all your server needs 
###################

library(deSolve)
source('./functions.R')

server <- function(input, output, session) {
  #print(input)
  #N <- population[input$variable]
  #N
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2]
    t <- 1:input$time
    #init <- c(S = 114200000-2,I = 2, R = 0)
    parms <- c(beta[input$variable],gamma[input$variable],population[input$variable])
    names(parms) <- c("beta","gamma","N")
    #parms
    init <- c(suscep[input$variable],infected[input$variable],recovered[input$variable])
    names(init) <- c("S","I","R")
    #init
    fit <- data.frame(ode(y = init, times = t, func = SIR, parms = parms))
    col <- 1:3 # colour
    matplot(fit$time, fit[ , 2:4], type = "l", xlab = "Day", ylab = "Number of subjects", lwd = 2, lty = 1, col = col)
    #points(Day, Infected)
    legend("bottomright", c("susceptible", "infected", "recovered"), lty = 1, lwd = 2, col = col, inset = 0.05)
    title(title[input$variable], outer = TRUE, line = -2)
    #R0 <- setNames(Opt_par["beta"] / Opt_par["gamma"], "R0")
    #fit[fit$I == max(fit$I), "I", drop = FALSE] # height of pandemic
    #max_infected <- max(fit$I)
    #max_infected / 5 
    #max_infected * 0.06 # cases with need for intensive care
    #max_infected * 0.007 # deaths with supposed 0.7% fatality rate
    # bins <- seq(min(x), max(x), length.out = input$time + 1)
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
  }) 
}
