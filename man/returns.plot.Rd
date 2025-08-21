\name{returns.plot}
\alias{returns.plot}

\title{Plot return levels}

\description{
  Displays return levels for bivariate and trivariate extreme value models.
}

\usage{
returns.plot(model, par, Q.fix, Q.range, Q.range0, cond, labels, cex.lab, ...)
}

\arguments{
  \item{model}{A string giving the name of the model considered.
    Takes values \code{"HR"}, \code{"ET"} or \code{"EST"}.}
  \item{par}{A numeric vector representing the parameters of the model.}
  \item{Q.fix}{A vector of length equal to the model dimension, indicating
    fixed quantiles for computing joint return levels. Must contain
    \code{NA} (maximum 2) for components whose quantiles are allowed to vary.}
  \item{Q.range}{A vector or matrix indicating quantile values on the unit
    Frechet scale, for the components allowed to vary. Must be a vector or a
    one-column matrix if there is one \code{NA} in \code{Q.fix}, or a
    two-column matrix if there are two \code{NA}s.}
  \item{Q.range0}{An object of the same format as \code{Q.range},
    corresponding to quantiles on the original scale.}
  \item{cond}{Logical; if \code{TRUE}, conditional return levels are
    computed where the conditional event is the fixed event. Default is
    \code{FALSE}.}
  \item{labels}{A character vector giving axis labels. Must be of length
    \eqn{1}{1} or \eqn{2}{2} for uni/bi-variate return levels.}
  \item{cex.lab}{A positive numeric value indicating label size.}
  \item{...}{Additional graphical arguments passed to
    \code{\link{plot}} and \code{\link{contour}}.}
}

\details{
  Two cases are possible: univariate and bivariate return levels. Model
  dimensions are restricted to a maximum of three. In this case:
  \itemize{
    \item A univariate return level fixes two components.
    \item A bivariate return level fixes one component.
  }

  The choice of fixed components is determined by the positions of the
  \code{NA} values in \code{Q.fix}.

  If \code{par} is a vector, the corresponding return level(s) are printed.
  If \code{par} is a matrix, return level(s) are evaluated for each parameter
  vector and the mean and empirical \eqn{95\%}{95\%} interval are displayed.
  This is typically used with posterior samples. If \code{par} has only two
  rows, the resulting plots may be uninformative.

  When contours are displayed, levels correspond to deciles.
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com}
}

\seealso{
  \code{\link{dExtDep}}, \code{\link{index.ExtDep}}
}

\examples{
data(pollution)

X.range <- seq(from = 68, to = 400, length = 10)
Y.range <- seq(from = 182.6, to = 800, length = 10)

transform <- function(x, data, par) {
  data <- na.omit(data)
  if (x > par[1]) {
    emp.dist <- mean(data <= par[1])
    dist <- 1 - (1 - emp.dist) *
      max(0, 1 + par[3] * (x - par[1]) / par[2])^(-1 / par[3])
  } else {
    dist <- mean(data <= x)
  }
  return(-1 / log(dist))
}

Q.range <- cbind(
  sapply(X.range, transform, data = winterdat[, 1],
         par = c(68, 36.7, 0.29)),
  sapply(Y.range, transform, data = winterdat[, 1],
         par = c(183, 136.7, 0.13))
)
Q.range0 <- cbind(X.range, Y.range)

\donttest{
  returns.plot(model = "HR", par = c(0.6, 0.9, 1.0),
               Q.fix = c(NA, NA, 7),
               Q.range = Q.range, Q.range0 = Q.range0,
               labels = c("PM10", "NO"))
}
}

\keyword{models}
