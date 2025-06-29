\name{angular.plot}
\alias{angular.plot}

\title{Angular density plot.}
\description{This function displays the angular density for bivariate and trivariate extreme values models.}

\usage{
angular.plot(model, par, log, contour, labels, cex.lab, cex.cont, ...)
}

\arguments{
	\item{model}{A string with the name of the model considered. Takes value \code{"PB"} (Pairwise Beta), \code{"HR"} (Husler-Reiss), \code{"ET"} (Extremal-t), \code{"EST"} (Extremal Skew-t), \code{TD} (Tilted Dirichlet) or \code{AL} (Asymmetric Logistic).}
	\item{par}{A vector representing the parameters of the model.}
	\item{log}{A logical value specifying if the log density is computed (default is \code{TRUE}).}
	\item{contour}{A logical value; if \code{TRUE} the contour levels are displayed. Required for trivariate models only.}
	\item{labels}{A vector of character strings indicating the labels. Must be of length \eqn{1}{1} for bivariate models and \eqn{3}{3} for trivariate models.}
  \item{cex.lab}{A positive real indicating the size of the labels.}
  \item{cex.cont}{A positive real indicating the size of the contour labels.}
  \item{...}{Additional graphical arguments for the \code{hist()} function when \code{style="hist"}.}
}

\details{
  The angular density is computed using the function \code{\link{dExtDep}} with arguments \code{method="Parametric"} and \code{angular=TRUE}.
  
  When contours are displayed, levels are chosen to be the deciles. 
}

\author{
	Simone Padoan, \email{simone.padoan@unibocconi.it},
	\url{https://faculty.unibocconi.it/simonepadoan/};
	Boris Beranger, \email{borisberanger@gmail.com}
	\url{https://www.borisberanger.com};
}


\seealso{\code{\link{dExtDep}} }

\examples{

angular.plot(model="HR", par=0.6)
\dontrun{
angular.plot(model="ET", par=c(0.6, 0.2, 0.5, 2))
}

}

\keyword{models}
