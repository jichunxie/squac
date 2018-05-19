# squac

This respository contains two R scripts, and a manuscript on the squac method.

1. squac_code.R has three functions.
   - "GetStat" is a function that returns the chi-square statistics. It has four arguments: Y is $n$ by $p$ matrix of outcome variables, Z is $n$ by $p_x$ matrix of covariates, tauseq is the vector of inner quantile levels $(\tau_1,\ldots,\tau_{D-1})$, and empirical is a bull variable to set whether we use theoretical or empirical conditional quantiles in calculting the chi-square statistics. Set Z=1 if you want to test for marginal quantial associations. 
   - "ChisqRule" is a function that returns the squencing order of rejected hypotheses. It has three arguments: X2 is the returned chi-square statistics from the function "GetStat", alpha is the desired FDR level, and df is the degree of freedom of the test. 
   - "Ind2Matind" is a function that change the linear index of a upper triangular matrix to the row and column indices of the matrix.
   - "assign.order" is an internal function used in "GetStat".

2. example.R exhibits an example of data analysis.

3. "squac.pdf" is the manuscript on the squac method, titled "False Discovery Rate Control for High-Dimensional Networks of Quantile Associations Conditioning on Covariates". It includes both the main paper part and the supplementary materials.
