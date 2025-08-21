\name{rExtDepSpat}
\alias{rExtDepSpat}

\title{Random generation of max-stable processes}

\description{
Generates realizations from a max-stable process.
}

\usage{
rExtDepSpat(n, coord, model = "SCH", cov.mod = "whitmat", grid = FALSE,
            control = list(), cholsky = TRUE, ...)
}

\arguments{
  \item{n}{An integer indicating the number of observations.}

  \item{coord}{A vector or matrix corresponding to the coordinates of locations
  where the process is simulated. Each row corresponds to a location.}

  \item{model}{A character string indicating the max-stable model. See \code{details}.}

  \item{cov.mod}{A character string indicating the correlation function. See \code{details}.}

  \item{grid}{Logical; \code{TRUE} if coordinates are on a grid.}

  \item{control}{A named list with arguments:
    \describe{
      \item{nlines}{Number of lines of the TBM simulation.}
      \item{method}{Character string specifying the simulation method: \code{'exact'}, \code{'tbm'} or \code{'circ'}.}
      \item{uBound}{Uniform upper bound.}
    }
    See \code{details}.
  }

  \item{cholsky}{Logical; if \code{TRUE}, a Cholesky decomposition is performed.
  Used for the extremal-t and extremal skew-t models when
  \code{control = list(method = 'exact')}.}

  \item{...}{Additional parameters of the max-stable model. See \code{details}.}
}

\details{
This function extends the \code{rmaxstab} function from the \code{SpatialExtremes} package in two ways:

\describe{
  \item{1.}{The \bold{extremal skew-t} model is included.}
  \item{2.}{The function returns the hitting scenarios, i.e., the index of which 'storm'
  (or process) led to the maximum value for each location and observation.}
}

Available max-stable models:

\describe{
  \item{\bold{Smith model}}{(\code{model = 'SMI'}) does not require \code{cov.mod}. If
  \code{coord} is univariate, \code{var} needs to be specified. For higher dimensions,
  covariance parameters such as \code{cov11}, \code{cov12}, \code{cov22}, etc. should be provided.}

  \item{\bold{Schlather model}}{(\code{model = 'SCH'}) requires \code{cov.mod} as one of
  \code{'whitmat'}, \code{'cauchy'}, \code{'powexp'} or \code{'bessel'}.
  Parameters \code{nugget}, \code{range} and \code{smooth} must be specified.}

  \item{\bold{Extremal-t model}}{(\code{model = 'ET'}) requires \code{cov.mod} as above.
  Parameters \code{nugget}, \code{range}, \code{smooth} and \code{DoF} must be specified.}

  \item{\bold{Extremal skew-t model}}{(\code{model = 'EST'}) requires \code{cov.mod} as above.
  Parameters \code{nugget}, \code{range}, \code{smooth}, \code{DoF}, \code{alpha} (vector of length 3)
  and \code{acov1}, \code{acov2} (vectors of length equal to number of locations) must be specified.
  The skewness vector is \eqn{\alpha = \alpha_0 + \alpha_1 \textrm{acov1} + \alpha_2 \textrm{acov2}}.}

  \item{\bold{Geometric Gaussian model}}{(\code{model = 'GG'}) requires \code{cov.mod} as above.
  Parameters \code{sig2}, \code{nugget}, \code{range} and \code{smooth} must be specified.}

  \item{\bold{Brown-Resnick model}}{(\code{model = 'BR'}) does not require \code{cov.mod}.
  Parameters \code{range} and \code{smooth} must be specified.}
}

\describe{
  \item{method}{In \code{control}: NULL by default, meaning the function selects the most appropriate simulation technique.
  For the extremal skew-t model, only \code{'exact'} or \code{'direct'} are allowed.}
  \item{nlines}{In \code{control}: default 1000 if \code{NULL}.}
  \item{uBound}{In \code{control}: default reasonable values, e.g., 3.5 for the Schlather model.}
}
}

\value{
A list containing:

\describe{
  \item{vals}{A \eqn{n \times d} matrix with \eqn{n} observations at \eqn{d} locations.}
  \item{hits}{A \eqn{n \times d} matrix of hitting scenarios. Elements with the same integer
  indicate maxima coming from the same 'storm' or process.}
}
}

\author{
Simone Padoan \email{simone.padoan@unibocconi.it}
\url{https://faculty.unibocconi.it/simonepadoan/};
Boris Beranger \email{borisberanger@gmail.com}
\url{https://www.borisberanger.com};
}

\references{
Beranger, B., Stephenson, A. G. and Sisson, S. A. (2021).
High-dimensional inference using the extremal skew-t process.
\emph{Extremes}, \bold{24}, 653--685.
}

\seealso{\code{\link{fExtDepSpat}}}

\examples{
\donttest{
# Generate some locations
set.seed(1)
lat <- lon <- seq(from = -5, to = 5, length = 20)
sites <- as.matrix(expand.grid(lat, lon))

# Example using the extremal-t
set.seed(2)
z <- rExtDepSpat(1, sites, model = "ET", cov.mod = "powexp", DoF = 1,
                 nugget = 0, range = 3, smooth = 1.5,
                 control = list(method = "exact"))
fields::image.plot(lat, lon, matrix(z$vals, ncol = 20))

# Example using the extremal skew-t
set.seed(3)
z2 <- rExtDepSpat(1, sites, model = "EST", cov.mod = "powexp", DoF = 5,
                  nugget = 0, range = 3, smooth = 1.5, alpha = c(0,5,5),
                  acov1 = sites[,1], acov2 = sites[,2],
                  control = list(method = "exact"))
fields::image.plot(lat, lon, matrix(z2$vals, ncol = 20))
}
}

\keyword{models}