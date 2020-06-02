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


#' @title  Infer the parameters of a (hierarchical) sequential regression
#' model using Stan.
#'
#' @export
#' @description Infers posterior distributions of the parameters
#'  of a sequential regression model using
#'  Stan's dynamic Hamiltonian Monte Carlo sampler.
#'
#' @param formula an `lme4`-style formula
#' @param data a data frame containing the variables specified in `forumla`
#' @param family name of the family to be used
#' @param ... additional parameters passed to \code{\link[rstan]{sampling}}
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
fit <- function(formula,
                data,
                family = c("cumulative", "sratio", "cratio"), ...) {
  stan.data <- make_standata(formula, data, family)
  stan.model <- stan_model(family, !is.null(stan.data$Z))

  ft <- rstan::sampling(
    stan.model,
    data = stan.data,
    ...
  )

  ft
}
