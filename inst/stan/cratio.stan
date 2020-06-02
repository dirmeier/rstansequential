functions {
#include /include/cratio.stan
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

  y ~ cratio(X * beta, threshold);
}
