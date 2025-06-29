\name{fExtDep}
\alias{fExtDep}
\alias{plot.ExtDep_Freq}
\alias{logLik.ExtDep_Freq}
\alias{plot.ExtDep_Bayes}
\alias{summary.ExtDep_Bayes}

\title{Extremal dependence estimation}
\description{This function estimates the parameters of extremal dependence models.}

\usage{
fExtDep(x, method="PPP", model, par.start = NULL, 
        c = 0, optim.method = "BFGS", trace = 0,
        Nsim, Nbin = 0, Hpar, MCpar, seed = NULL)
        
\method{plot}{ExtDep_Freq} (x, type, log=TRUE, contour=TRUE, style, labels, 
                           cex.dat=1, cex.lab=1, cex.cont=1, Q.fix, Q.range, 
                           Q.range0, cond=FALSE,...)        
        
\method{logLik}{ExtDep_Freq} (object, ...)

\method{plot}{ExtDep_Bayes} (x, type, log=TRUE, contour=TRUE, style, labels, 
                            cex.dat=1, cex.lab=1, cex.cont=1, Q.fix, Q.range, 
                            Q.range0, cond=FALSE, cred.ci=TRUE, subsamp, ...)          
                            
\method{summary}{ExtDep_Bayes} (object, cred=0.95, plot=FALSE, ...)                            
}

\arguments{
  \item{x}{
\code{fExtDep.np}: A matrix containing the data.

\code{plot} method functions: any object returned by \code{fExtDep}.
}
  \item{object}{
\code{summary.ExtDep_Bayes} method function: A list object of class \code{ExtDep_Bayes}.
  
\code{logLik} method function: any object returned by \code{fExtDep}.
}
	\item{method}{A character string indicating the estimation method inlcuding \code{"PPP"}, \code{"BayesianPPP"} and \code{"Composite"}.}
	\item{model}{A character string with the name of the model. When \code{method="PPP"} or \code{"BayesianPPP"}, this includes \code{"PB"}, \code{"HR"}, \code{"ET"}, \code{"EST"}, \code{TD} and \code{AL} whereas when \code{method="composite"} it is restricted to \code{"HR"}, \code{"ET"} and \code{"EST"}.}
	\item{par.start}{A vector representing the initial parameters values for the optimization algorithm.}
	\item{c}{A real value in \eqn{[0,1]}{[0,1]} required when \code{method="PPP"} or \code{"BayesianPPP"} and \code{model="ET"}, \code{"EST"} and \code{"AL"}. See \code{\link{dExtDep}} for more details.}
	\item{optim.method}{A character string indicating the optimization algorithm. Required when \code{method="PPP"} or \code{"Composite"}. See \code{\link{optim}} for more details.}
	\item{trace}{A non-negative integer, tracing the progress of the optimization. Required when \code{method="PPP"} or \code{"Composite"}. See \code{\link{optim}} for more details.}
	\item{Nsim}{An integer indicating the number of MCMC simulations. Required when \code{method="BayesianPPP"}.}
	\item{Nbin}{An integer indicating the length of the burn-in period. Required when \code{method="BayesianPPP"}.}
	\item{Hpar}{A list of hyper-parameters. See 'details'. Required when \code{method="BayesianPPP"}.}
	\item{MCpar}{A positive real representing the variance of the proposal distirbution. See 'details'. Required when \code{method="BayesianPPP"}.}
	\item{seed}{An integer indicating the seed to be set for reproducibility, via the routine \code{set.seed}.}
	
	\item{type}{For \code{plot} method functions: a character string indicating the type of plot to be displayed. Can take value \code{angular}, \code{pickands} or \code{returns}.}
	\item{log}{Required for \code{plot} method functions with type \code{angular} or \code{pickands}. See \code{\link{angular.plot}} and \code{\link{pickands.plot}}.}
	\item{contour}{Required for \code{plot} method functions with type \code{angular} or \code{pickands}. See \code{\link{angular.plot}} and \code{\link{pickands.plot}}.}
	\item{style}{Required for \code{plot} method functions with type \code{angular}. A character string indicating the plotting style of the 2-dimensional data. Takes value \code{"hist"} or \code{"ticks"} (default). See \bold{details}. }
	\item{labels}{Required for \code{plot} method functions. See \code{\link{angular.plot}}, \code{\link{pickands.plot}} or \code{\link{returns.plot}}.}
	\item{cex.dat}{Required for \code{plot} method functions with type \code{angular}. A positive real indicating the size of the 3-dimensional data points.}
  \item{cex.lab}{Required for \code{plot} method functions. See \code{\link{angular.plot}}, \code{\link{pickands.plot}} or \code{\link{returns.plot}}.}
  \item{cex.cont}{Required for \code{plot} method functions with type \code{angular} or \code{pickands}. See \code{\link{angular.plot}} and \code{\link{pickands.plot}}.}
  \item{Q.fix}{Required for \code{plot} method functions with type \code{returns}. See \code{\link{returns.plot}}.}
  \item{Q.range}{Required for \code{plot} method functions with type \code{returns}. See \code{\link{returns.plot}}.}
  \item{Q.range0}{Required for \code{plot} method functions with type \code{returns}. See \code{\link{returns.plot}}.}
  \item{cond}{Required for \code{plot} method functions with type \code{returns}. See \code{\link{returns.plot}}.}
  \item{cred.ci}{Required for \code{plot} method functions with type \code{returns}. If \code{TRUE}, selects a subsample from the posterior to compute \eqn{95\%}{95\%}credible bands.}
  \item{subsamp}{Required for \code{plot} method functions with type \code{returns} and \code{pred.ci=TRUE}. A percentage indicating the size of the posterior subsample to be considered.}
  
  \item{cred}{A probability indicating the coverage of the credible interval.}
  \item{plot}{A logical value. If \code{TRUE} kernel density plots of the posterior distribution of each parameter is displayed.}
  \item{...}{Additional graphical arguments for the \code{plot} method functions: \code{hist()} function when \code{type="angular"} with \code{style="hist"}, and \code{plot()} and \code{contour()} functions when \code{type="returns"}. For the \code{summary} method function: additional parameters to the \code{density()} function. For the \code{logLik()} function: can provide a \code{digits} argument, an integer indicating the number of decimal places to be reported.}
}

