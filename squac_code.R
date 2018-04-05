library("quantreg")

GetStat = function(Y,Z=1,tauseq,empirical=FALSE){
  n = dim(Y)[1]
  p = dim(Y)[2]
  m = length(tauseq)
  d = p*(p-1)/2
  
  if(length(Z)>1){
    q = dim(Z)[2]
  }
  
  Ycat = matrix(0,n,p)
  for(i in 1:p){
    if(length(Z)>1){
      fit = rq(Y[,i]~Z,tau=tauseq)
      Zmat = cbind(rep(1,n),Z)
      Q = Zmat%*%(fit$coefficient)
    }else{
      Q = matrix(rep(quantile(Y[,i],probs=tauseq),n),n,length(tauseq),byrow=TRUE)
    }
    Y.c = (matrix(rep(Y[,i],m),n)<=Q)*1
    Ycat[,i]=apply(Y.c,1,assign.order)
  }
  
  #tm = Sys.time()
  tmp = diag(1,p,p)
  twoIdx = which(upper.tri(tmp,diag=FALSE),arr.ind=TRUE)
  rm(tmp)
  Ycatpair1 = Ycat[,twoIdx[,1]]
  Ycatpair2 = Ycat[,twoIdx[,2]]
  if(empirical ==TRUE){
    margct = matrix(0,(m+1),p)
    for(t in 1:(m+1)){
      margct[t,] = apply((Ycat==t),2,sum)
    }
    margctpair1 = margct[,twoIdx[,1]]
    margctpair2 = margct[,twoIdx[,2]]
  }else{
    probseq = matrix(c(tauseq,1)-c(0,tauseq),m+1,1)
    Ept = c(n*probseq%*%t(probseq))
  }
  rm(twoIdx)
  X2 = vector("numeric",d)
  for(t in 1:((m+1)^2)){
    t1 = ceiling(t/(m+1))
    t2 = t - (m+1)*(t1-1)
    #cat("t1=",t1," t2=",t2,"\n")
    Bull = (Ycatpair1==t1)&(Ycatpair2==t2)
    Obs = apply(Bull,2,sum)
    if(empirical == TRUE){
      Ept = margctpair1[t1,]*margctpair2[t2,]/n 
      X2 = X2 + (Obs-Ept)^2/Ept
    }else{
      X2 = X2 + (Obs-Ept[t])^2/Ept[t]
    }
  }
  #print(Sys.time()-tm)  
  
  return(X2)
}

ChisqRule = function(X2,alpha,df){
  d = length(X2)
  X2.ord = order(X2, decreasing=TRUE)
  X2s = X2[X2.ord]
  P2s = 1-pchisq(X2s, df=df)
  FDRh = P2s*d/(1:d)
  R =  sum(FDRh<=alpha)
  Rej = X2.ord[1:R]
  return(Rej)
}

assign.order=function(vec){
  order.calc=length(vec)+1
  if(max(vec)==1){order.calc=which.max(vec)}
  return(order.calc)
}
