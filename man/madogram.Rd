\name{madogram}
\alias{madogram}

\title{Madogram-based estimation of the Pickands Dependence Function}

\description{
  Computes a non-parametric estimate of the Pickands dependence function
  \eqn{A(w)} for multivariate data, based on the madogram estimator.
}

\usage{
madogram(w, data, margin = c("emp", "est", "exp", "frechet", "gumbel"))
}

\arguments{
  \item{w}{An \eqn{m \times d} design matrix (see \bold{Details}).}
  \item{data}{An \eqn{n \times d} matrix of data or data frame with \code{d}
  columns. Here, \code{d} is the number of variables and \code{n} the number of
  replications.}
  \item{margin}{A string indicating the type of marginal distributions
  (\code{"emp"} by default, see \bold{Details}).}
}

\details{
  The estimation procedure is based on the madogram as proposed in Marcon et al.
  (2017). The madogram is defined by

  \deqn{
    \nu(\mathbf{w}) =
    \mathbb{E}\left(
      \max_{i=1,\dots,d}\left\lbrace F_i^{1/w_i}(X_i) \right\rbrace
      - \frac{1}{d}\sum_{i=1}^d F_i^{1/w_i}(X_i)
    \right),
  }{
    \nu(w) = E\left[ \max_{i=1,\dots,d}\{F_i^{1/w_i}(X_i)\}
      - \tfrac{1}{d}\sum_{i=1}^d F_i^{1/w_i}(X_i) \right],
  }

  where \eqn{0 < w_i < 1} and
  \eqn{w_d = 1 - (w_1 + \ldots + w_{d-1})}.

  Each row of the design matrix \code{w} is a point in the
  \eqn{d}-dimensional unit simplex.

  If \eqn{X} is a \eqn{d}-dimensional max-stable random vector with exponent
  measure \eqn{V(\mathbf{x})} and Pickands dependence function
  \eqn{A(\mathbf{w})}, then

  \deqn{
    \nu(\mathbf{w}) =
    \frac{V(1/w_1,\ldots,1/w_d)}{1 + V(1/w_1,\ldots,1/w_d)} - c(\mathbf{w}),
  }{
    \nu(w) = V(1/w_1,\ldots,1/w_d) / (1 + V(1/w_1,\ldots,1/w_d)) - c(w),
  }

  where
  \deqn{
    c(\mathbf{w}) = \frac{1}{d}\sum_{i=1}^d \frac{w_i}{1+w_i}.
  }{
    c(w) = d^{-1}\sum_{i=1}^d \frac{w_i}{1+w_i}.
  }

  From this, it follows that
  \deqn{
    V(1/w_1,\ldots,1/w_d) =
    \frac{\nu(\mathbf{w}) + c(\mathbf{w})}{1 - \nu(\mathbf{w}) - c(\mathbf{w})},
  }{
    V(1/w_1,\ldots,1/w_d) =
    (\nu(w) + c(w)) / (1 - \nu(w) - c(w)),
  }

  and
  \deqn{
    A(\mathbf{w}) =
    \frac{\nu(\mathbf{w}) + c(\mathbf{w})}{1 - \nu(\mathbf{w}) - c(\mathbf{w})}.
  }{
    A(w) = (\nu(w) + c(w)) / (1 - \nu(w) - c(w)).
  }

  Marginal treatment:
  \itemize{
    \item \code{"emp"}: empirical transformation of the marginals,
    \item \code{"est"}: maximum-likelihood fitting of the GEV distributions,
    \item \code{"exp"}, \code{"frechet"}, \code{"gumbel"}: parametric GEV
          theoretical distributions.
  }
}

\value{
  A numeric vector of estimates of the Pickands dependence function.
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com};
  Giulia Marcon, \email{giuliamarcongm@gmail.com}
}

\references{
  Marcon, G., Padoan, S.A., Naveau, P., Muliere, P. and Segers, J. (2017).
  Multivariate Nonparametric Estimation of the Pickands Dependence
  Function using Bernstein Polynomials.
  \emph{Journal of Statistical Planning and Inference}, \bold{183}, 1--17.

  Naveau, P., Guillou, A., Cooley, D. and Diebolt, J. (2009).
  Modelling pairwise dependence of maxima in space.
  \emph{Biometrika}, \bold{96}(1), 1--17.
}

\seealso{
  \code{\link{beed}}, \code{\link{beed.confband}}
}

\examples{
x <- simplex(2)
data <- evd::rbvevd(50, dep = 0.4, model = "log", mar1 = c(1,1,1))

Amd <- madogram(x, data, "emp")
Amd.bp <- beed(data, x, 2, "md", "emp", 20, plot = TRUE)

lines(x[,1], Amd, lty = 1, col = 2)
}

\keyword{models}
