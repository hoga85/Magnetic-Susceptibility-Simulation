
rm(list=ls()) 
library(stats)
library(svDialogs) # pop out box for user input
source("Rlib/relaxationTime.R")
source("Rlib/susceptibility.R")
source("Rlib/plotXvsT.R")
source("Rlib/HTcurveFit.R")

############################
## The rationale of the simulation is that the static susceptibility should be related to the relaxation time.
## Because the relaxation time is similar to the susceptibility, they both indicate how easy the magnetic dipolar can be rotated. 
############################

#---------- Relaxation Time of MNPs -------------#
    Tao0 <- 2e-11 # second
    Keff <- 14000 # Anisotropy constant: J/m3
    KB <- 1.38065e-23 # J/K
    Rcnm <-15.4/2 # what is the diameter you want to simulate?
    Rc <- Rcnm*1e-9  # m # core radius
    RH <- Rc+5.5e-9 # m #hydrolic radius
    Vc <- (4/3)*pi*(Rc^3) 
    n <- 0.1 # Pas = j.s/m3 # viscosity
    
    #-------Temperature Range------#
    TFe <- 5:600  # K # The temperature range of MNPs
    Relaxation <- relaxationTime(Tao0,Keff,Vc,KB,TFe,n,RH)
    
    Tao <- Relaxation$Tao
    
    
#---------- Susceptibility -------------#
for (freq in seq(1000,1000000,by = 1000)){
    X <- susceptibility(freq,Tao)
    plotXvsT(TFe,X)
    print(freq)
    Sys.sleep(0.1)
}




