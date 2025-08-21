# `ExtremalDep`: Extremal Dependence Models

[![rstudio mirror downloads](https://cranlogs.r-pkg.org/badges/ExtremalDep?color=2ED968)](https://cranlogs.r-pkg.org/)
[![cran version](https://www.r-pkg.org/badges/version/ExtremalDep)](https://cran.r-project.org/package=ExtremalDep)

A set of procedures for parametric and non-parametric modelling of the dependence structure of multivariate extreme-values is provided. The statistical inference is performed with non-parametric estimators, likelihood-based estimators and Bayesian techniques. It adapts the methodologies of Beranger and Padoan (2015) <doi:10.48550/arXiv.1508.05561>, Marcon et al. (2016) <doi:10.1214/16-EJS1162>, Marcon et al. (2017) <doi:10.1002/sta4.145>, Marcon et al. (2017) <doi:10.1016/j.jspi.2016.10.004> and Beranger et al. (2021) <doi:10.1007/s10687-019-00364-0>. This package also allows for the modelling of spatial extremes using flexible max-stable processes. It provides simulation algorithms and fitting procedures relying on the Stephenson-Tawn likelihood as per Beranger at al. (2021) <doi:10.1007/s10687-020-00376-1>.

# Version 0.0.4-2 updates:

- Fixes a typo in `dExtDep()` for in the Asymetric Logistic model;
- Replaces the `Calloc()` and `Free()` calls in the .C files by the R_* prefixed counterparts since STRICT_R_HEADERS=1 becomes the default with R 4.5.0;
- Improves some entries in the manual. 

# Version 0.0.4-3 updates:

- Inclusion of the `PAMfmado()` function written by Philippe Naveau. 

# Version 0.0.4-4 updates:

- Fixes resetting graphical parameters in `plot_ExtDep.np()` when `type = "Qsets"`;
- Replaces `closeAllConnections()` by `stopCluster()` in `fExtDepSpat()`.

# Version 0.0.4-5 updates:

- Improvement to `dExtDep()` function when `model="HR"` and `"ET"`;
- New `lambda.hr()` function that can be used to define the parameters of the trivariate Husler-Reiss model. Given two parameters, a range for the third parameter is provided to ensure positive definite matrices in the exponent function;
- Improve efficiency when manipulating matrices:
	- `t(A) %*% B` is replaced by `crossprod(A,B)` (and vice versa);
	- `solve(A)` is replaced by `chol2inv(chol(A))`;
	- `t(x) %*% solve(A) %*% x` is replaced by `sum(forwardsolve(t(chol(A)),x))`;
- Define outputs of `fExtDep()`, `fExtDep.np()` and `fExtDepSpat()` to be of class `ExtDep_Freq`, `ExtDep_Bayes`, `ExtDep_npFreq`, `ExtDep_npBayes`, `ExtDep_npEmp` and `ExtDep_Spat`;
- Make use of class methods for `plot()` and `summary()` functions replacing the previous `plot.ExtDep()`, etc;
- New `est()`, `StdErr()`, `logLik()`, `bic()`, `tic()` to extract outputs from objects of class `ExtDep_Freq`, `ExtDep_Bayes` and `ExtDep_Spat`.	

# Version 1.0.0 updates:

- Version number has been updated to reflect the regular construction  <major>.<minor>.<patch>.
- Improved formatting across all `.R` files using the `styler` package.
- Improved formatting of all manual (`.Rd`) files to follow the tidyverse style guide (spacing, indentation, line width, ...).