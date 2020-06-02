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

matrix block_diag(matrix qq, int n) {
  int r = 1;
  int sz = rows(qq);
  int Q = sz * n;
  matrix[Q, Q] G;

  for (i in 1:Q) {
    for (j in 1:Q) {
      G[i, j] = 0;
    }
  }

  while (r < Q) {
    G[r:(r + sz - 1), r:(r + sz - 1)] = qq;
    r += sz;
  }

  return G;
}
