

fit <- function(formula, data, family, ...) {
  stan.data <- make_standata(formula, data, family)
  stan.model <- stan_model()

  rstan::sampling(
    stan.model,
    data = stan.data,
    ...
  )
}
