

relaxationTime <- function(Tao0,Keff,Vc,KB,TFe,n,RH){
  
  
  
  fNeel <- (1/(2*pi*Tao0))* exp((-Keff*Vc)/(KB*TFe))
  TaoNeel <- 1/((2*pi)*fNeel)
  fBrown <- (KB*TFe)/(8*(pi^2)*n*(RH^3))                 
  TaoBrown <- 1/((2*pi)*fBrown)
  Tao <-1/((1/TaoBrown)+(1/TaoNeel))
  freqRelaxation <- 1/((2*pi)*Tao)
  new<-data.frame(TaoNeel,TaoBrown,Tao,fNeel,fBrown,freqRelaxation)
  
  return(new)  
}