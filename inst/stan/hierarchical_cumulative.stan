functions {
#include /include/block_diag.stan
#include /include/cumulative.stan
}

#include /include/hierarchical_ordered_data.stan
#include /include/hierarchical_ordered_parameters.stan

model {
#include /include/hierarchical_ordered_model.stan
  y ~ cumulative(X * beta + Z * gamma, threshold);
}
