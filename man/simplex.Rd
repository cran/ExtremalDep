\name{simplex}
\alias{simplex}

\title{Definition of a multivariate simplex}
\description{Generation of grid points over the multivariate simplex}

\usage{
simplex(d, n = 50, a = 0, b = 1)
}

\arguments{
  \item{d}{A positive integer indicating the dimension of the simplex.}
  \item{n}{A positive integer indicating the number of grid points to be generated on the univariate components of the simplex.}
  \item{a,b}{Two numeric values indicating the lower and upper bounds of the simplex. By default \code{a = 0} and \code{b = 1}, indicating the unit-simplex.}
}

\details{
  A \eqn{d}{d}-dimensional simplex is defined by
  \deqn{
    S = \{ (\omega_1, \ldots, \omega_d) \in \mathbb{R}^d_+ : \sum_{i=1}^d \omega_i = 1 \}.
  }{
    S = { (\omega_1, \ldots, \omega_d) \in R^d_+ : \sum_{i=1}^d \omega_i = 1 }.
  }

  Here the function defines the simplex as
  \deqn{
    S = \{ (\omega_1, \ldots, \omega_d) \in [a,b]^d : \sum_{i=1}^d \omega_i = 1 \}.
  }{
    S = { (\omega_1, \ldots, \omega_d) \in [a,b]^d : \sum_{i=1}^d \omega_i = 1 }.
  }

  When \code{d = 2} and \eqn{[a,b] = [0,1]}, a grid of points of the form
  \eqn{\{ (\omega_1, \omega_2) \in [0,1] : \omega_1 + \omega_2 = 1 \}}{ (\omega_1, \omega_2) \in [0,1] : \omega_1 + \omega_2 = 1 } is generated.
}

\value{
  Returns a matrix with \eqn{d}{d} columns. 

  When \code{d = 2}, the number of rows is \eqn{n}{n}. 

  When \code{d > 2}, the number of rows is equal to
  \deqn{
    \sum_{i_{d-1}=0}^{n-1} \sum_{i_{d-2}=0}^{n-i_{d-1}} \cdots \sum_{i_1=1}^{n-i_{d-1}-\cdots-i_2} i_1.
  }{
    \sum_{i_{d-1}=0}^{n-1} \sum_{i_{d-2}=0}^{n-i_{d-1}} \cdots \sum_{i_1=1}^{n-i_{d-1}-\cdots-i_2} i_1
  }
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com};
}

\examples{
### 3-dimensional unit simplex
W <- simplex(d = 3, n = 10)
plot(W[,-3], pch = 16)
}

\keyword{multivariate}