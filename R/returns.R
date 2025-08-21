####################### START RETURN VALUES ####################################

################################################################################
# P(Y_1 > y_1,Y_2 > y_2) = int_0^1 min(w/y_1, 1-w/y_2) h(w) dw               ###
# INPUT:                                                                     ###
# x is an object of class ExtDep_npBayes, output of fExtDep.np function      ###
# summary.mcmc is the output of summary.bbeed function                       ###
# y = c(y_1, y_2) vector/matrix of thresholds                                ###
################################################################################

# x is an object of class ExtDep_npBayes

returns <- function(x, summary.mcmc, y, plot = FALSE, data = NULL, ...) {
  # P(X>x,Y>y) = int_0^1 min(w/x,1-w/y) h(w) dw
  # y = c(y_1, y_2) vector of thresholds

  if (missing(summary.mcmc)) {
    burn <- round(length(x$k))
    summary.mcmc <- summary.ExtDep_npBayes(object = x, burn = burn)
    message("summary.mcmc computed using a burnin period where half of posterior is discarded.")
  }

  # Check if margins were fitted and transform to unit Frechet if needed
  if ("mar1" %in% names(x)) {
    z <- cbind(
      sapply(y[, 1], function(x) trans.UFrech(c(x, summary.mcmc$mar1.mean))),
      sapply(y[, 2], function(x) trans.UFrech(c(x, summary.mcmc$mar2.mean)))
    )
  } else {
    z <- y
  }

  # Subroutine
  returns.int <- function(y, eta) {
    k <- length(eta) - 1
    p0 <- eta[1]
    p1 <- 1 - eta[k + 1]

    v <- y[1] / sum(y)
    j <- 1:k
    P <- diff(eta) * (j * pbeta(v, j + 1, k - j + 1) / y[1] +
      (k - j + 1) * pbeta(1 - v, k - j + 2, j) / y[2])

    return(2 * sum(P) / (k + 1))
  }

  id1 <- which(x$k == summary.mcmc$k.median)
  idb1 <- id1[which(id1 >= summary.mcmc$burn)]

  etalow <- apply(x$eta[idb1, 1:(summary.mcmc$k.median + 1)], 2, quantile, .05)
  etaup <- apply(x$eta[idb1, 1:(summary.mcmc$k.median + 1)], 2, quantile, .95)
  etamean <- colMeans(x$eta[idb1, 1:(summary.mcmc$k.median + 1)])
  etamedian <- apply(x$eta[idb1, 1:(summary.mcmc$k.median + 1)], 2, quantile, .5)

  uno <- due <- tre <- quattro <- nrow(y)
  for (i in 1:nrow(y)) {
    uno[i] <- returns.int(y = z[i, ], etalow)
    due[i] <- returns.int(y = z[i, ], etaup)
    tre[i] <- returns.int(y = z[i, ], etamean)
    quattro[i] <- returns.int(y = z[i, ], etamedian)
  }

  rrmcmc <- rowMeans(cbind(uno, due, tre, quattro))

  if (plot) {
    plot.ExtDep_npBayes(
      x = x, type = "returns", summary.mcmc = summary.mcmc,
      y = y, probs = rrmcmc, data = data, ...
    )
  }

  return(rrmcmc)
}

#################### END RETURN VALUES #########################################
