\name{pickands.plot}
\alias{pickands.plot}

\title{Plot for the Pickands dependence function}

\description{
This function displays the Pickands dependence function for bivariate and 
trivariate extreme values models.
}

\usage{
pickands.plot(model, par, labels, cex.lab, contour, cex.cont)
}

\arguments{
  \item{model}{A string with the name of the model considered. Takes value 
  \code{"HR"}, \code{"ET"} or \code{"EST"}.}
  \item{par}{A vector representing the parameters of the model.}
  \item{labels}{A vector of character strings indicating the labels. Must be of 
  length \eqn{1}{1} for bivariate models and \eqn{3}{3} for trivariate models.}
  \item{cex.lab}{A positive real indicating the size of the labels.}
  \item{contour}{A logical value; if \code{TRUE} the contour levels are displayed. 
  Required for trivariate models only.}
  \item{cex.cont}{A positive real indicating the size of the contour labels.}
}

\details{
The Pickands dependence function is computed using the function 
\code{\link{index.ExtDep}} with argument \code{object="pickands"}. 
When contours are displayed, levels are chosen to be the deciles. 
}

\author{
Simone Padoan, \email{simone.padoan@unibocconi.it},
\url{https://faculty.unibocconi.it/simonepadoan/};
Boris Beranger, \email{borisberanger@gmail.com},
\url{https://www.borisberanger.com}
}

\seealso{\code{\link{dExtDep}}}

\examples{
pickands.plot(model="HR", par=0.6)
\dontrun{
pickands.plot(model="ET", par=c(0.6, 0.2, 0.5, 2))
}
}

\keyword{models}
