# rstansequential: ordinal sequential regression models in Python
#
# Copyright (C) Simon Dirmeier
#
# This file is part of rstansequential.
#
# rstansequential is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# rstansequential is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with rstansequential. If not, see <http://www.gnu.org/licenses/>.
#
#
# @author = 'Simon Dirmeier'
# @email = 'simon.dirmeier@web.de'


#' @title Data sets for sequential models
#'
#' @export
#'
#' @description Generate the model matrices and response vector
#'  required for \code{link{rstan}{sampling}}
#'
#' @param formula an `lme4`-style formula
#' @param data a data frame containing the variables specified in `forumla`
#' @param family name of the family to be used
#'
#' @return returns a \code{\link[rstan]{stan.fit}} object
#'
#' @examples
#' data("tonsil")
#' fit(tonsil ~ carrier, tonsil, "sratio", iter = 1000, chains = 2)
#'
#' data("wine")
#' fit(rating ~ temperature + (1 | judge), wine, iter = 1000, chains = 2)
#'
make_standata <- function(
  formula,
  data,
  family = c("cumulative", "sratio", "cratio"))
  {
  dat <- brms::make_standata(formula, data, match.arg(family))

  stan.dat <- list(
    N = dat$N,
    K = dat$K,
    P = ncol(dat$X),
    X = dat$X,
    y = dat$Y
  )

  if (length(grep("J_", names(dat))) > 1) {
    stop("rstansequential only supports a single group factor. please change")
  }

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


#' @noRd
stan_model <- function(family = c("cumulative", "sratio", "cratio"),
                       is.hierarchical = FALSE) {
  mod <- match.arg(family)
  if (is.hierarchical) mod <- paste0("hierarchical_", mod)
  stanmodels[[mod]]
}
