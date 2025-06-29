\name{returns.plot}
\alias{returns.plot}

\title{Plot some return levels.}
\description{This function displays return levels for bivariate and trivariate extreme values models.}

\usage{
returns.plot(model, par, Q.fix, Q.range, Q.range0, cond, labels, cex.lab, ...)
}

\arguments{
	\item{model}{A string with the name of the model considered. Takes value \code{"HR"}, \code{"ET"} or \code{"EST"}.}
	\item{par}{A vector representing the parameters of the model.}
	\item{Q.fix}{A vector of length the dimension of the model, indicating some fixed quantiles to compute joint return levels. Must contain \code{NA} (maximum 2) for components whose quantiles are allowed to vary.}
  \item{Q.range}{A vector or matrix indicating quantile values on the unit Frechet scale, for the components that are allowed to vary. Must be a vector or a one-column matrix if there is one \code{NA} in \code{Q.fix}. Must be a two-column matrix if there are two \code{NA}s in \code{Q.fix}.}
  \item{Q.range0}{A object of the same format as \code{Q.range}, corresponding to the quantiles on the original scale.}
  \item{cond}{A logical value; if \code{TRUE} then conditional return levels are computed where the conditional event is the fixed event. Default if \code{FALSE}.}
  \item{labels}{A vector of character strings indicating the labels. Must be of length \eqn{1}{1} or \eqn{2}{2} for uni/bi-variate return levels.}
  \item{cex.lab}{A positive real indicating the size of the labels.}
  \item{...}{Additional graphical arguments for the \code{plot()} and \code{contour()} functions.}
}

\details{
  There are two possibilities: univariate and bivariate return levels. Since the model dimensions are restricted to a maximum of three, in that case, a univariate return level corresponds to fixing two components while a bivariate return level fixes only one component. The choice of the fixed component is decided by the position of the \code{NA} value(s) in the \code{Q.fix} argument. If \code{par} is a vector then the corresponding return level(s) are printed. However if \code{par} is a matrix then the return level(s) are evaluated for each value of the parameter vector and the mean, and empirical \eqn{95\%}{95\%} empirical interval are displayed. Typically this is used when posterior samples are available. When \code{par} is a matrix with only two rows, resulting plots may not provide much information.  
  When contours are displayed, levels are chosen to be the deciles. 
}

\author{
	Simone Padoan, \email{simone.padoan@unibocconi.it},
	\url{https://faculty.unibocconi.it/simonepadoan/};
	Boris Beranger, \email{borisberanger@gmail.com}
	\url{https://www.borisberanger.com};
}


\seealso{\code{\link{dExtDep}}, \code{\link{index.ExtDep}}. }

\examples{
data(pollution)

X.range <- seq(from=68, to=400, length=10)
Y.range <- seq(from=182.6, to=800, length=10)

transform <- function (x, data, par){
  data <- na.omit(data)
  if(x > par[1]){
    emp.dist <- mean(data <= par[1])
    dist <- 1 - ( 1-emp.dist ) * max(0, 1+par[3]*(x-par[1])/par[2])^(-1/par[3])
  }else{
    dist <- mean(data <= x)
  }
  return(-1/log(dist))
}

Q.range <- cbind(sapply(X.range, transform, data=winterdat[,1], par=c(68, 36.7, 0.29)),
                 sapply(Y.range, transform, data=winterdat[,1], par=c(183, 136.7, 0.13)))
Q.range0 <- cbind(X.range, Y.range)


\donttest{
  returns.plot(model="HR", par=c(0.6, 0.9, 1.0), Q.fix=c(NA, NA, 7), 
               Q.range=Q.range, Q.range0=Q.range0, labels = c("PM10", "NO"))
}

}

\keyword{models}
