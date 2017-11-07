
plotXvsT<-function(TFe,X){

if (dim(X)[1]==length(TFe)){
  
  X.abs<-X$X.abs
  X.im<-X$X.im
  X.Re<-X$X.Re
  
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
}else{
  print("The lengths of TFe and X do not match.")
}
  
  
  
  
  
  
  
}