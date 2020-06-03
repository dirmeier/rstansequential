functions {
#include /include/block_diag.stan
#include /include/cratio.stan
}


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


transformed data {
  int nr = n_coef > 1 ? n_coef : 0;
}


parameters {
  ordered[K - 1] threshold;
  vector[P] beta;

  vector[Q] gamma;
  vector<lower=0>[n_coef] sigma;
  cholesky_factor_corr[nr] Omega;
}


transformed parameters {
  matrix[nr, nr] R;
  if (n_coef > 1) {
    R = diag_pre_multiply(sigma, Omega);
  }
}


model {
  matrix[Q, Q] G;
  if (n_coef > 1) {
    G = block_diag(R, n_levels);
  } else {
    G = diag_matrix(rep_vector(sigma[1]^2, n_levels));
  }

  beta ~ normal(0, 1);
  threshold ~ student_t(3, 0, 10);

  sigma ~ normal(0, 1);
  Omega ~ lkj_corr_cholesky(1);
  gamma ~ multi_normal_cholesky(rep_vector(0, Q), G);

  y ~ cratio(X * beta + Z * gamma, threshold);
}


generated quantities {
  vector[N] log_lik;
  for (i in 1:N) {
    log_lik[i] = cratio_scalar_lpmf(y[i] | X[i] * beta + Z[i] * gamma, threshold);
  }
}
