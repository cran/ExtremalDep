\name{dmesn}
\alias{dmesn}
\alias{pmesn}

\title{Bivariate and Trivariate Extended Skew-Normal Distribution}

\description{
Density function and distribution function for the bivariate and trivariate
extended skew-normal (\acronym{ESN}) distribution.
}

\usage{
dmesn(
  x = c(0, 0),
  location = rep(0, length(x)),
  scale = diag(length(x)),
  shape = rep(0, length(x)),
  extended = 0
)

pmesn(
  x = c(0, 0),
  location = rep(0, length(x)),
  scale = diag(length(x)),
  shape = rep(0, length(x)),
  extended = 0
)
}

\arguments{
  \item{x}{Quantile vector of length \code{d = 2} or \code{d = 3}.}
  \item{location}{A numeric location vector of length \code{d}. Default is \code{0}.}
  \item{scale}{A symmetric positive-definite scale matrix of dimension \code{(d, d)}. Default is \code{diag(d)}.}
  \item{shape}{A numeric skewness vector of length \code{d}. Default is \code{0}.}
  \item{extended}{A single extension parameter. Default is \code{0}.}
}

\value{
  \code{dmesn} returns the density, and \code{pmesn} returns the probability,
  of the bivariate or trivariate extended skew-normal distribution with the
  specified \code{location}, \code{scale}, \code{shape}, and \code{extended}
  parameters.  
  If \code{extended = 0}, the skew-normal distribution is obtained.  
  If \code{shape = 0} and \code{extended = 0}, the normal distribution is recovered.
}

\references{
  Azzalini, A. and Capitanio, A. (1999).
  Statistical applications of the multivariate skew normal distribution.
  \emph{J. Roy. Statist. Soc. B} \bold{61}, 579--602.

  Azzalini, A. with the collaboration of Capitanio, A. (2014).
  \emph{The Skew-Normal and Related Families}.
  Cambridge University Press, IMS Monographs series.

  Azzalini, A. and Dalla Valle, A. (1996).
  The multivariate skew-normal distribution.
  \emph{Biometrika} \bold{83}, 715--726.
}

\examples{
sigma1 <- matrix(c(2, 1.5, 1.5, 3), ncol = 2)
sigma2 <- matrix(c(
  2, 1.5, 1.8,
  1.5, 3, 2.2,
  1.8, 2.2, 3.5
), ncol = 3)

shape1 <- c(1, 2)
shape2 <- c(1, 2, 1.5)

dens1 <- dmesn(x = c(1, 1), scale = sigma1, shape = shape1, extended = 2)
dens2 <- dmesn(x = c(1, 1), scale = sigma1)
dens3 <- dmesn(x = c(1, 1, 1), scale = sigma2, shape = shape2, extended = 2)
dens4 <- dmesn(x = c(1, 1, 1), scale = sigma2)

prob1 <- pmesn(x = c(1, 1), scale = sigma1, shape = shape1, extended = 2)
prob2 <- pmesn(x = c(1, 1), scale = sigma1)

\donttest{
prob3 <- pmesn(x = c(1, 1, 1), scale = sigma2, shape = shape2, extended = 2)
prob4 <- pmesn(x = c(1, 1, 1), scale = sigma2)
}
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com}.
}

\keyword{distribution}
