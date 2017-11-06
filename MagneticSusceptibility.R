
rm(list=ls()) 
library(stats)
library(svDialogs) # pop out box for user input

############################
## The rationale of the simulation is that the static susceptibility should be related to the relaxation time.
## Because the relaxation time is similar to the susceptibility, they both indicate how easy the magnetic dipolar can be rotated. 
############################


    Tao0 <- 2e-11 # second
    Keff <- 14000 # J/m3
    KB <- 1.38065e-23 # J/K
    k <- 0
    
for (freq in seq(1,1000000,by = 10000)){
    k<-k+1
    Rcnm <-15.4/2
    Rc <- Rcnm*1e-9  # m
    RH <- Rc+5.5e-9 # m
    Vc <- (4/3)*pi*(Rc^3)
    TFe <- 5:600  # K
    n <- 0.1 # Pas = j.s/m3
    
    fNeel <- (1/(2*pi*Tao0))* exp((-Keff*Vc)/(KB*TFe))
      TaoNeel <- 1/((2*pi)*fNeel)
    fBrown <- (KB*TFe)/(8*(pi^2)*n*(RH^3))                 
      TaoBrown <- 1/((2*pi)*fBrown)
      Tao <-1/((1/TaoBrown)+(1/TaoNeel))
    freqRelaxation <- 1/((2*pi)*Tao)
    
    TBbyTao <- which(abs(round(freqRelaxation-freq,0))<1)
    #########################################
    fe <- 1.7e-5
    

    W <- 2*pi*freq
    
    X.Re<- 1/(1+(Tao*W)^2)#*(1-(fe*TFe^2))
    X.im<- ((Tao*W)/(1+(Tao*W)^2))#* (1-(fe*TFe^2))
    X.abs <- sqrt(X.Re^2 +X.im^2)


    plot(TFe,X.abs,
    xlab = "Temperature of Magnetic Material",
    ylab = "The amplitude of susceptibility")
    
    lines(TFe, X.im, col = "red")
    lines(TFe, X.Re, col = "green")

    grid()
    Vline <- TFe[which(X.im==max(X.im))]
    abline(h=max(X.im))
    abline(v = Vline)
    legend(400,0.8, c("Absolute Value of X",
                      "Real Susceptibility, X'",
                      "Imaginary Susceptibility, X''"),
           lty=c(3,1,1),
           lwd=c(2.5,1.5,1.5),col=c("black","Green","red"))

    text(480,0.4, paste0("Applied Frequency is: ", 
                          toString(freq/1000),
                          " kHz"))
    text(480,0.3, paste0("Blocking Temperature is: ", 
                         toString(Vline),
                         " K"))
    
    print(freq)
    Sys.sleep(0.1)
}




