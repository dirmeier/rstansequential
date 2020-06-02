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
