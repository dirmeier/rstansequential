
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
#' @return returns a \code{\link[rstan]{stanfit}} object
#'
#' @examples
#' \dontrun{
#'  data(wine)
#'  fit(rating ~ temperature + (1 | judge), wine, iter = 1000, chains = 2)
#' }
#'
#' @references
#'  McCullagh, P (1980), Regression models for ordinal data,
#' \emph{Journal of the Royal Statistical Society: Series B (Methodological),
#'  42(2)}
#'
#' Tutz, G (1991), Sequential models in categorical regression,
#'  \emph{Computational Statistics & Data Analysis, 11(3)}
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
