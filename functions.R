###################
# functions.R
# 
# Need some functions for your ui logic or server?? Define em' here.
###################

library(deSolve)
library(lubridate)
library(reshape2)
library(ggplot2)
library(gam)


SIR <- function(time, state, parameters) {
  par <- as.list(c(state, parameters))
  #N <- N
  with(par, {
    dS <- -beta/N * I * S
    dI <- beta/N * I * S - gamma * I
    dR <- gamma * I
    list(c(dS, dI, dR))
  })}

RSS <- function(parameters) {
  names(parameters) <- c("beta", "gamma")
  out <- ode(y = init, times = Day, func = SIR, parms = parameters)
  fit <- out[ , 3]
  sum((Infected-fit)^2)
}

ts_ana_covid19 <- function(lead_Time, State_nam){
  
  datapath_temp = paste('./India/', State_nam,'/', State_nam, '.csv', sep="", collapse=NULL)
  datapath_cases = './'
  datapath_output = './output/'
  
  print(datapath_temp)
  temp_state <- read.csv(datapath_temp)
  
  indian_cases <- read.csv(paste0(datapath_cases,"India_state_wise.csv"))
  
  State_nam = State_nam
  indian_cases_state <- indian_cases[indian_cases$Name.of.State...UT == State_nam, ]
  
  indian_cases_state$Total.Confirmed.cases <- indian_cases_state$Total.Confirmed.cases..Indian.National. + 
    indian_cases_state$Total.Confirmed.cases...Foreign.National.. 
  
  indian_cases_state$Total.Confirmed.cases_diff <- c(diff(indian_cases_state$Total.Confirmed.cases) , NA)
  indian_cases_state$Total.Confirmed.cases_diff[indian_cases_state$Total.Confirmed.cases_diff < 0] = 0
  
  
  state_ind <-intersect(which(month(indian_cases_state$Date[1]) == temp_state$MO), 
                        which(day(indian_cases_state$Date[1]) == temp_state$DY))
  indian_cases_state_temp <- cbind(indian_cases_state[-nrow(indian_cases_state),],  temp_state[state_ind:nrow(temp_state), ])
  indian_cases_state_temp <- indian_cases_state_temp[-nrow(indian_cases_state_temp),]
  indian_cases_state_temp$Avg_temp <- ((indian_cases_state_temp$T2M_MAX + indian_cases_state_temp$T2M_MIN) / 2)
  
  return(indian_cases_state_temp)
}