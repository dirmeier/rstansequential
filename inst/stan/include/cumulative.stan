/*
    rstansequential is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    rstansequential is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with rstansequential.  If not, see <http://www.gnu.org/licenses/>.
*/

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
