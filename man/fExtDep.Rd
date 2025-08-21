\name{fExtDep}
\alias{fExtDep}
\alias{plot.ExtDep_Freq}
\alias{logLik.ExtDep_Freq}
\alias{plot.ExtDep_Bayes}
\alias{summary.ExtDep_Bayes}

\title{Extremal Dependence Estimation}
\description{
Estimate the parameters of extremal dependence models using frequentist, composite likelihood, or Bayesian approaches.
}

\usage{
fExtDep(x, method = "PPP", model, par.start = NULL, 
        c = 0, optim.method = "BFGS", trace = 0,
        Nsim, Nbin = 0, Hpar, MCpar, seed = NULL)
        
\method{plot}{ExtDep_Freq}(x, type, log = TRUE, contour = TRUE, style, labels, 
                           cex.dat = 1, cex.lab = 1, cex.cont = 1, Q.fix, Q.range, 
                           Q.range0, cond = FALSE, ...)        
        
\method{logLik}{ExtDep_Freq}(object, ...)

\method{plot}{ExtDep_Bayes}(x, type, log = TRUE, contour = TRUE, style, labels, 
                            cex.dat = 1, cex.lab = 1, cex.cont = 1, Q.fix, Q.range, 
                            Q.range0, cond = FALSE, cred.ci = TRUE, subsamp, ...)          
                            
\method{summary}{ExtDep_Bayes}(object, cred = 0.95, plot = FALSE, ...)                            
}

\arguments{
  \item{x}{
    \code{fExtDep}: A matrix containing the data.  
    \code{plot} methods: an object returned by \code{fExtDep}.
  }
  \item{object}{
    For \code{summary.ExtDep_Bayes}: an object of class \code{ExtDep_Bayes}.  
    For \code{logLik}: an object returned by \code{fExtDep}.
  }
  \item{method}{Estimation method: \code{"PPP"}, \code{"BayesianPPP"}, or \code{"Composite"}.}
  \item{model}{Name of the model. For \code{"PPP"} or \code{"BayesianPPP"}: \code{"PB"}, \code{"HR"}, \code{"ET"}, \code{"EST"}, \code{"TD"}, \code{"AL"}. For \code{"Composite"}: \code{"HR"}, \code{"ET"}, or \code{"EST"}.}
  \item{par.start}{Vector of initial parameter values for optimization.}
  \item{c}{Real in \eqn{[0,1]}{[0,1]}, required for some models under \code{"PPP"} or \code{"BayesianPPP"} (\code{"ET"}, \code{"EST"}, \code{"AL"}). See \code{\link{dExtDep}}.}
  \item{optim.method}{Optimization algorithm (see \code{\link{optim}}). Required for \code{"PPP"} or \code{"Composite"}.}
  \item{trace}{Non-negative integer controlling optimization progress output (see \code{\link{optim}}).}
  \item{Nsim}{Number of MCMC simulations (for \code{"BayesianPPP"}).}
  \item{Nbin}{Burn-in length (for \code{"BayesianPPP"}).}
  \item{Hpar}{List of hyper-parameters (see Details). Required for \code{"BayesianPPP"}.}
  \item{MCpar}{Variance of the proposal distribution (see Details). Required for \code{"BayesianPPP"}.}
  \item{seed}{Integer seed for reproducibility (passed to \code{set.seed}).}
  \item{type}{For \code{plot} methods: plot type, one of \code{"angular"}, \code{"pickands"}, or \code{"returns"}.}
  \item{log}{Logical; applies to \code{"angular"} and \code{"pickands"} plots (see \code{\link{angular.plot}}, \code{\link{pickands.plot}}).}
  \item{contour}{Logical; applies to \code{"angular"} and \code{"pickands"} plots.}
  \item{style}{For \code{"angular"} plots: \code{"hist"} or \code{"ticks"} (default).}
  \item{labels}{Labels for axes in \code{plot} methods.}
  \item{cex.dat}{Point size for 3D angular plots.}
  \item{cex.lab}{Label size in plots.}
  \item{cex.cont}{Contour line size in \code{"angular"} or \code{"pickands"} plots.}
  \item{Q.fix, Q.range, Q.range0, cond}{Arguments for \code{"returns"} plots (see \code{\link{returns.plot}}).}
  \item{cred.ci}{Logical, for \code{"returns"} plots under \code{"BayesianPPP"}; if \code{TRUE}, compute 95\% credible bands.}
  \item{subsamp}{Posterior subsample percentage (used with \code{cred.ci=TRUE}).}
  \item{cred}{Credible interval coverage probability (default 0.95).}
  \item{plot}{Logical; if \code{TRUE}, plot kernel densities of posterior parameters (for \code{summary.ExtDep_Bayes}).}
  \item{...}{Additional graphical or density arguments (see Details).}
}

