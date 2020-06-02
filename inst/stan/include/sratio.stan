real marg_prob_stop_ratio(int y, real eta, vector c, int K) {
  real val = 0;
  if (y < K) {
    val += inv_logit(c[y] - eta);
    if (y > 1) {
      for (i in 1:(y - 1)) {
        val *= 1 - inv_logit(c[i] - eta);
      }
    }
  }
  else {
    val = prod(1 - inv_logit(c[1:(K - 1)] - eta));
  }

  return val;
}

real sratio_lpmf(int[] y, vector eta, vector c) {
  int N = num_elements(y);
  int K = num_elements(c) + 1;
  real lpmf = 0;

  for (i in 1:N) {
    lpmf += log(marg_prob_stop_ratio(y[i], eta[i], c, K));
  }

  return lpmf;
}
