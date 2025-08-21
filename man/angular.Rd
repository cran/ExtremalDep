\name{angular}
\alias{angular}

\title{Estimation of the angular density, angular measure, and random generation from the angular distribution}

\description{
Empirical estimation of the Pickands dependence function, the angular density,
the angular measure, and random generation of samples from the estimated angular density.
}

\usage{
angular(data, model, n, dep, asy, alpha, beta, df, seed, k, nsim, 
        plot = TRUE, nw = 100)
}

\arguments{
  \item{data}{The dataset in vector form.}
  \item{model}{A character string specifying the model. Must be one of:
    \code{"log"}, \code{"alog"}, \code{"hr"}, \code{"neglog"}, \code{"aneglog"},
    \code{"bilog"}, \code{"negbilog"}, \code{"ct"}, \code{"amix"}, \code{"Extremalt"}.}
  \item{n}{The number of random generations from the \code{model}. Required if \code{data = NULL}.}
  \item{dep}{The dependence parameter for the \code{model}.}
  \item{asy}{A vector of length two for asymmetry parameters, required for
    asymmetric logistic (\code{model = 'alog'}) and asymmetric negative logistic
    (\code{model = 'aneglog'}) models.}
  \item{alpha,beta}{Parameters for the bilogistic, negative bilogistic, Coles-Tawn,
    and asymmetric mixed models.}
  \item{df}{The degrees of freedom for the Extremal-t model.}
  \item{seed}{Seed for data generation. Required if \code{data = NULL}.}
  \item{k}{The polynomial order.}
  \item{nsim}{The number of generations from the estimated angular density.}
  \item{plot}{Logical; if \code{TRUE}, plots the fitted angular density, histogram
    of generated observations, and true angular density (if \code{model} is specified).}
  \item{nw}{The number of points at which the estimated functions are evaluated.}
}

\details{
See Marcon et al. (2017) for details.
}

\value{
A list containing:
\describe{
  \item{model}{The specified model.}
  \item{n}{Number of random generations.}
  \item{dep}{Dependence parameter.}
  \item{data}{Input dataset.}
  \item{Aest}{Estimated Pickands dependence function.}
  \item{hest}{Estimated angular density.}
  \item{Hest}{Estimated angular measure.}
  \item{p0,p1}{Point masses at the edge of the simplex.}
  \item{wsim}{Simulated sample from the angular density.}
  \item{Atrue,htrue}{True Pickands dependence function and angular density,
    if \code{model} is specified.}
}
}

\author{
  Simone Padoan, \email{simone.padoan@unibocconi.it},
  \url{https://faculty.unibocconi.it/simonepadoan/};
  Boris Beranger, \email{borisberanger@gmail.com},
  \url{https://www.borisberanger.com};
  Giulia Marcon, \email{giuliamarcongm@gmail.com}
}

\references{
Marcon, G., Naveau, P. and Padoan, S. A. (2017).
A semi-parametric stochastic generator for bivariate extreme events,
\emph{Stat 6}(1), 184--201.
}

\examples{
################################################
# The following examples correspond to left panels
# of Figures 1, 2 & 3 from Marcon et al. (2017)
################################################

## Figure 1 - symmetric logistic
\donttest{
# Strong dependence
a <- angular(model = 'log', n = 50, dep = 0.3,
             seed = 4321, k = 20, nsim = 10000)
# Mild dependence
b <- angular(model = 'log', n = 50, dep = 0.6,
             seed = 212, k = 10, nsim = 10000)
# Weak dependence
c <- angular(model = 'log', n = 50, dep = 0.9,
             seed = 4334, k = 6, nsim = 10000)
}

## Figure 2 - asymmetric logistic
\donttest{
# Strong dependence
d <- angular(model = 'alog', n = 25, dep = 0.3,
             asy = c(0.3,0.8), seed = 43121465, k = 20, nsim = 10000)
# Mild dependence
e <- angular(model = 'alog', n = 25, dep = 0.6,
             asy = c(0.3,0.8), seed = 1890, k = 10, nsim = 10000)
# Weak dependence
f <- angular(model = 'alog', n = 25, dep = 0.9,
             asy = c(0.3,0.8), seed = 2043, k = 5, nsim = 10000)
}
}
