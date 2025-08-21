\name{model}
\alias{model}

\title{Extract the model attribute}

\description{
  Extracts the model name from a fitted object.
}

\usage{
model(x)
}

\arguments{
  \item{x}{An object of class \code{ExtDep_Bayes}, \code{ExtDep_Freq}, or \code{ExtDep_Spat}.}
}

\value{
  A character string.
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com}
}

\seealso{
  \code{\link{fExtDepSpat}}, \code{\link{fExtDep}}
}

\examples{
data(pollution)
f.hr <- fExtDep(
  x = PNS, method = "PPP", model = "HR",
  par.start = rep(0.5, 3), trace = 2
)
model(f.hr)
}

\keyword{models}
