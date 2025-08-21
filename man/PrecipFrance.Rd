\name{PrecipFrance}
\alias{PrecipFrance}
\alias{precip}
\alias{lat}
\alias{lon}

\title{Weekly maxima of hourly rainfall in France}

\description{
  A list containing the weekly maxima of hourly rainfall during the fall
  season from 1993 to 2011, recorded at 92 stations across France
  (\code{precip}). Coordinates of the monitoring stations are provided in
  \code{lat} and \code{lon}.
}

\details{
  The fall season corresponds to the September--November (SON) period. The
  data cover a 12-week period over \eqn{19}{19} years, yielding a sample of
  \eqn{228}{228} observations (rows) and \eqn{92}{92} stations (columns).
}

\format{
  A list containing:
  \itemize{
    \item \code{precip}: a \eqn{228 \times 92}{228*92} matrix of weekly maxima
    of hourly rainfall.
    \item \code{lat}: a numeric vector of length \eqn{92}{92} giving the station
    latitudes.
    \item \code{lon}: a numeric vector of length \eqn{92}{92} giving the station
    longitudes.
  }
}

\keyword{datasets}
