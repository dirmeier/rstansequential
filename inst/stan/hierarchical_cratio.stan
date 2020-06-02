functions {
#include /include/block_diag.stan
#include /include/cratio.stan
}

#include /include/hierarchical_ordered_data.stan
#include /include/hierarchical_ordered_parameters.stan

model {
#include /include/hierarchical_ordered_model.stan
  y ~ cratio(X * beta + Z * gamma, threshold);
}
