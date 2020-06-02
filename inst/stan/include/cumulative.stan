real marg_prob_cumul_logit(int y, real eta, vector c, int K) {
  real val = 0;
   if (y == 1) {
      val = inv_logit(c[1] - eta);
    }
    else if (1 < y && y < K) {
      val = inv_logit(c[y] - eta) - inv_logit(c[y - 1] - eta);
    }
    else {
      val = 1 - inv_logit(c[y - 1] - eta);
    }

    return val;
}

real cumulative_lpmf(int[] y, vector eta, vector c) {
  int N = num_elements(y);
  int K = num_elements(c) + 1;
  real lpmf = 0;

  for (i in 1:N) {
    lpmf += log(marg_prob_cumul_logit(y[i], eta[i], c, K));
  }

  return lpmf;
}
