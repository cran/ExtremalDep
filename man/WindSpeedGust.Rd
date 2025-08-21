\name{WindSpeedGust}
\alias{WindSpeedGust}
\alias{Lingen}
\alias{Ossendorf}
\alias{ParcayMeslay}

\title{Hourly Wind Gust, Wind Speed, and Air Pressure at Lingen (GER), Ossendorf (GER), and Parcay-Meslay (FRA)}

\description{
  Three \code{data.frame} objects, one for each location.
}

\details{
  Each object contains the following columns:
  \describe{
    \item{WS:}{Hourly wind speed in metres per second (m/s).}
    \item{WG:}{Hourly wind gust in metres per second (m/s).}
    \item{DP:}{Hourly air pressure at sea level in millibars.}
  }

  Details for each object:
  \describe{
    \item{Lingen:}{\code{data.frame} with \eqn{1083} rows and \eqn{4} columns. Measurements recorded between January 1982 and June 2003.}
    \item{Ossendorf:}{\code{data.frame} with \eqn{676} rows and \eqn{4} columns. Measurements recorded between March 1982 and August 1995.}
    \item{ParcayMeslay:}{\code{data.frame} with \eqn{2140} rows and \eqn{4} columns. Measurements recorded between November 1984 and July 2013.}
  }
}

\references{
  Marcon, G., Naveau, P., & Padoan, S.A. (2017).  
  A semi-parametric stochastic generator for bivariate extreme events.  
  \emph{Stat}, \bold{6}, 184-201.
}

\keyword{datasets}