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
