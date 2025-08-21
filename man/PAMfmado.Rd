\name{PAMfmado}
\alias{PAMfmado}

\title{Clustering of maxima}

\description{
  Performs clustering of time series of maxima using the \code{pam} algorithm 
  tailored for the F-madogram distance.
}

\usage{
PAMfmado(x, K, J = 0, threshold = 0.99, max.min = 0)
}

\arguments{
  \item{x}{A matrix of maxima. For example, for weekly maxima of precipitation,
  the number of stations is \code{ncol(x)} and the time series length is \code{nrow(x)}.}
  \item{K}{Number of clusters.}
  \item{J}{Number of resamplings for which the stations are randomly moved to break
  the dependence. By default, \code{J = 0} means no resampling.}
  \item{threshold}{Quantile level used for the resampling threshold. 
  The corresponding quantile is printed (when \code{J} is not \code{0}).}
  \item{max.min}{A lower threshold to remove very small values. 
  For example, some rain gauges cannot go below 2 mm. Default is \code{0}.}
}

\value{
  An object of class \code{"pam"} representing the clustering. 
  See \code{\link[cluster]{pam.object}} for details.
}

\references{
Bernard, E., Naveau, P., Vrac, M. and Mestre, O. (2013).  
Clustering of maxima: Spatial dependencies among heavy rainfall in France.  
\emph{Journal of Climate} \bold{26}, 7929--7937.  

Naveau, P., Guillou, A., Cooley, D. and Diebolt, J. (2009).  
Modeling pairwise dependence of maxima in space.  
\emph{Biometrika} \bold{96}(1).  

Cooley, D., Naveau, P. and Poncet, P. (2006).  
Variograms for spatial max-stable random fields.  
In: Bertail, P., Soulier, P., Doukhan, P. (eds) \emph{Dependence in Probability and Statistics. Lecture Notes in Statistics}, vol 187. Springer, New York, NY.  

Reynolds, A., Richards, G., de la Iglesia, B. and Rayward-Smith, V. (1992).  
Clustering rules: A comparison of partitioning and hierarchical clustering algorithms.  
\emph{Journal of Mathematical Modelling and Algorithms} \bold{5}, 475--504.  
}

\author{
Philippe Naveau
}

\seealso{
\code{\link[cluster]{pam}}
}

\examples{
data(PrecipFrance)
PAMmado <- PAMfmado(PrecipFrance$precip, 7)
}
