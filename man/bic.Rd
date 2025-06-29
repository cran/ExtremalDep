\name{bic}
\alias{bic}

\title{Extract the Bayesian Information Criterion}
\description{This function extract the BIC value from a fitted object..}

\usage{
bic(x, digits=3)
}

\arguments{
  \item{x}{An object of class \code{ExtDep_Bayes}.}
  \item{digits}{Integer indicating the number of decimal places to be reported.}
}

\value{
  A vector.
}

\author{
	Simone Padoan, \email{simone.padoan@unibocconi.it},
	\url{https://faculty.unibocconi.it/simonepadoan/};
	Boris Beranger, \email{borisberanger@gmail.com}
	\url{https://www.borisberanger.com};
}

\seealso{\code{\link{fExtDep}}}

\examples{
\dontrun{
data(pollution)
Hpar.hr <- list(mean.lambda=0, sd.lambda=3)
PNS.hr <- fExtDep(x=PNS, method="BayesianPPP", model = "HR", 
                  Nsim=5e+4, Nbin=3e+4, Hpar=Hpar.hr, MCpar=0.35, seed=14342)
bic(PNS.hr)
}
}
\keyword{models}
