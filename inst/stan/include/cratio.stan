
real marg_prob_cont_ratio(int y, real eta, vector c, int K) {
  real val = 0;
  if (y < K) {
    val += 1 - inv_logit(eta - c[y]);
    if (y > 1) {
      for (i in 1:(y - 1)) {
        val *= inv_logit(eta - c[i]);
      }
    }
  }
  else {
    val = prod(inv_logit(eta - c[1:(K - 1)]));
  }

  return val;
}


real cratio_lpmf(int[] y, vector eta, vector c) {
  int N = num_elements(y);
  int K = num_elements(c) + 1;
  real lpmf = 0;

  for (i in 1:N) {
    lpmf += log(marg_prob_cont_ratio(y[i], eta[i], c, K));
  }

  return lpmf;
}


real cratio_scalar_lpmf(int y, real eta, vector c) {
  int K = num_elements(c) + 1;
  return log(marg_prob_cont_ratio(y, eta, c, K));
}
