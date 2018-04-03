# squac

# This respository contains two R scripts.

# squac_code.R has two functions: "GetStat" is the function that returns the chi-square statistics. It has four arguments: Y is $n$ by $p$ matrix of outcome variables, Z is $n$ by $p_x$ matrix of covariates, tauseq is the vector of inner quantile levels $(\tau_1,\ldots,\tau_{D-1})$, and empirical is a bull variable to set whether we use theoretical or empirical conditional quantiles in calculting the chi-square statistics. Set Z=1 if you want to test for marginal quantial associations. "ChisqRule" is the function that returns the squencing order of rejected hypotheses. It has three arguments: X2 is the returned chi-square statistics from the function "GetStat", alpha is the desired FDR level, and df is the degree of freedom of the test.

# Example.R exhibits an example of how to use the code to perform analysis.





