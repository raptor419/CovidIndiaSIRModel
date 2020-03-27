###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

states <- c("up","rj","k","dl","mh","kr","in")

beta <- c(0.08624820,0.04375409,0.08871372,0.03007128,0.2409253,0.03447875,0.4527266)

gamma <- c(0.05386429 ,0,0,0,0.1635416,0,0.2043396)

infected <- c(0.301030,0.301030 ,0.301030,0.301030,0.7781513,0.301030,0.301030)

suscep <- c(8.009026,7.537189,7.240549,6.977724,7.2795149,7.505828,8.825815)

recovered <- c(0,0,3,0,0,0,3)


title <- c("SIR model Covid-19 Uttar Pradesh, Population = 20.42 Crores","SIR model Covid-19 Rajasthan, Population = 6.89 Crores","SIR model Covid-19 Kerala, Population = 3.48 Crores","SIR model Covid-19 Delhi, Population = 1.9 Crores","SIR model Covid-19 Maharashtra, Population = 11.42 Crores","SIR model Covid-19 Karnataka, Population = 6.41 Crores","SIR model Covid-19 India, Population = 133.92 Crores")

population <- c(log(204200000,base=10),log(68900000,base=10),log(34800000,base=10),log(19000000,base=10),log(114200000,base=10),log(64100000,base=10),log(1339200000,base=10))

names(population) <- states

names(title) <- states
names(infected) <- states

names(suscep) <- states

names(recovered) <- states

names(beta) <- states
names(gamma) <- states
