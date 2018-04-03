# squac

# This respository contains two R scripts.

# squac_code.R has two functions: "GetStat" is the function for obtaining the chi-square statistics, where Y is $n$ by $p$ matrix of outcome variables, Z is $n$ by $p_x$ matrix of covariates. Set Z=1 if you want to test marginal quantial associations, and tauseq is the vector of inner quantile levels $(\tau_1,\ldots,\tau_{D-1})$. "ChisqRule" is the function for performing multiple testing, where X2 is the returned chi-square statistics from the function "GetStat", alpha is the desired FDR level, and df is the degree of freedom of the test.

# Example.R exhibits an example of how to use the code to perform analysis.





