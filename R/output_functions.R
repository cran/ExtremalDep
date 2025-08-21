est <- function(x, digits = 3) {
  if (inherits(x, "ExtDep_Bayes")) {
    out <- round(x$emp.mean, digits)
  } else if (inherits(x, "ExtDep_Freq")) {
    out <- round(x$par, digits)
  } else if (inherits(x, "ExtDep_Spat")) {
    out <- round(x$est, digits)
  } else {
    stop("`x` must be of class `ExtDep_Bayes`, `ExtDep_Freq` or `ExtDep_Spat`.")
  }

  return(out)
}

model <- function(x) {
  if (inherits(x, c("ExtDep_Bayes", "ExtDep_Freq", "ExtDep_Spat"))) {
    out <- x$model
  } else {
    stop("`x` must be of class `ExtDep_Bayes`, `ExtDep_Freq` or `ExtDep_Spat`.")
  }

  return(out)
}


method <- function(x) {
  if (inherits(x, "ExtDep_Bayes")) {
    out <- "Bayesian model averaging"
  } else if (inherits(x, "ExtDep_Freq")) {
    if (all(rowSums(x$data) == 1)) {
      out <- "Poisson Point Process"
    } else {
      out <- "Pairwise composite likelihood"
    }
  } else if (inherits(x, "ExtDep_Spat")) {
    if ("cmat" %in% names(x)) {
      out <- paste(x$jw, "-wise composite likelihood", sep = "")
    } else {
      out <- "Full likelihood"
    }
  } else {
    stop("`x` must be of class `ExtDep_Bayes`, `ExtDep_Freq` or `ExtDep_Spat`.")
  }

  return(out)
}


tic <- function(x, digits = 3) {
  if (inherits(x, c("ExtDep_Freq", "ExtDep_Spat"))) {
    out <- round(x$TIC, digits)
  } else {
    stop("`x` must be of class `ExtDep_Freq` or `ExtDep_Spat`.")
  }

  return(out)
}


bic <- function(x, digits = 3) {
  if (inherits(x, "ExtDep_Bayes")) {
    out <- round(x$BIC, digits)
  } else {
    stop("`x` must be of class `ExtDep_Bayes`.")
  }

  return(out)
}

# bic.ExtDep_Bayes <- function(x, digits=3){
#   # x is an object of class "ExtDep_Bayes"
#   return(x$BIC)
# }


StdErr <- function(x, digits = 3) {
  if (inherits(x, "ExtDep_Bayes")) {
    out <- round(x$emp.sd, digits)
  } else if (inherits(x, "ExtDep_Freq")) {
    out <- round(x$SE, digits)
  } else if (inherits(x, "ExtDep_Spat")) {
    out <- round(x$stderr.sand, digits)
  } else {
    stop("`x` must be of class `ExtDep_Bayes`, `ExtDep_Freq` or `ExtDep_Spat`.")
  }

  return(out)
}

# stderr.ExtDep_Bayes <- function(x, digits=3){
#   # x is an object of class "ExtDep_Bayes"
#   return(round(x$emp.sd, digits))
# }

# stderr.ExtDep_Freq <- function(x, digits=3){
#   # x is an object of class "ExtDep_Freq"
#   return(round(x$SE, digits))
# }

# stderr.ExtDep_Spat <- function(x, digits=3){
#   # x is an object of class "ExtDepSpat"
#   return(round(x$stderr.sand, digits))
# }


# LogLik <- function(x, digits=3){

#   if(class(x) %in% c("ExtDep_Freq", "ExtDepSpat")){
#     out <- round(x$TIC,digits)
#   }else{
#     stop("`x` must be of class `ExtDep_Freq` or `ExtDep_Spat`.")
#   }

#   return(out)
# }

logLik.ExtDep_Freq <- function(object, ...) {
  # object is an object of class "ExtDep_Freq"

  args <- list(...)
  if ("digits" %in% names(args)) {
    out <- round(object$LL, args$digits)
  } else {
    out <- object$LL
  }

  return(out)
}

logLik.ExtDep_Spat <- function(object, ...) {
  # object is an object of class "ExtDep_Spat"
  args <- list(...)
  if ("digits" %in% names(args)) {
    out <- round(object$LL, args$digits)
  } else {
    out <- object$LL
  }

  return(out)
}