\details{
\subsection{Estimation:}{
  \itemize{
    \item \code{method="PPP"}: Approximate likelihood estimation using \code{dExtDep(method="Parametric", angular=TRUE)}.  
    \item \code{method="BayesianPPP"}: Bayesian estimation of the spectral measure (Sabourin et al., 2013; Sabourin & Naveau, 2014). Requires \code{Hpar} and \code{MCpar}. Hyper-parameters depend on the model (see references for details).  
    \item \code{method="Composite"}: Pairwise composite likelihood using \code{dExtDep(method="Parametric", angular=FALSE)}.  
  }
}
\subsection{Plotting:}{
  See \code{\link{angular.plot}}, \code{\link{pickands.plot}}, and \code{\link{returns.plot}}.  
  Angular plots can display data as histograms (\code{style="hist"}) or ticks (\code{style="ticks"}). For trivariate cases, use \code{cex.dat} to control point size.  
}
}

\value{
\code{fExtDep}:  
\itemize{
  \item For \code{"PPP"} or \code{"Composite"}: an object of class \code{ExtDep_Freq} with elements  
    \describe{
      \item{model}{The fitted model.}
      \item{par}{Estimated parameters.}
      \item{LL}{Maximized log-likelihood.}
      \item{SE}{Standard errors.}
      \item{TIC}{Takeuchi Information Criterion.}
      \item{data}{Input data.}
    }
  \item For \code{"BayesianPPP"}: an object of class \code{ExtDep_Bayes} with elements  
    \describe{
      \item{stored.values}{Posterior sample matrix of size \eqn{(Nsim-Nbin) \times d}.}
      \item{llh}{Log-likelihoods at posterior samples.}
      \item{lprior}{Log-priors at posterior samples.}
      \item{arguments}{Algorithm details.}
      \item{elapsed}{Elapsed run time.}
      \item{Nsim, Nbin}{Simulation settings.}
      \item{n.accept, n.accept.kept}{MCMC acceptance counts.}
      \item{emp.mean}{Posterior means.}
      \item{emp.sd}{Posterior standard deviations.}
      \item{BIC}{Bayesian Information Criterion.}
    }
}
\code{logLik}: numerical log-likelihood value.  
}

\author{
Simone Padoan (\email{simone.padoan@unibocconi.it}, \url{https://faculty.unibocconi.it/simonepadoan/})  
Boris Beranger (\email{borisberanger@gmail.com}, \url{https://www.borisberanger.com})  
}

\references{
Beranger, B. and Padoan, S. A. (2015). \emph{Extreme Dependence Models}, in \emph{Extreme Value Modeling and Risk Analysis: Methods and Applications}, Chapman & Hall/CRC.  

Sabourin, A., Naveau, P., and Fougeres, A.-L. (2013). Bayesian model averaging for multivariate extremes. \emph{Extremes}, \bold{16}, 325-350.  

Sabourin, A. and Naveau, P. (2014). Bayesian Dirichlet mixture model for multivariate extremes: A re-parametrization. \emph{Computational Statistics & Data Analysis}, \bold{71}, 542-567.  
}

\seealso{\code{\link{dExtDep}}, \code{\link{pExtDep}}, \code{\link{rExtDep}}, \code{\link{fExtDep.np}}}

\examples{
# Poisson Point Process approach
data(pollution)
\donttest{
  f.hr <- fExtDep(x = PNS, method = "PPP", model = "HR", 
                  par.start = rep(0.5, 3), trace = 2)
  plot(f.hr, type = "angular",
       labels = c(expression(PM[10]), expression(NO), expression(SO[2])), 
       cex.lab = 2)
  plot(f.hr, type = "pickands",
       labels = c(expression(PM[10]), expression(NO), expression(SO[2])), 
       cex.lab = 2) # may be slow
}

# Pairwise composite likelihood
\donttest{
  set.seed(1)
  data <- rExtDep(n = 300, model = "ET", par = c(0.6, 3))
  f.et <- fExtDep(x = data, method = "Composite", model = "ET", 
                  par.start = c(0.5, 1), trace = 2)
  plot(f.et, type = "angular", cex.lab = 2)                  
}
}

\keyword{models}
