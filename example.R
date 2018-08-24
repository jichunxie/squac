
# X2 = GetStat(Y,Z,tauseq)
# Rej = ChisqRule(X2,alpha,df=(length(tauseq))^2)


# tmp = diag(1,p,p)
# twoIdx = which(upper.tri(tmp,diag=FALSE),arr.ind=TRUE)
# twoIdx[Rej,]


# Generate Data
# Y = Z*beta + Y0
# The first 5 Y's are mutually dependent conditioning on Z. Others are mutually independent.
p = 30
p1 = 5
n = 200

set.seed(123)
Z = cbind(matrix(1,n,1),matrix(rnorm(n),n,1))
beta = matrix(rnorm(2*p,mean=1),nrow=2,ncol=p)
Y01 = (diag(0.8,p1,p1) + matrix(0.2,p1,p1))%*%
  matrix(rnorm(p1*n),p1,n)
Y0 = rbind(Y01,matrix(rnorm(n*(p-p1)),nrow=p-p1,ncol=n))
Y = Z%*%beta + t(Y0)

# To run the analysis, first run squac_code.R. 
# Then set tauseq, and run the code as follows.
source("~/Dropbox/SQUAC/GitCode/squac_code.R")
tauseq = c(0.33,0.67)
alpha = 0.05
X2 = GetStat(Y=Y,Z=matrix(Z[,2],n,1),tauseq=tauseq) 
df = (length(tauseq))^2
Rej = ChisqRule(X2,alpha,df,n,p)

# The function "ChisqRule" will return a vector of indices indicating which hypotheses should be rejected. To find out the corresponding pairs of $(Y_i,Y_j)$, use the function Ind2Matind.
Ind2Matind(p,Rej)
