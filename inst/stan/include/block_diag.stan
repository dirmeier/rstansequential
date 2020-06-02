
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
