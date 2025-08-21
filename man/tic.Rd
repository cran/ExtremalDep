\name{tic}
\alias{tic}

\title{Extract the Takeuchi Information Criterion}
\description{This function extracts the TIC value from a fitted object.}

\usage{
tic(x, digits = 3)
}

\arguments{
  \item{x}{An object of class \code{ExtDep_Freq} or \code{ExtDep_Spat}.}
  \item{digits}{Integer indicating the number of decimal places to report. Default is 3.}
}

\value{
  A numeric vector containing the TIC value(s) of the fitted object.
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com};
}

\seealso{
  \code{\link{fExtDep}}, \code{\link{fExtDepSpat}}
}

\examples{
data(pollution)

f.hr <- fExtDep(
  x = PNS,
  method = "PPP",
  model = "HR",
  par.start = rep(0.5, 3),
  trace = 2
)

tic(f.hr)
}

\keyword{models}