\details{

Regarding the \code{fExtDep.np} function:

  When \code{method="PPP"} the approximate likelihood is used to estimate the model parameters. It relies on the \code{dExtDep} function with argument \code{method="Parametric"} and \code{angular=TRUE}.
  
  When \code{method="BayesianPPP"} a Bayesian estimation procedure of the spatral measure is considered, following Sabourin et al. (2013) and Sabourin & Naveau (2014). The argument \code{Hpar} is required to specify the hyper-parameters of the prior distributions, taking the following into consideration: 
  
  \itemize{
		\item For the \bold{Pairwise Beta model}, the parameters components are independent, log-normal.
	The vector of parameters is of size \code{choose(dim,2)+1} with positive components. The first elements are the
	pairiwse dependence parameters \code{b} and the last one is the global dependence parameter \code{alpha}.
	The list of hyper-parameters should be of the form
	\code{mean.alpha=, mean.beta=, sd.alpha=, sd.beta=};
		\item For the \bold{Husler-Reiss model}, the parameters are independent, log-normally distributed.
	The elements correspond to the \code{lambda} parameter. The list of hyper-parameters should be of the form \code{mean.lambda=, sd.lambda=};
		\item For the \bold{Dirichlet model}, the parameters are independent, log-normally distributed.
	The elements correspond to the \code{alpha} parameter. The list of hyper-parameters should be of the form \code{mean.alpha=, sd.alpha=};
		\item For the \bold{Extremal-t model}, the parameters are independent, logit-squared for \code{rho} and log-normal for \code{mu}. The first elements correspond	to the correlation parameters \code{rho} and the last parameter is the global dependence parameter \code{mu}. The list of hyper-parameters should be of the form \code{mean.rho=, mean.mu=, sd.rho=, sd.mu=};
		\item For the \bold{Extremal skewt-t model}, the parameters are independent, logit-squared for \code{rho}, normal for \code{alpha} and log-normal for \code{mu}. The first elements correspond	to the correlation parameters \code{rho}, then the skewness parameters \code{alpha} and the last parameter is the global dependence parameter \code{mu}. The list of hyper-parameters should be of the form \code{mean.rho=, mean.alpha=, mean.mu=, sd.rho=, sd.alpha=, sd.mu=};
		\item For the \bold{Asymmetric Logistic model}, the parameters' components are independent, log-normal for \code{alpha} and logit for \code{beta}. The list of hyper-parameters should be of the form \code{mean.alpha=, mean.beta=, sd.alpha=, sd.beta=}.
	}
	
	The proposal distribution for each (transformed) parameter is a normal distribution centred on the (transformed) current parameter value, with variance \code{MCpar}. 
	
	When \code{method="Composite"}, the pairwise composite likelihood is applied, based on the \code{dExtDep} function with argument \code{method="Parametric"} and \code{angular=FALSE}.
  
Regarding the code \code{plot} method function:  

  Refer to the \code{\link{angular.plot}}, \code{\link{pickands.plot}} or \code{\link{returns.plot}} functions.
  When displaying the bivariate angular density, there is the choice to summarise the data using a histogram (\code{style="hist"}) or to display the observations using tick marks (\code{style="ticks"}). 
  When displaying the trivariate angular density, the size of the data points can be controlled using \code{cex.dat}.

}

