

make_standata <- function(formula, data, family = c("cumulative", "sratio", "cratio")) {
  dat <- brms::make_standata(formula, data, match.arg(family))

  stan.dat <- list(
    N = dat$N,
    K = dat$K,
    P = ncol(dat$X),
    X = dat$X,
    y = dat$Y,
  )

  if (length(grep("J_", names(dat))) > 1)
    stop("rstansequential only supports a single group factor. please change")

  if (!is.null(dat$Z_1_1)) {
    f <- factor(dat$J_1)
    Ji <- methods::as(f, Class = "sparseMatrix")
    Xi <- do.call("cbind", dat[grep("Z_", names(dat))])
    Zi <- Matrix::t(Matrix::KhatriRao(Ji, t(Xi)))

    stan.dat$Z <- Zi
    stan.dat$Q <- ncol(Zi)
    stan.dat$n_coef <- ncol(Xi)
    stan.dat$n_levels <- length(levels(f))
  }

  stan.dat
}
