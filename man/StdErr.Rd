\name{StdErr}
\alias{StdErr}

\title{Extract the standard errors of estimated parameters}
\description{This function extract the standard errors of estimated parameters from a fitted object..}

\usage{
StdErr(x, digits=3)
}

\arguments{
  \item{x}{An object of class \code{ExtDep_Bayes}, \code{ExtDep_Freq} or \code{ExtDep_Spat}.}
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

\seealso{\code{\link{fExtDepSpat}, \link{fExtDep}} }

\examples{
data(pollution)
f.hr <- fExtDep(x=PNS, method="PPP", model="HR", 
                par.start = rep(0.5, 3), trace=2)
StdErr(f.hr)
}

\keyword{models}
