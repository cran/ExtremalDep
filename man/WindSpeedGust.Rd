\name{WindSpeedGust}
\alias{WindSpeedGust}
\alias{Lingen}
\alias{Ossendorf}
\alias{ParcayMeslay}

\title{Hourly wind gust, wind speed and air pressure at Lingen (GER), Ossendorf (GER) and Parcay-Meslay (FRA).}

\description{
	There are three objects of type \code{data.frame}, one for each location. 
}


\details{

	Each object has the following columns:
	\describe{
	  \item{WS:}{the hourly wind speed in metres per second (m/s);}
		\item{WG:}{the hourly wind gust in metres per second (m/s);}
		\item{DP:}{the hourly air pressure at sea level in millibars.}
	}

  Specifics about each object is given below:
  \describe{
	  \item{Lingen:}{is a \code{data.frame} object	with \eqn{1083} rows and \eqn{4} columns. Measurements are recorded between January 1982 and June 2003;}
	  \item{Ossendorf:}{is a \code{data.frame} object	with \eqn{676} rows and \eqn{4} columns. Measurements are recorded between March 1982 and August 1995;}
	  \item{ParcayMeslay:}{is a \code{data.frame} object	with \eqn{2140} rows and \eqn{4} columns. Measurements are recorded between November 1984 and July 2013.}
	}

	
}

\references{

	Marcon, G., Naveau, P. and Padoan, S.A. (2017)
  A semi-parametric stochastic generator for bivariate extreme events
  \emph{Stat}, \bold{6}, 184-201.

}

\keyword{datasets}
