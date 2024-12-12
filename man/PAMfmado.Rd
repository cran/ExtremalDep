\name{PAMfmado}
\alias{PAMfmado}

\title{Clustering of maxima}

\description{Clustering of times series of maxima based on the pam package tailored for the F-madogram distance}

\usage{
PAMfmado(x, K, J = 0, threshold = 0.99, max.min = 0)
}

\arguments{
  \item{x}{x a matrix of maxima. For example, number of stations = ncol(x) and time series length = nrow(x) for weekly maxima of precipitation.}
  \item{K}{number of clusters}
  \item{J}{number of resampling for which the stations are randomly moved to break the dependence. By default, \code{J=0} means no resampling.}
  \item{threshold}{Threshold corresponding to the quantile level for the resampling. The resulting quantile is printed (when \code{J} does not take value \code{0}).}
  \item{max.min}{A threshold to remove very small values. For example, some raingauges cannot go below 2 mm. By default, \code{max.min=0}.}
}

\value{
an object of class \code{"pam"} representing the clustering. See \code{?pam.object} for details.
}

\references{
Bernard E., Naveau P., Vrac M. and Mestre O. (2013).
Clustering of maxima: Spatial dependencies among heavy rainfall in France. 
\emph{Journal of Climate 26}, 7929--7937. 

Naveau, P., A. Guillou, D. Cooley, and J. Diebolt (2009).
Modeling pairwise dependence of maxima in space. 
\emph{Biometrika 96}(1).

Cooley, D., P. Naveau, and P. Poncet (2006).
Variograms for spatial max-stable random fields. 
In: Bertail, P., Soulier, P., Doukhan, P. (eds) \emph{Dependence in Probability and Statistics. Lecture Notes in Statistics}, vol 187. Springer, New York, NY .

Reynolds, A., Richards, G., de la Iglesia, B. and Rayward-Smith, V. (1992). 
Clustering rules: A comparison of partitioning and hierarchical clustering algorithms. 
\emph{Journal of Mathematical Modelling and Algorithms 5}, 475-504.
}

\author{
Philippe Naveau}

\seealso{
See the function as \link[cluster:pam]{pam} in the package \code{cluster}
}

\examples{
data(PrecipFrance)
attach(PrecipFrance)
PAMmado <- PAMfmado(precip,7) 
}

