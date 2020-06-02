/*
 * The `induced_dirichlet_lpdf' is borrowed from Michael Betancourt's case study
 * on ordinal regression: https://betanalpha.github.io/assets/case_studies/ordinal_regression.html
 *
 * @param c: a continuous random vector of size K
 * @param alpha: Dirichlet concentration parameters of size K
 * @param phi: anchor point
 */
real induced_dirichlet_lpdf(vector c, vector alpha, real phi) {
  int K = num_elements(c) + 1;
  vector[K - 1] sigma = inv_logit(phi - c);
  vector[K] p;
  matrix[K, K] J = rep_matrix(0, K, K);

  // induced ordinal probabilities
  p[1] = 1 - sigma[1];
  for (k in 2:(K - 1))
    p[k] = sigma[k - 1] - sigma[k];
  p[K] = sigma[K - 1];

  // baseline column of Jacobian
  for (k in 1:K) J[k, 1] = 1;

  // diagonal entries of Jacobian
  for (k in 2:K) {
    real rho = sigma[k - 1] * (1 - sigma[k - 1]);
    J[k, k] = - rho;
    J[k - 1, k] = rho;
  }

  return dirichlet_lpdf(p | alpha) + log_determinant(J);
}

