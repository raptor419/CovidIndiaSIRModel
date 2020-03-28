###################
# global.R
# 
# Anything you want shared between your ui and server, define here.
###################

init <- c()
Day <- c()
N <- 0
Infected <- c()

states <- c("up","rj","k","dl","mh","kr","ind")

recovered <- c(0,0,3,0,0,0,3)


title <- c("SIR model Covid-19 Uttar Pradesh, Population = 20.42 Crores","SIR model Covid-19 Rajasthan, Population = 6.89 Crores","SIR model Covid-19 Kerala, Population = 3.48 Crores","SIR model Covid-19 Delhi, Population = 1.9 Crores","SIR model Covid-19 Maharashtra, Population = 11.42 Crores","SIR model Covid-19 Karnataka, Population = 6.41 Crores","SIR model Covid-19 India, Population = 133.92 Crores")

#population <- c(log(204200000,base=10),log(68900000,base=10),log(34800000,base=10),log(19000000,base=10),log(114200000,base=10),log(64100000,base=10),log(1339200000,base=10))

population <-c(199812341,68548437,33406061,16787941,112374333,61130704,1326093247)

up <- c(7 , 7 , 9, 11 ,11  ,7 , 9 , 9 ,10, 11, 10 ,10, 15 ,18 ,22, 22, 26, 26)
mh <- c(2  , 5  ,10  ,11 ,11 ,14 ,32 ,32 ,38  ,41 , 46  ,46  ,62  ,65 , 72  ,87 ,124 ,120)
k <- c(6 ,12 ,14 ,14 ,14 ,16 ,20 ,20 ,23 ,24 ,24 ,25 ,37 ,49 ,64 ,91,105,114)
dl <- c(4 , 4 , 5  ,6 , 6  ,5,  4  ,4  ,5  ,7,  8, 13, 20, 23, 23, 22, 24, 28)
kr <- c(1,  4,  4  ,3 , 4,  5 , 5 , 5 ,10 ,10 ,13 ,14, 13, 23, 30, 33, 37, 37)
ind <- c(43,56,62,73,82,102,113,119,142,156,194,244,330,396,499,536,657,694)
rj <- c(1,1,3,3,3,2,1,1,1,1,4,4,14,21,25,29,33,35)

infected_states <- data.frame(up,mh,k,dl,kr,ind,rj)

names(population) <- states

names(title) <- states
names(infected_states) <- states


names(recovered) <- states