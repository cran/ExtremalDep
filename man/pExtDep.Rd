\name{pExtDep}
\alias{pExtDep}

\title{Parametric and Non-Parametric Distribution Function of Extremal Dependence}

\description{
Evaluate the distribution function of parametric multivariate extreme-value distributions 
and the angular probability distribution represented through Bernstein polynomials.
}

\usage{
pExtDep(q, type, method = "Parametric", model, par, plot = TRUE,
        main, xlab, cex.lab, cex.axis, lwd, ...)
}

\arguments{
  \item{q}{A vector or matrix of quantiles.}
  \item{type}{A character string: \code{"lower"}, \code{"inv.lower"} or \code{"upper"}. Required when \code{method = "Parametric"}.}
  \item{method}{A character string: \code{"Parametric"} or \code{"NonParametric"}.}
  \item{model}{A character string with the model name: 
  \code{"HR"} (Husler-Reiss), \code{"ET"} (Extremal-t), or \code{"EST"} (Extremal Skew-t). 
  Required when \code{method = "Parametric"}.}
  \item{par}{A vector or matrix of parameters for the model. If a matrix, rows correspond to different parameter sets.}
  \item{plot}{Logical; if \code{TRUE} (default), a plot is displayed. See \bold{Details}.}
  \item{main, xlab, cex.lab, cex.axis, lwd}{Graphical arguments passed to \code{hist()}.}
  \item{...}{Additional graphical arguments passed to \code{hist()} when \code{plot = TRUE}.}
}

\details{
When \code{method = "Parametric"}, the distribution function is available in 2 or 3 dimensions only. 
See \code{\link{dim_ExtDep}} for the correct length of the parameter vector. \cr

\itemize{
  \item If \code{type = "lower"}, the cumulative distribution function is computed: 
  \deqn{G(x) = P(X \leq x), \quad x \in \mathbb{R}^d, \; d=2,3.}
  \item If \code{type = "inv.lower"}, the survival function is computed: 
  \deqn{1 - G(x) = P(\exists i : X_i > x_i).}
  \item If \code{type = "upper"}, the joint probability of exceedance is computed: 
  \deqn{P(X \geq x).}
}

When \code{method = "NonParametric"}, the distribution function is available in 2 dimensions only. \cr

If \code{par} is a matrix and \code{plot = TRUE}, a histogram of the probabilities is displayed across parameter sets. 
A kernel density estimator, \eqn{2.5\%, 50\%, 97.5\%} quantiles (crosses) and the mean (dot) are added. 
}

\value{
\itemize{
  \item If \code{par} is a vector: returns a scalar (if \code{q} is a vector) or a vector of length \code{nrow(q)} (if \code{q} is a matrix).
  \item If \code{par} is a matrix: returns a vector of length \code{nrow(par)} (if \code{q} is a vector) 
        or a matrix with \code{nrow(par)} rows and \code{nrow(q)} columns (if \code{q} is a matrix).
}
}

\author{
Simone Padoan \email{simone.padoan@unibocconi.it}, 
\url{https://faculty.unibocconi.it/simonepadoan/} \cr
Boris Beranger \email{borisberanger@gmail.com}, 
\url{https://www.borisberanger.com}
}

\references{
Beranger, B. and Padoan, S.A. (2015).
\emph{Extreme Value Modeling and Risk Analysis: Methods and Applications}. 
Chapman & Hall/CRC. \cr

Beranger, B., Padoan, S.A. and Sisson, S.A. (2017).
Models for extremal dependence derived from skew-symmetric families.
\emph{Scandinavian Journal of Statistics}, \bold{44}(1), 21--45. \cr

Husler, J. and Reiss, R.-D. (1989).
Maxima of normal random vectors: between independence and complete dependence.
\emph{Statistics and Probability Letters}, \bold{7}, 283--286. \cr

Marcon, G., Padoan, S.A., Naveau, P., Muliere, P. and Segers, J. (2017).
Multivariate nonparametric estimation of the Pickands dependence
function using Bernstein polynomials.
\emph{Journal of Statistical Planning and Inference}, \bold{183}, 1--17.
}

\seealso{\code{\link{dExtDep}}, \code{\link{rExtDep}}, \code{\link{fExtDep}}, \code{\link{fExtDep.np}}}

\examples{
# Trivariate Extremal Skew-t
pExtDep(q = c(1, 1.2, 0.6), type = "lower", method = "Parametric",
        model = "EST", par = c(0.2, 0.4, 0.6, 2, 2, 2, 1))

# Bivariate Extremal-t
pExtDep(q = rbind(c(1.2, 0.6), c(1.1, 1.3)), type = "inv.lower",
        method = "Parametric", model = "ET", par = c(0.2, 1))

# Bivariate Extremal Skew-t
pExtDep(q = rbind(c(1.2, 0.6), c(1.1, 1.3)), type = "inv.lower",
        method = "Parametric", model = "EST", par = c(0.2, 0, 0, 1))

# Non-parametric angular density
beta <- c(1.0000000, 0.8714286, 0.7671560, 0.7569398,
          0.7771908, 0.8031573, 0.8857143, 1.0000000)
pExtDep(q = rbind(c(0.1, 0.9), c(0.2, 0.8)), 
        method = "NonParametric", par = beta)
}

\keyword{models}
