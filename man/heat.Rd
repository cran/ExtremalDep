\name{heat}
\alias{heat}
\alias{heatdata}
\alias{locgrid}
\alias{mellat}
\alias{mellon}
\alias{scalegrid}
\alias{shapegrid}

\title{Summer temperature maxima in Melbourne, Australia between 1961 and 2010}

\description{
The dataset corresponds to summer temperature maxima taken over the period from August to April inclusive, recorded between 1961 and 2010 at 90 stations arranged on a 0.15 degree grid in a 9 by 10 formation.
}

\details{
The first maximum is taken over the August 1961 to April 1962 period, and the last maximum is taken over the August 2010 to April 2011 period.  

The object \code{heatdata} contains the core of the data:
\describe{
  \item{vals}{A \eqn{50 \times 90} matrix containing the \eqn{50} summer maxima at the \eqn{90} locations.}
  \item{sitesLL}{A \eqn{90 \times 2} matrix containing the site locations in latitude-longitude, recentered (means subtracted).}
  \item{sitesEN}{A \eqn{90 \times 2} matrix containing the site locations in eastings-northings, recentered (means subtracted).}
  \item{hits}{A \eqn{50 \times 90} integer matrix indicating the ``heatwave'' number associated with each summer maximum. Locations on the same row with the same integer indicate maxima arising from the same heatwave, defined over a three-day window.}
  \item{sitesLLO}{A \eqn{90 \times 2} matrix containing the site locations in latitude-longitude, on the original scale.}
  \item{sitesENO}{A \eqn{90 \times 2} matrix containing the site locations in eastings-northings, on the original scale.}
  \item{ufvals}{A \eqn{50 \times 90} matrix containing the \eqn{50} summer maxima at the \eqn{90} locations, standardized to the unit Frechet scale.}
}

Standardisation to the unit Frechet scale is performed as in Beranger et al. (2021) by fitting the GEV distribution marginally, using unconstrained location and scale parameters and a shape parameter specified as a linear function of eastings and northings (in 100 km units). The resulting estimates are stored in the objects \code{locgrid}, \code{scalegrid}, and \code{shapegrid}, which are \eqn{10 \times 9} matrices.  

Details about the study region are given in \code{mellat} and \code{mellon}, vectors of length \eqn{10} and \eqn{11}, which provide the latitude and longitude coordinates of the grid.
}

\references{
Beranger, B., Stephenson, A. G. and Sisson, S. A. (2021).  
High-dimensional inference using the extremal skew-\eqn{t} process.  
\emph{Extremes}, \bold{24}, 653-685.
}

\examples{
image(x = mellon, y = mellat, z = locgrid)
points(heatdata$sitesLLO, pch = 16)
}

\keyword{datasets}
