functions {
#include /include/block_diag.stan
#include /include/sratio.stan
}

#include /include/hierarchical_ordered_data.stan
#include /include/hierarchical_ordered_parameters.stan

model {
#include /include/hierarchical_ordered_pmodel.stan
  y ~ sratio(X * beta + Z * gamma, threshold);
}
