
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
