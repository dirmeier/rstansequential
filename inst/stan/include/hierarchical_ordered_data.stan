
data {
  int<lower=1> N;
  int<lower=1> K;
  int<lower=1> P;
  matrix[N, P] X;
  int<lower=1, upper=K> y[N];
  int<lower=1> Q;
  matrix[N, Q] Z;
  int<lower=1> n_coef;
  int<lower=1> n_levels;
}
