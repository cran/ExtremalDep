\name{lambda.HR}
\alias{lambda.HR}

\title{Valid set of parameters for the 3-dimensional Husler-Reiss model}
\description{
  Given two parameters of the Husler-Reiss model, this function evaluates the
  range of values the third parameter can take to ensure a positive definite
  matrix in the model.
}

\usage{
lambda.HR(lambda)
}

\arguments{
  \item{lambda}{A vector of length 3 containing one \code{NA} and two positive
  values. The \code{NA} corresponds to the parameter for which the range is
  calculated.}
}

\details{
  As indicated in Engelke et al. (2015), the matrix with zero diagonal and
  squared \code{lambda} parameters on the off-diagonal needs to be strictly
  conditionally negative definite.
}

\value{
  A \eqn{2 \times 3} matrix with, on the top, the lowest value of the parameter
  corresponding to the \code{NA} value in the input, and on the bottom the
  largest value.
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com}.
}

\references{
  Engelke, S., Malinowski, A., Kabluchko, Z., and Schlather, M. (2015).
  Estimation of Husler-Reiss distributions and Brown-Resnick processes.
  \emph{Journal of the Royal Statistical Society: Series B (Methodological)},
  \bold{77}, 239--265.
}

\examples{
ls <- lambda.HR(c(1, 2, NA))
dExtDep(
  x = c(0.1, 0.7, 0.2),
  method = "Parametric",
  model = "HR",
  par = ls[1, ],
  angular = TRUE
)
}

\keyword{models}
