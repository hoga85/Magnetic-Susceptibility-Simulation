
susceptibility<- function(freq,Tao){
  
  W <- 2*pi*freq
  
  X.Re<- 1/(1+(Tao*W)^2)#*(1-(fe*TFe^2))
  X.im<- ((Tao*W)/(1+(Tao*W)^2))#* (1-(fe*TFe^2))
  X.abs <- sqrt(X.Re^2 +X.im^2)
  
  new<-data.frame(X.Re,X.im,X.abs)
  return(new)  
  
}