\value{
\code{fExtDep}:
  When \code{method == "PPP"} or \code{"Composite"}, a list of class \code{ExtDep_Freq} is returned including
  \describe{
    \item{model:}{The argument \code{model}.}
    \item{par:}{The estimated parameters.}
    \item{LL:}{The maximised log-likelihood.}
    \item{SE:}{The standard errors.}
    \item{TIC:}{The Takeuchi Information Criterion.}
    \item{data:}{The argument \code{x}.}
  }
  
  When \code{method == "BayesianPPP"}, a list of class \code{ExtDep_Bayes} is returned including 
  
  \describe{
  	\item{stored.vales:}{A \eqn{(Nsim-Nbin)*d} matrix, where \eqn{d} is the dimension of the parameter space}
  	\item{llh:}{A vector of size \eqn{(Nsim-Nbin)} containing the log-likelihoods evaluated at each parameter
		of the posterior sample.}
	  \item{lprior:}{A vector of size \eqn{(Nsim-Nbin)} containing the logarithm of the prior densities evaluated
		at each parameter of the posterior sample.}
		\item{arguments:}{The specifics of the algorithm.}
	  \item{elapsed:}{The time elapsed, as given by \code{proc.time} between the start and end of the run.}
	  \item{Nsim:}{The same as the passed argument.}
	  \item{Nbin:}{Idem.}
	  \item{n.accept:}{The total number of accepted proposals.}
	  \item{n.accept.kept:}{The number of accepted proposals after the burn-in period. }
	  \item{emp.mean:}{The estimated posterior parameters mean.}
	  \item{emp.sd:}{The empirical posterior sample standard deviation.}
	  \item{BIC:}{The Bayesian Information Criteria.}
  }
       
\code{logLik:} method function: A numerical value indicating the value of the maximized log-likelihood.
}

\author{
	Simone Padoan, \email{simone.padoan@unibocconi.it},
	\url{https://faculty.unibocconi.it/simonepadoan/};
	Boris Beranger, \email{borisberanger@gmail.com}
	\url{https://www.borisberanger.com};
}

\references{
	Beranger, B. and Padoan, S. A. (2015).
	Extreme dependence models, chapater of the book \emph{Extreme Value Modeling and Risk Analysis: Methods and Applications},
  \bold{Chapman Hall/CRC}.
  
  Sabourin, A., Naveau, P. and Fougeres, A-L (2013)
  Bayesian model averaging for multivariate extremes
  \emph{Extremes}, \bold{16}, 325-350.
  
  Sabourin, A. and Naveau, P. (2014)
  Bayesian Dirichlet mixture model for multivariate extremes: A re-parametrization
  \emph{Computational Statistics & Data Analysis}, \bold{71}, 542-567.
}

\seealso{\code{\link{dExtDep}}, \code{\link{pExtDep}}, \code{\link{rExtDep}}, \code{\link{fExtDep.np}} }

\examples{

# Example using the Poisson Point Proce Process appraoch
data(pollution)
\donttest{
  f.hr <- fExtDep(x=PNS, method="PPP", model="HR", 
                  par.start = rep(0.5, 3), trace=2)
                  
  plot(x=f.hr, type="angular",
       labels=c(expression(PM[10]), expression(NO), expression(SO[2])), 
       cex.lab=2)
       
  plot(x=f.hr, type="pickands",
       labels=c(expression(PM[10]), expression(NO), expression(SO[2])), 
       cex.lab=2) # Takes time!      
      
}

# Example using the pairwise composite (full) likelihood
\donttest{
  set.seed(1)
  data <- rExtDep(n=300, model="ET", par=c(0.6,3))
  f.et <- fExtDep(x=data, method="Composite", model="ET", 
                  par.start = c(0.5, 1), trace=2)
                  
  plot(x=f.et, type="angular", cex.lab=2)                  
}
}

\keyword{models}
