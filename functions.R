###################
# functions.R
# 
# Need some functions for your ui logic or server?? Define em' here.
###################

library(deSolve)
SIR <- function(time, state, parameters) {
  par <- as.list(c(state, parameters))
  #N <- N
  with(par, {
    dS <- -beta/N * I * S
    dI <- beta/N * I * S - gamma * I
    dR <- gamma * I
    list(c(dS, dI, dR))
  })}