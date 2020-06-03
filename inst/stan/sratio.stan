functions {
#include /include/sratio.stan
}


data {
  int<lower=1> N;
  int<lower=1> K;
  int<lower=1> P;
  matrix[N, P] X;
  int<lower=1, upper=K> y[N];
}


parameters {
  ordered[K - 1] threshold;
  vector[P] beta;
}


model {
  beta ~ normal(0, 1);
  threshold ~ student_t(3, 0, 10);

  y ~ sratio(X * beta, threshold);
}


generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = sratio_scalar_lpmf(y[i] | X[i] * beta, threshold);
  }
}
