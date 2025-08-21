\name{pFailure}
\alias{pFailure}

\title{Probability of Falling into a Failure Region}

\description{
Compute the empirical probability of falling into two types of failure regions, based on exceedances simulated from a fitted extreme-value model.
}

\usage{
pFailure(n, beta, u1, u2, mar1, mar2, type, plot, xlab, ylab, nlevels = 10)
}

\arguments{
  \item{n}{Integer. Number of points generated to compute the empirical probability.}
  \item{beta}{Numeric vector. Bernstein polynomial coefficients.}
  \item{u1, u2}{Numeric vectors of positive thresholds.}
  \item{mar1, mar2}{Numeric vectors. Marginal GEV parameters.}
  \item{type}{Character. Type of failure region:
    \itemize{
      \item \code{"or"} - at least one exceedance,
      \item \code{"and"} - both exceedances,
      \item \code{"both"} - compute both probabilities.}
  }
  \item{plot}{Logical. If \code{TRUE}, display contour plots of the probabilities.}
  \item{xlab, ylab}{Character strings for axis labels in plots.}
  \item{nlevels}{Integer. Number of contour levels for plots.}
}

\details{
The two failure regions are:
\deqn{A_u = \{ (v_1, v_2): v_1 > u_1 \ \textrm{or}\ v_2 > u_2 \}}{Au = {(v1,v2): v1 > u1 or v2 > u2}}
and
\deqn{B_u = \{ (v_1, v_2): v_1 > u_1 \ \textrm{and}\ v_2 > u_2 \}}{Bu = {(v1,v2): v1 > u1 and v2 > u2}}
for \eqn{(v_1, v_2) \in \mathbb{R}_+^2}{(v1,v2) \in R_+^2}, with thresholds \eqn{u_1,u_2 > 0}.

Exceedance samples are generated following Algorithm 3 of Marcon et al. (2017). The empirical estimates are
\deqn{\hat{P}_{A_u} = \frac{1}{n}\sum_{i=1}^n I(y_{i1} > u_1^* \ \textrm{or}\ y_{i2} > u_2^*)}{P^Au = (1/n) sum I(yi1 > u1* or yi2 > u2*)}
and
\deqn{\hat{P}_{B_u} = \frac{1}{n}\sum_{i=1}^n I(y_{i1} > u_1^* \ \textrm{and}\ y_{i2} > u_2^*)}{P^Bu = (1/n) sum I(yi1 > u1* and yi2 > u2*)}.
}

\value{
A list with elements \code{AND} and/or \code{OR}, depending on \code{type}. Each element is a matrix of size \code{length(u1) x length(u2)}.
}

\author{
Simone Padoan \email{simone.padoan@unibocconi.it} (\url{https://faculty.unibocconi.it/simonepadoan/}) \\
Boris Beranger \email{borisberanger@gmail.com} (\url{https://www.borisberanger.com})
}

\references{
Marcon, G., Naveau, P. and Padoan, S.A. (2017).  
A semi-parametric stochastic generator for bivariate extreme events.  
\emph{Stat}, \bold{6}, 184--201.
}

\seealso{
\code{\link{dExtDep}}, \code{\link{rExtDep}}, \code{\link{fExtDep}}, \code{\link{fExtDep.np}}
}

\examples{
# Example: Wind speed and gust data
data(WindSpeedGust)
years <- format(ParcayMeslay$time, format = "\%Y")
attach(ParcayMeslay[years \%in\% 2004:2013, ])

WS_th <- quantile(WS, .9)
DP_th <- quantile(DP, .9)

pars.WS <- evd::fpot(WS, WS_th, model = "pp")$estimate
pars.DP <- evd::fpot(DP, DP_th, model = "pp")$estimate

data_uf <- trans2UFrechet(cbind(WS, DP), type = "Empirical")
rdata <- rowSums(data_uf)
r0 <- quantile(rdata, probs = .90)
extdata <- data_uf[rdata >= r0, ]

SP_mle <- fExtDep.np(x = extdata, method = "Frequentist", k0 = 10, type = "maxima")

\donttest{
pF <- pFailure(
  n = 50000, beta = SP_mle$Ahat$beta,
  u1 = seq(19, 28, length = 200), mar1 = pars.WS,
  u2 = seq(40, 60, length = 200), mar2 = pars.DP,
  type = "both", plot = TRUE,
  xlab = "Daily-maximum Wind Speed (m/s)",
  ylab = "Differential of Pressure (mbar)",
  nlevels = 15
)
}
}

\keyword{models}
